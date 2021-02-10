load anharmonic_0_200_1.dat

n = anharmonic_0_200_1(:,1);

hold on
plot(n, anharmonic_0_200_1(:,52),'b-')
plot(n, anharmonic_0_200_1(:,53),'m-')
plot(n, anharmonic_0_200_1(:,54),'r-')
plot(n, anharmonic_0_200_1(:,55),'g-')
plot(n, anharmonic_0_200_1(:,56),'c-')
%plot(n, anharmonic_0_100_1(:,7),'k-')

title({'Anharmonic Energy versus Basis Size: E_n v. N', '\lambda = 1'},'FontSize',13)
xlabel('Basis Size N', 'FontSize', 12)
ylabel('Energy E_n (hf)', 'FontSize', 12)
legend('n=50', 'n=51', 'n=52', 'n=53', 'n=54', 'n=55')
%xlim([0,70])
ylim([0,9500])
