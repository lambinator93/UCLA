import numpy as np
import time

# y: the vector to be multiplied
# c: subdiagonal (below d)
# d: diagonal
# e: superdiagonal (above d)

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


#Define number of equations and spatial step h
M = 100
h = 1/M
#Define vector of spatial coordinate
x = np.zeros(M+1)
for i in range(0, M+1):
	x[i] = i*h

#Define all vectors necessary for solving Ax = b
#Define RHS/Solution vector b and diagonal d vector for the Poisson Eqaution
b = np.zeros(M)
d = np.zeros(M)
for i in range(0,M):
	b[i] = -h*h*(i+1)*h #i+1 becasue we alread know i = 0
	d[i] = -2

#Define subdiagonal and superdiagonal vectors. They are of size M-1 because they are one off the diagonal
c = np.zeros(M-1)
e = np.zeros(M-1)
for i in range(0, M-1):
	c[i] = 1
	e[i] = 1
	
c[M-2] = 2 #Consequence of the boundary condition dU(1)/dx = 0

print("Last element of subdiagonal: %d" % c[M-2])


#Results
print("Starting integration of ODE using time step h = %f" % h)
start = time.clock()

b = solveTridiag(b, c, d, e)

B = np.zeros(M+1)
B[0] = 0 #Known boundary condition at U(0) = 0
for i in range(1,M+1):
	B[i] = b[i-1] #Fill the remaining B vector with the contents of b. B is our final solution with begining boundary condition included


print("Done. Time to peform %d" % M + " steps: %f" % (time.clock() - start) + " s")


#save the result:
np.savetxt("poisson_0001_1000.dat", np.c_[x, B])