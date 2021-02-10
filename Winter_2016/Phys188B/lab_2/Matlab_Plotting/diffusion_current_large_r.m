load diffusion_current_r_500.dat

hold on
title({'Current Density at Different Times t and Large r: J(x,t) v. x', 'r = 500, M = 100, \Deltax = 0.01, \Deltat = 0.05'},'FontSize', 12)
xlabel('x/a','FontSize',12)
ylabel('J(x,t)/K','FontSize',12)
plot(diffusion_current_r_500(:,1),diffusion_current_r_500(:,10),'b-')
plot(diffusion_current_r_500(:,1),diffusion_current_r_500(:,20),'c-')
plot(diffusion_current_r_500(:,1),diffusion_current_r_500(:,40),'r-')
plot(diffusion_current_r_500(:,1),diffusion_current_r_500(:,50),'m-')
plot(diffusion_current_r_500(:,1),diffusion_current_r_500(:,75),'g-')
plot(diffusion_current_r_500(:,1),diffusion_current_r_500(:,100),'k-')
xlim([0 0.05])
legend('J(x,t=0.5)','J(x,t=1)','J(x,t=2)','J(x,t=2.5)','J(x,t=3.75)','J(x,t=5)')
hold off
