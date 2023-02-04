import matplotlib.pyplot as plt
import numpy as np
import re
import sys

data = []
with open(sys.argv[1]) as f :
  l = f.readline()
  l = f.readline()
  while l != "" :
    spl = re.split(r"\s+",l.strip())
    dp = [(float(x.replace(",",".")) if not x == "" else 0) for x in spl]
    data.append(dp)
    l = f.readline()
print "converting to array"
data = np.array(data)
print data.shape
print "plotting %d datapoints" % len(data)
plt.plot(data[:,0],data[:,1])
plt.show()