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

fmax = 0.5
f = 0


RF = ft.rfft(R)
SF = ft.rfft(S)




for n in range(0,len(RF)):
	if n <= len(RF):
		f = n/T
	if n > len(RF):
		f = (n - N)/T

	if abs(f) >= fmax:
		RF[n] = 0
		SF[n] = 0

PRL = T**2*np.abs(RF)**2/N**2
PSL = T**2*np.abs(SF)**2/N**2

np.savetxt("PRL.dat", np.c_[PRL])
np.savetxt("PSL.dat", np.c_[PSL])


R = ft.irfft(RF)
S = ft.irfft(SF)

np.savetxt("R_5.dat", np.c_[R])
np.savetxt("S_5.dat", np.c_[S])



