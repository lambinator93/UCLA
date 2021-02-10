import numpy as np 
import time
import math as m

def stormer(h, t0, numSteps):
	t = np.zeros(numSteps + 1)
	y = np.zeros((numSteps + 1, 4))
	e = np.zeros(numSteps + 1)
	L = np.zeros(numSteps + 1)
	

	t[0] = 0
	y[0,:] = y0

	a1 = y[0,0]
	a2 = 0
	T = 0

	L[0] = y[0,0]*y[0,3] - y[0,1]*y[0,2]

	for n in range(0, numSteps):
		t[n+1] = t[n] + h

		r = m.sqrt((y[n,0]*y[n,0] + y[n,1]*y[n,1]))
		v = m.sqrt((y[n,2]*y[n,2] + y[n,3]*y[n,3]))
		e[n] = (1/2)*v*v - (1/r)
		

		y[n+1,0] = y[n,0] + h*(y[n,2] - (h/2)*y[n,0]/(r*r*r))
		y[n+1,1] = y[n,1] + h*(y[n,3] - (h/2)*y[n,1]/(r*r*r))

		rn = m.sqrt((y[n+1,0]*y[n+1,0] + y[n+1,1]*y[n+1,1]))

		y[n+1,2] = y[n,2] - (h/2)*y[n,0]/(r*r*r) - (h/2)*y[n+1,0]/(rn*rn*rn)
		y[n+1,3] = y[n,3] - (h/2)*y[n,1]/(r*r*r) - (h/2)*y[n+1,1]/(rn*rn*rn)

		L[n+1] = y[n+1,0]*y[n+1,3] - y[n+1,1]*y[n+1,2]

		if y[n,0] < a2 :
			a2 = y[n,0]
			T = 2*t[n]

	r = m.sqrt((y[numSteps,0]*y[numSteps,0] + y[numSteps,1]*y[numSteps,1]))
	v = m.sqrt((y[numSteps,2]*y[numSteps,2] + y[numSteps,3]*y[numSteps,3]))
	e[numSteps] = (1/2)*v*v - (1/r)

	a = (a1-a2)/2
		

	return t, y, e, L, a, T



y0 = np.zeros(4)
y0[0] = 1
y0[1] = 0
y0[2] = 0
y0[3] = 1
h = 0.1
numSteps = 1000

print("Starting integration of ODE using time step h = %f" % h)
start = time.clock()

t, y, e, L, a, T = stormer(h, y0, numSteps)

print("Done. Time to peform %d" % numSteps + " steps: %f" % (time.clock() - start) + " s")
print("Semi-Major axis a = %f" % a)
print("Orbital period T = %f" % T)

#save the result:
np.savetxt("kepler_01_1.dat", np.c_[t, y, e, L])


#import matplotlib.pyplot as plt 
#plt.plotfile('kepler_vs_time_py.dat', delimiter=' ', cols=(1,2), names=('t', 'x'), marker='.')
#plt.show()