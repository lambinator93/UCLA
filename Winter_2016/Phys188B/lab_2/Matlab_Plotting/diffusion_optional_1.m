load diffusion_current_001_100.dat

hold on
title({'Current Density at Different Times t: J(x,t) v. x', 'r = 1, M = 100, \Deltax = 0.01, \Deltat = 0.0001'},'FontSize', 12)
xlabel('x/a','FontSize',12)
ylabel('J(x,t)/K','FontSize',12)
plot(diffusion_current_001_100(:,1),diffusion_current_001_100(:,10),'b-')
plot(diffusion_current_001_100(:,1),diffusion_current_001_100(:,20),'c-')
plot(diffusion_current_001_100(:,1),diffusion_current_001_100(:,40),'r-')
plot(diffusion_current_001_100(:,1),diffusion_current_001_100(:,50),'m-')
plot(diffusion_current_001_100(:,1),diffusion_current_001_100(:,75),'g-')
plot(diffusion_current_001_100(:,1),diffusion_current_001_100(:,100),'k-')
xlim([0 0.15])
legend('J(x,t=0.001)','J(x,t=0.002)','J(x,t=0.004)','J(x,t=0.005)','J(x,t=0.0075)','J(x,t=0.01)')
hold off