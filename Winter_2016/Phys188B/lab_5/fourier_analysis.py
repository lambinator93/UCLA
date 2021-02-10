import numpy as np
import numpy.fft as ft
import scipy as sp
import math as ma

from numpy import *

data1 = loadtxt("rays_monthly.txt")
data2 = loadtxt("sunspots_monthly.txt")

R = data1[:,2]
S = data2[:,1]

N = 600
T = 50

#np.savetxt("R.dat", np.c_[R])
#np.savetxt("S.dat", np.c_[S])

#First Problem
PR = T**2*np.abs(ft.rfft(R))**2/N**2
PS = T**2*np.abs(ft.rfft(S))**2/N**2

KR = 1
KS = 1

RM = PR[1]
SM = PS[1]

for n in range(1, len(PR)):
	if PR[n] > RM:
		RM = PR[n]
		KR = n
	if PS[n] > SM:
		SM = PS[n]
		KS = n
print(KR)
print(KS)

np.savetxt("PR.dat",np.c_[PR])
np.savetxt("PS.dat", np.c_[PS])


#Second Problem
NR = np.zeros(2*N)
NS = np.zeros(2*N)

RM = np.mean(R)
SM = np.mean(S)

RS = np.std(R)
SS = np.std(S)


for n in range(0, N):
	NR[n] = (R[n]-RM)/RS
	NS[n] = (S[n]-SM)/SS

#np.savetxt("NR.dat",np.c_[NR])
#np.savetxt("NS.dat", np.c_[NS])

CR = np.zeros(2*N)
CS = np.zeros(2*N)

l = 0

NRF = ft.rfft(NR)
NSF = ft.rfft(NS)

NRFP = NRF*np.conj(NRF)
NSFP = NSF*np.conj(NSF)


#np.savetxt("NRFP.dat",np.c_[NRFP])
#np.savetxt("NSFP.dat", np.c_[NSFP])



NRFPI = ft.irfft(NRFP)
NSFPI = ft.irfft(NSFP)

#np.savetxt("NRFPI.dat",np.c_[NRFPI])
#np.savetxt("NSFPI.dat", np.c_[NSFPI])

for n in range(0, 2*N):
	if n <= N:
		l = n
	if n > N:
		l = n - 2*N

	CR[l+N-1] = (1/(N - np.abs(l)))*NRFPI[n]

	CS[l+N-1] = (1/(N - np.abs(l)))*NSFPI[n]




np.savetxt("CR.dat",np.c_[CR])
np.savetxt("CS.dat", np.c_[CS])


#Third Problem
CC = NRF*np.conj(NSF)


#np.savetxt("CC.dat", np.c_[CC])
CCI = ft.irfft(CC)

CCF = np.zeros(2*N)

for n in range(0, 2*N):
	if n <= N:
		l = n
	if n > N:
		l = n - 2*N


	CCF[l+N-1] = (1/(N - np.abs(l)))*CCI[n]

	if l == 0:
		print(CCF[l+N-1])


np.savetxt("CCF.dat", np.c_[CCF])


