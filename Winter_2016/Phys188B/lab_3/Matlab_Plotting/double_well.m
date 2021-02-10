load double_well_energies.dat
load double_well_wavefunctions.dat

E0=double_well_energies(1,:)
E1=double_well_energies(2,:)
dE=E1-E0

x = double_well_wavefunctions(:,1);

hold on
plot(x,sqrt(0.5).*(double_well_wavefunctions(:,2) + double_well_wavefunctions(:,3)),'b-')
%plot(x,0.5.*(double_well_wavefunctions(:,2).*double_well_wavefunctions(:,2) - double_well_wavefunctions(:,3).*double_well_wavefunctions(:,3)),'r-')
xlim([-4,4])
%ylim([0,0.6])
title({'Double Well Mixed State',' \psi_{+}(x) = 1/$$\sqrt(2)$$(\psi_0(x) + \psi_1(x))','N=100'},'Interpreter','latex','FontSize',13)
xlabel('x', 'FontSize', 13)
ylabel('\psi_{+}(x)','FontSize', 13)
%legend('|\psi_{+}(x)|^2','|\psi_{-}(x)|^2')




hold off


