load anharmonic_80_001.dat

hold on
l = anharmonic_80_001(:,1);
plot(l, anharmonic_80_001(:,3)-anharmonic_80_001(:,2), 'b-');
plot(l, anharmonic_80_001(:,4)-anharmonic_80_001(:,3), 'm-');

plot(l, anharmonic_80_001(:,5)-anharmonic_80_001(:,4), 'r-');

plot(l, anharmonic_80_001(:,6)-anharmonic_80_001(:,5), 'g-');

plot(l, anharmonic_80_001(:,7)-anharmonic_80_001(:,6), 'c-');
plot(l, anharmonic_80_001(:,8)-anharmonic_80_001(:,7), 'k-');
plot(l, anharmonic_80_001(:,9)-anharmonic_80_001(:,8), 'b--');
plot(l, anharmonic_80_001(:,10)-anharmonic_80_001(:,9), 'm--');


title({'Anharmonic Energy Difference Between States versus \lambda', 'N = 80, \delta\lambda = 0.01'}, 'FontSize', 13)
ylabel('Energy Difference   \DeltaE_n = E_{n+1}-E_n (hf)','FontSize',12)
xlabel('\lambda','FontSize',14)
legend('E_1-E_0', 'E_2-E_1', 'E_3-E_2', 'E_4-E_3', 'E_5-E_4', 'E_6-E_5', 'E_7-E_6','E_8-E_7')

hold off