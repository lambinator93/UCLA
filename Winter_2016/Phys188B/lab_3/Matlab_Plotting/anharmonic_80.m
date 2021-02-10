load anharmonic_80_001.dat

hold on
l = anharmonic_80_001(:,1);
plot(l, anharmonic_80_001(:,2), 'b-');
plot(l, anharmonic_80_001(:,3), 'm-');

plot(l, anharmonic_80_001(:,4), 'r-');

plot(l, anharmonic_80_001(:,5), 'g-');

plot(l, anharmonic_80_001(:,6), 'c-');
plot(l, anharmonic_80_001(:,7), 'k-');

title({'Anharmonic Oscillator Energy versus \lambda', 'N = 80, \delta\lambda = 0.01'}, 'FontSize', 13)
ylabel('Energy E_n (hf)','FontSize',12)
xlabel('\lambda','FontSize',14)
legend('n=0', 'n=1', 'n=2', 'n=3', 'n=4','n=5')

hold off