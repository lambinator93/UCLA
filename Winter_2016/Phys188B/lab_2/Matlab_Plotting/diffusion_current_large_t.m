load diffusion_current_01_10.dat

hold on
title({'Current Density at Different Times t: J(x,t) v. x', 'r = 1, M = 100, \Deltax = 0.1, \Deltat = 0.01'},'FontSize', 12)
xlabel('x/a','FontSize',12)
ylabel('J(x,t)/K','FontSize',12)
plot(diffusion_current_01_10(:,1),diffusion_current_01_10(:,3),'b-')
plot(diffusion_current_01_10(:,1),diffusion_current_01_10(:,4),'c-')
plot(diffusion_current_01_10(:,1),diffusion_current_01_10(:,5),'r-')
plot(diffusion_current_01_10(:,1),diffusion_current_01_10(:,7),'m-')
plot(diffusion_current_01_10(:,1),diffusion_current_01_10(:,10),'g-')
xlim([0 0.5])
legend('J(x,t=0.03)','J(x,t=0.04)','J(x,t=0.05)','J(x,t=0.07)','J(x,t=0.1)')
hold off