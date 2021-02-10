import numpy as np
import time

def rk2(h, y0, omega, numSteps):
	t = np.zeros(numSteps + 1)
	y = np.zeros((numSteps + 1, 2))
	e = np.zeros(numSteps + 1)

	t[0] = 0
	y[0, :] = y0
	e[0] = (1/2)*y[0,1]*y[0,1] + (1/2)*omega*omega*y[0,0]*y[0,0]

	for n in range(0, numSteps):
		t[n+1] = t[n] + h
		#k1x = h*y[n,1]
		#k1v = -h*omega*omega*y[n,0]
		k2x = h*(y[n,1] - (h/2)*omega*omega*y[n,0])
		k2v = -h*omega*omega*(y[n,0] + (1/2)*h*y[n,1])
		y[n+1,0] = y[n,0] + k2x
		y[n+1,1] = y[n,1] + k2v

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

t, y, e = rk2(h, y0, omega, numSteps)

print("Done. Time to peform %d" % numSteps + " steps: %f" % (time.clock() - start) + " s")

#save the result:
np.savetxt("rk2_0001_1_05.dat", np.c_[t, y, e])