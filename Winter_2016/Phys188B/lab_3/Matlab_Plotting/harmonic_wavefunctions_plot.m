load harmonic_wavefunctions.dat
load anharmonic_wavefunctions_10.dat

x = harmonic_wavefunctions(:,1);
xa = anharmonic_wavefunctions_10(:,1);

hold on
plot(x, harmonic_wavefunctions(:,2),'b-')
plot(x, harmonic_wavefunctions(:,3),'m-')
plot(x, harmonic_wavefunctions(:,4),'r-')
plot(x, harmonic_wavefunctions(:,5),'g-')
plot(x, harmonic_wavefunctions(:,6),'c-')


legend('n=0','n=1','n=2','n=3','n=4')
title({'Harmonic Wavefunctions \psi_n(x):','\lambda = 0, N=100'},'FontSize',13)
ylabel('\psi_{n}(x)','FontSize',13)
xlabel('x','FontSize',13)
xlim([-5,5])
hold off