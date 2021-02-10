load anharmonic_40_001.dat

hold on
l = anharmonic_40_001(:,1);
plot(l, anharmonic_40_001(:,2), 'b-');
plot(l, anharmonic_40_001(:,3), 'm-');

plot(l, anharmonic_40_001(:,4), 'r-');

plot(l, anharmonic_40_001(:,5), 'g-');

plot(l, anharmonic_40_001(:,6), 'c-');
plot(l, anharmonic_40_001(:,7), 'k-');

title({'Anharmonic Oscillator Energy versus \lambda', 'N = 40, \delta\lambda = 0.01'}, 'FontSize', 13)
ylabel('Energy E_n (hf)','FontSize',12)
xlabel('\lambda','FontSize',14)
legend('n=0', 'n=1', 'n=2', 'n=3', 'n=4', 'n=5')

hold off




