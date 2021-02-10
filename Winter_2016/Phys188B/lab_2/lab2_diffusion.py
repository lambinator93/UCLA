import numpy as np
import time

def multTridiag(y , c , d , e):
	prev = 0
	m = len(y)
	for i in range (0 , m-1):
		ynew = prev + d[i]*y[i] + e[i]*y[i+1]
		prev = c[i]*y[i]
		y[i] = ynew
	y[m-1] = prev + d [m-1]*y[m-1]
	return y


def solveTridiag(b , c , d , e):
	from numpy import empty

	m = len(b)
	tmp = empty(m)
	k = d[0]
	b[0] = b[0]/k
	for i in range(1 ,m):
		tmp[i] = e[i-1]/k
		k = d[i] - c[i-1]*tmp[i]
		b [i] = (b[i] - c[i-1]*b[i-1])/k
	for i in range (m-2,-1,-1):
		b [i] = b[i] - tmp[i+1]*b[i+1]
	return b


M = 100
dx = 1/(2+M) #0<x<1
#dt = 1/((2+M)*(2+M))
#r = dt/(dx*dx) #=1
r = 1
dt = r*dx*dx

x = np.zeros(M+2)
#t = np.zeros(M+2)
for i in range(0, M+2):
	x[i] = i*dx
	#t[i] = i*dt

#For the left hand side
d1 = np.zeros(M)
for i in range(0,M):
	d1[i] = 2*(1+r)

c1 = np.zeros(M-1)
e1 = np.zeros(M-1)
for i in range(0, M-1):
	c1[i] = -r
	e1[i] = -r

#For the right hand side
d2 = np.zeros(M)
for i in range(0,M):
	d2[i] = 2*(1-r)

c2 = np.zeros(M-1)
e2 = np.zeros(M-1)
for i in range(0, M-1):
	c2[i] = r
	e2[i] = r

#Matrix that will store solutions. Each column is a b vector at a successive time 
h = np.zeros((M, M))
b = np.zeros(M)
b[0] = 2*r

#Results
print("Starting integration of ODE using time step dt = %f" % dt)
print("Starting integration of ODE using spatial step dx = %f" % dx)
print("Starting integration of ODE using CFL parameter r= %f" % r)


start = time.clock()

h[:,1] = solveTridiag(b, c1, d1, e1)

for n in range(1, M-1):
	b = multTridiag(h[:,n], c2, d2, e2)
	b[0] = b[0] + 2*r
	h[:,n+1] = solveTridiag(b, c1, d1, e1)

#Add boundary conditions
H = np.zeros((M+2, M))
for n in range(1,M+1):
	for i in range(0, M):
		H[n,i] = h[n-1,i]

H[0,:] = 1
H[M+1, :] = 0

print("Done. Time to peform %d" % M + " steps: %f" % (time.clock() - start) + " s")




#save the result:
#np.savetxt("diffusion_001_100.dat", np.c_[x, H])

J = np.zeros((M+2, M))

for n in range(0, M):
	for i in range(0,M+1):
		J[i,n] = -(H[i+1,n]-H[i,n])/dx

xJ = np.zeros(M+2)
for i in range(0, M+1):
	xJ[i+1] = xJ[i] + dx/2

np.savetxt("diffusion_current_001_100.dat", np.c_[x, J])