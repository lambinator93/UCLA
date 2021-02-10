import numpy as np
import scipy as sp
import math as ma
import random

L = 100 #Box dimension
l = 1 #Step size
N = 400 #Number of steps
Z = 10000 #Number of particles

p = np.zeros(N+1)

for i in range(1, N+1):
	p[i] = p[i-1] + l

#2D arrays to store particle positions
X = np.zeros((N+1,Z))
Y = np.zeros((N+1,Z))

#Create random numbers in a uniform distribution 
U = np.zeros((N+1,Z))

for n in range(N+1):
	for i in range(Z):
	    U[n,i] = random.uniform(0, 1)

np.savetxt("random.dat", np.c_[U])

#Fill 2D arrays
for n in range(1,N+1): #Loop over time
	for i in range(Z): #Loop over particle
		#Generate Increments
		l = random.uniform(0, 5)
		phi = 2*ma.pi*U[n,i]
		dX = l*ma.cos(phi)
		dY = l*ma.sin(phi)

		#Increment
		X[n,i] = X[n-1,i] + dX
		Y[n,i] = Y[n-1,i] + dY

		#Reverse sign of increments if out of range
		if (ma.fabs(X[n,i]) >= L/2):
			X[n,i] = X[n-1,i] - dX

		if (ma.fabs(Y[n,i]) >= L/2):
			Y[n,i] = Y[n-1,i] - dY

#Calculate Average Displacement and Average Square Displacement
AX = np.zeros(N+1)
AY = np.zeros(N+1)

AX2 = np.zeros(N+1)
AY2 = np.zeros(N+1)

AD = np.zeros(N+1)


for n in range(N+1): #Loop over time
	AX[n] = (1/Z)*np.sum(X[n,:])
	AY[n] = (1/Z)*np.sum(Y[n,:]) 

	AX2[n] = (1/Z)*np.sum(np.dot(X[n,:],X[n,:])) 
	AY2[n] = (1/Z)*np.sum(np.dot(Y[n,:],Y[n,:]))

	AD[n] = (1/Z)*np.sum(np.dot(X[n,:],X[n,:]) + np.dot(Y[n,:],Y[n,:]))



np.savetxt("pr.dat",np.c_[p])
np.savetxt("Xr.dat", np.c_[X])
np.savetxt("Yr.dat", np.c_[Y])
np.savetxt("AXr.dat", np.c_[AX])
np.savetxt("AYr.dat", np.c_[AY])
np.savetxt("AX2r.dat", np.c_[AX2])
np.savetxt("AY2r.dat", np.c_[AY2])
np.savetxt("ADr.dat", np.c_[AD])





