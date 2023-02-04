import matplotlib.pyplot as plt
import numpy as np

ar = np.ones((10, 15))
ar *= np.arange(15)
ar = ar.T * np.arange(10)
ar = ar.T
ar = np.maximum(ar,20)
ar = 2*((ar > 20) * (ar < 35)) + (ar >= 35) * (ar < 50)
plt.imshow(ar.T[:,::-1], interpolation='none')
plt.grid(True)
plt.show()