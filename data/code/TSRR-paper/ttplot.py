import matplotlib.pyplot as plt
import numpy as np

hist = [0, 12, 40, 115, 160, 175, 90, 75, 55, 40, 42, 43]
data = np.zeros(17)
data_norm = np.zeros(17)
for i in range(1,12):
    data[12-i:17-i] += hist[i]
    print(i, np.arange(12-i, 17-i))
plt.plot(data)
plt.xlim(1,15)
plt.xticks(np.arange(1,16), ["+"+str(x) for x in np.arange(1,16)])
plt.xlabel("TT shift (#TSRR 15 -> 20)")
plt.ylabel("number of possible \"source\" TTs")
plt.grid()
plt.show()
print(data)