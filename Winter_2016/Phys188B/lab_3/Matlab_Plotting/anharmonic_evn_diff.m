load anharmonic_0_200_1_diff.dat

n = anharmonic_0_200_1_diff(:,1);

hold on
plot(n,abs(anharmonic_0_200_1_diff(:,52)), 'b-')
plot(n,abs(anharmonic_0_200_1_diff(:,53)), 'm-')
plot(n,abs(anharmonic_0_200_1_diff(:,54)), 'r-')
plot(n,abs(anharmonic_0_200_1_diff(:,55)), 'g-')
plot(n,abs(anharmonic_0_200_1_diff(:,56)), 'c-')

title({'Anharmonic Energy Estimate Difference versus Basis Size:','\epsilon_n = E_n(N) - E_n(N+2) v. N','\lambda=1'},'FontSize', 13)
legend('n=50','n=51','n=52','n=53','n=54')
%ylim([-45,20])
xlim([45,200])
xlabel('Basis Size N', 'FontSize', 12)
ylabel('Energy Difference    \epsilon_n(N)   (hf)','FontSize',12)





hold off