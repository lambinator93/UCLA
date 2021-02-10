import scipy.linalg as sp
import numpy as np
import math as ma
import time

M = 100
N = 100
l = 1
i = 0
E = np.zeros((N, M+1))
Ed = np.zeros((N-2,M+1))

def kron(a,b):
	if a == b:
		return 1
	else :
		return 0

while N <= 200:
	H = np.zeros((N,M))
	for n in range(0, N):
		for m in range (0, M):
			H[n,m] = (n+(1/2))*kron(n,m) + l*(((1/4)*(6*n*n + 6*n + 3))*kron(n,m)
				+ma.sqrt((n+1)*(n+2))*(n+(3/2))*kron(n,m-2) + ma.sqrt((n-1)*n)*(n-(1/2))*kron(n,m+2)
				+(1/4)*ma.sqrt((n+1)*(n+2)*(n+3)*(n+4))*kron(n,m-4)+(1/4)*ma.sqrt((n-3)*(n-2)*(n-1)*n)*kron(n,m+4))
	
	evals, evecs = sp.eigh(H)

	E[i,0] = N
	for n in range (1,N+1):
		E[i,n] = evals[n-1]

	i = i+1
	N = N+l
	M = N



for m in range(0,N-3):
	for n in range(0,N):
		if n == 0:
			Ed[m,n] = E[m,n]
		if n > 0:
			Ed[m,n] = E[m,n] - E[m+2,n]

	
		
np.savetxt("anharmonic_0_200_1.dat", np.c_[E])

np.savetxt("anharmonic_0_200_1_diff.dat", np.c_[Ed])