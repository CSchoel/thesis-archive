import matplotlib.pyplot as plt
import math
import numpy as np
import scipy.signal as sig

def gammln(x):
	cof =[
		76.18009172947146,-86.50532032941677,
		24.01409824083091,-1.231739572450155,
		0.1208650973866179e-2,-0.5395239384953e-5
	]
	tmp = x + 5.5;
	tmp -= (x + 0.5) * math.log(tmp);
	ser = 1.000000000190015;
	y = x
	for c in cof:
		y += 1
		ser += c / y
	return -tmp+math.log(2.5066282746310005*ser/x);

M_LN2 = 0.69314718055994530942

def green(eta, sigma, x):
	nh = 1. + .5 * eta / sigma;
	x2 = x / sigma;
	ln_chisquare = (nh - 1.) * math.log (x2) - .5 * x2 - nh * M_LN2 - gammln (nh);
	return math.exp(ln_chisquare) / sigma

eta = 0.01
sigma = 0.001
blen = 0.1
bstep = 0.0001
xvals = np.arange(0,blen,bstep)+bstep
# construct array with green's function values
data = np.array([green(eta, sigma, x) for x in xvals])
n = len(xvals)
# construct signal
# 0:n = 30
# n:2*n = range(80,125)
# 2*n:3*n = 100
yvals = np.ones(n*3) * 30
yvals[n:2*n] = np.arange(80,125,45.0/n)
yvals[2*n:3*n] = 100
# construct convolution filter
data2 = np.zeros(len(data)*2)
data2[len(data):] = data
# do actual convolution
# remember: convolution filters are applied centered and in inverted direction
broad = np.convolve(yvals, data2, 'same') / sum(data)
# do broadening again "by hand"
broad2 = np.zeros(n*3)
broad2[n:n*3] = np.array([np.dot(data[::-1],yvals[i-n:i]) for i in range(n,n*3)]) / sum(data)
xvals2 = np.arange(0,bstep*n*3,bstep)[:-1]
#print(np.sum(data) * bstep)
f = plt.figure(figsize=(5,4))
ax = f.add_subplot(111)
ax.plot(xvals2, yvals, "r-", label="base signal")
ax.plot(xvals2, broad, "b-", label="broadened")
#ax.plot(xvals2, broad2)
#ax.plot(xvals, data, "g-", label="filter")
ax.set_title("Baroreceptor Broadening")
ax.set_xlabel("time[s]")
ax.set_ylabel("baroreceptor response")
ax.set_xlim([blen*0.5, blen*2.5])
ax.legend(loc="best")
#f.subplots_adjust()
f.tight_layout()
#plt.show()
f.savefig("broad.pdf")
