import matplotlib.pyplot as plt
import numpy as np
import re
import sys

is_phi = lambda fnam : fname.endswith(".phi")

def read_data(fname):
  if fname.endswith(".phi") :
    return read_phi(fname)
  else :
    return read_csv(fname)

def read_phi(fname):
  data = []
  with open(fname) as f :
    l = f.readline()
    l = f.readline()
    while l != "" :
      spl = re.split(r"\s+",l.strip())
      dp = [(float(x.replace(",",".")) if not x == "" else 0) for x in spl]
      data.append(dp)
      l = f.readline()
  return data

def read_csv(fname):
  data = []
  with open(fname) as f :
    l = f.readline()
    l = f.readline()
    while l != "" :
      spl = re.split(r",",l.strip())
      dp = [float(x) for x in spl[:-1]]
      data.append(dp)
      l = f.readline()
  return data


data1 = read_data(sys.argv[1])
data2 = read_data(sys.argv[2])
print "converting to array"
data1 = np.array(data1)
data2 = np.array(data2)
if (len(data1) != len(data2)) :
  print "WARNING: unequal lengths (%d,%d)" % (len(data1),len(data2))
print "plotting %d datapoints" % len(data1)
plt.plot(data1[:,0],data1[:,1],label=sys.argv[1])
plt.plot(data2[:,0],data2[:,1],label=sys.argv[2])
plt.legend()
plt.show()