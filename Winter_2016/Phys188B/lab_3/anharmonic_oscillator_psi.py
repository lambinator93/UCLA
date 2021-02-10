import scipy.linalg as sp
import numpy as np
import math as ma
import time

M = 6
N = 6
l = 1

H = np.zeros((N,M))

def kron(a,b):
	if a == b:
		return 1
	else :
		return 0

for n in range(0, N):
	for m in range (0, M):
		H[n,m] = (n+(1/2))*kron(n,m) + l*(((1/4)*(6*n*n + 6*n + 3))*kron(n,m)
			+ma.sqrt((n+1)*(n+2))*(n+(3/2))*kron(n,m-2) + ma.sqrt((n-1)*n)*(n-(1/2))*kron(n,m+2)
			+(1/4)*ma.sqrt((n+1)*(n+2)*(n+3)*(n+4))*kron(n,m-4)+(1/4)*ma.sqrt((n-3)*(n-2)*(n-1)*n)*kron(n,m+4))

evals, evecs = sp.eigh(H)


def u(n,x): 
	h = 0
	if n==0:
		h = 1
	if n==1:
		h = 2*x

	if n > 1:
		h0 = 1
		h1 = 2*x
		for i in range(2,n+1):
			h = 2*x*h1 - 2*(i-1)*h0
			h0 = h1
			h1 = h

	return (1/(ma.sqrt(ma.pow(2,n)*ma.factorial(n)*ma.sqrt(ma.pi))))*ma.exp(-ma.pow(x,2)/2)*h

dx = 0.01
i = 0
x = -4*ma.pi
U = np.zeros((N,2*(4*ma.pi)/dx+1))
S = np.zeros((2*(4*ma.pi)/dx+1, N))


while x <= 4*ma.pi and x >= -4*ma.pi:
	S[i,0] = x

	for n in range(0,N):
		U[n,i] = u(n,x)
	x = dx+x
	i = i+1

x = -4*ma.pi
i = 0
while x <= 4*ma.pi and x>=-4*ma.pi:
	for m in range(1, N):
		S[i,m] = np.dot(U[:,i],evecs[:,m-1])

	x = dx + x
	i = i+1


	


np.savetxt("anharmonic_test.dat", np.c_[S])