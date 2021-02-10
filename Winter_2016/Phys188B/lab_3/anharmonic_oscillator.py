import scipy.linalg as sp
import numpy as np
import math as ma
import time

M = 15
N = 15
l = 0
d = 0.01
i = 0
H = np.zeros((N,M))
E = np.zeros((1/d+1, N+1))
def kron(a,b):
	if a == b:
		return 1
	else :
		return 0
while l <= 1:
	for n in range(0, N):
		for m in range (0, M):
			H[n,m] = (n+(1/2))*kron(n,m) + l*(((1/4)*(6*n*n + 6*n + 3))*kron(n,m)
				+ma.sqrt((n+1)*(n+2))*(n+(3/2))*kron(n,m-2) + ma.sqrt((n-1)*n)*(n-(1/2))*kron(n,m+2)
				+(1/4)*ma.sqrt((n+1)*(n+2)*(n+3)*(n+4))*kron(n,m-4)+(1/4)*ma.sqrt((n-3)*(n-2)*(n-1)*n)*kron(n,m+4))
	
	evals, evecs = sp.eigh(H)
	E[i,0] = l
	for n in range (1,N+1):
		E[i,n] = evals[n-1]

	i = i+1
	l = d+l

	
l = 1
for n in range(0, N):
	for m in range (0, M):
		H[n,m] = (n+(1/2))*kron(n,m) + l*(((1/4)*(6*n*n + 6*n + 3))*kron(n,m)
			+ma.sqrt((n+1)*(n+2))*(n+(3/2))*kron(n,m-2) + ma.sqrt((n-1)*n)*(n-(1/2))*kron(n,m+2)
			+(1/4)*ma.sqrt((n+1)*(n+2)*(n+3)*(n+4))*kron(n,m-4)+(1/4)*ma.sqrt((n-3)*(n-2)*(n-1)*n)*kron(n,m+4))

evals, evecs = sp.eigh(H)
E[1/d,0] = l
for n in range (1,N+1):
	E[1/d,n] = evals[n-1]
		


np.savetxt("anharmonic_15_001.dat", np.c_[E])