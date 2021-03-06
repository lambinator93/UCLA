import numpy as np
import time
import matplotlib.pyplot as plt
import pylab

def euler(h, y0, omega, numSteps):
	t = np.zeros(numSteps + 1)
	y = np.zeros((numSteps + 1, 2))
	e = np.zeros(numSteps + 1)

	t[0] = 0
	y[0,:] = y0
	e[0] = (1/2)*y[0,1]*y[0,1] + (1/2)*omega*omega*y[0,0]*y[0,0]

	for n in range(0, numSteps):
		t[n+1] = t[n] + h
		y[n+1,0] = y[n,0] + h*y[n,1]
		y[n+1,1] = y[n,1] - h*(omega*omega)*y[n, 0]

		e[n+1] = (1/2)*y[n+1,1]*y[n+1,1] + (1/2)*omega*omega*y[n+1,0]*y[n+1,0]
	
	return t, y, e

y0 = np.zeros(2)
y0[0] = 1
y0[1] = 0
h = 0.001
numSteps = 100000
omega = 0.5


print("Starting integration of ODE using time step h = %f" % h)
start = time.clock()

t, y, e = euler(h, y0, omega, numSteps)

print("Done. Time to peform %d" % numSteps + " steps: %f" % (time.clock() - start) + " s")

#save the result:
np.savetxt("euler_0001_1_05.dat", np.c_[t, y, e])


#import matplotlib.pyplot as plt 

#plt.plotfile('sho_vs_time_py.dat', delimiter=' ', cols=(0,1), 
 #            names=('t', 'x'), marker='.')
#plt.show()