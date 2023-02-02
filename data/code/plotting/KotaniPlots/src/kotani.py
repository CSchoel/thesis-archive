import numpy as np
import matplotlib.pyplot as plt

def plotTanH():
    basefunc = np.arange(-10,101,dtype=float)
    tanhfunc = basefunc * (np.tanh(basefunc*100.0) + 1) / 2.0
    maxfunc = basefunc.copy()
    maxfunc[np.where(maxfunc<0)] = 0
    plt.plot(basefunc,"b--",label="f(x)")
    plt.plot(tanhfunc,"g",label="f(x) * [tanh(f(x)*100) + 1] / 2")
    print tanhfunc
    plt.plot(maxfunc,"r--",label="max(0,f(x))")
    plt.xlabel("x")
    plt.ylabel("y")
    plt.legend(loc="best")
    plt.show()

def sat(x,satval,p):
    return x + (satval-x) * (x**p*1.0 / (x**p + satval**p))

def plotSatFunc():
    basefunc = np.arange(0,100)/25.0
    satfunc1 = np.apply_along_axis(lambda x : sat(x,2,1), 0, basefunc)
    satfunc2 = np.apply_along_axis(lambda x : sat(x,2,2), 0, basefunc)
    satfunc3 = np.apply_along_axis(lambda x : sat(x,2,3), 0, basefunc)
    plt.annotate(r"$f(x) + (s - f(x)) \frac{f(x)^p}{s^p + f(x)^p}$",(0.5,1),xycoords="axes fraction",xytext=(-50,15),textcoords="offset points",size=20)
    plt.plot(basefunc,label="f(x)")
    plt.plot(satfunc1,label="s = {s:d}, p = {p:d}".format(p=1,s=2))
    plt.plot(satfunc2,label="s = {s:d}, p = {p:d}".format(p=2,s=2))
    plt.plot(satfunc3,label="s = {s:d}, p = {p:d}".format(p=3,s=2))
    plt.xlabel("x")
    plt.ylabel("y")
    plt.legend(loc="best")
    plt.show()
    
def plotSystole():
    ti = 0
    tausys = 1
    basefunc = np.arange(0,100)/100.0*tausys
    tmp = ((basefunc-ti) / tausys)
    tmp2 = np.exp(1 - tmp)
    pressure =  1.0*tmp * tmp2
    #plt.plot(basefunc,label="f(x)")
    plt.plot(basefunc,pressure,label="$x \cdot \exp(1-x)$")
    plt.plot(basefunc,basefunc,label="$x$")
    plt.plot(basefunc,np.exp(1-basefunc),label="$\exp(1-x)$")
    plt.xlabel("x")
    plt.ylabel("y")
    #pressure2 = pressure[1:]-pressure[:-1]
    #plt.plot(pressure2,label="pressure'")
    #plt.plot(pressure2[1:]-pressure2[:-1],label="pressure''")
    #plt.plot(np.sqrt(basefunc/tausys),label="sqrt")
    plt.legend(loc="best")
    plt.show()

def plotSystoleComp():
    x = np.arange(1,101)
    v = 10000-(1-100.0/x)*x*x
    s = v*x
    plt.plot(s)
    plt.show()

if __name__ == "__main__" :
    plotSystole()