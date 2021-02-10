load PR.dat
load PS.dat
load PRL.dat
load PSL.dat

k = 0:1:300;
figure

semilogy(k,PRL(:))
hold 
title('Sunspots Power Spectra on LogLin Scale', 'FontSize', 14)
xlabel('Wavenumber - k', 'FontSize', 14)
ylabel('Power Spectra - P_k','FontSize',14)


 


