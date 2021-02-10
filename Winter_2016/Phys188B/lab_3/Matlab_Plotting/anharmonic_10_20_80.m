load anharmonic_20_001.dat
load anharmonic_10_001.dat
load anharmonic_15_001.dat

l1 = anharmonic_10_001(:,1);
l2 = anharmonic_20_001(:,1);
l8 = anharmonic_15_001(:,1);

subplot(3,1,1)
hold on
plot(l1, anharmonic_10_001(:,2), 'b-');
plot(l1, anharmonic_10_001(:,3), 'm-');

plot(l1, anharmonic_10_001(:,4), 'r-');

plot(l1, anharmonic_10_001(:,5), 'g-');

plot(l1, anharmonic_10_001(:,6), 'c-');
plot(l1, anharmonic_10_001(:,7), 'k-');
title('Anharmonic Oscillator Energy versus \lambda: \delta\lambda = 0.01 ', 'FontSize', 13)
text(0.45,25,'N=10', 'FontSize', 12)
legend('n=0', 'n=1', 'n=2', 'n=3', 'n=4', 'n=5')

hold off

subplot(3,1,2)
hold on
ylabel('Energy E_n (hf)','FontSize',12)
plot(l8, anharmonic_15_001(:,2), 'b-');
plot(l8, anharmonic_15_001(:,3), 'm-');

plot(l8, anharmonic_15_001(:,4), 'r-');

plot(l8, anharmonic_15_001(:,5), 'g-');

plot(l8, anharmonic_15_001(:,6), 'c-');
plot(l8, anharmonic_15_001(:,7), 'k-');
text(0.45,17.5,'N=15', 'FontSize', 12)

hold off

subplot(3,1,3)
hold on
plot(l2, anharmonic_20_001(:,2), 'b-');
plot(l2, anharmonic_20_001(:,3), 'm-');

plot(l2, anharmonic_20_001(:,4), 'r-');

plot(l2, anharmonic_20_001(:,5), 'g-');

plot(l2, anharmonic_20_001(:,6), 'c-');
plot(l2, anharmonic_20_001(:,7), 'k-');
text(0.45,13.5,'N=20', 'FontSize', 12)

xlabel('\lambda','FontSize', 14)
hold off


