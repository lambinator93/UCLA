load diffusion_001_100.dat
load diffusion_r_4.dat
load diffusion_r_7.dat
load diffusion_r_10.dat
load diffusion_r_15.dat
load diffusion_r_2.dat
load diffusion_r_3.dat
load diffusion_r_30.dat
load diffusion_r_50.dat
load diffusion_r_100.dat
load diffusion_r_500.dat
hold on
title('Magnetic Diffussion: H(x,t) v. x for different r =\Deltat/\Deltax^2', 'FontSize', 12)
xlabel('x/a','FontSize',12)
ylabel('H/K','FontSize',12)
plot(diffusion_001_100(:,1),diffusion_001_100(:,10),'b-')
plot(diffusion_r_2(:,1),diffusion_r_2(:,10),'c-')
plot(diffusion_r_3(:,1),diffusion_r_3(:,10),'m-')
plot(diffusion_r_4(:,1),diffusion_r_4(:,10),'r-')
plot(diffusion_r_7(:,1),diffusion_r_7(:,10),'g-')
plot(diffusion_r_10(:,1),diffusion_r_10(:,10),'y-')
plot(diffusion_r_15(:,1),diffusion_r_15(:,10),'k-')
plot(diffusion_r_30(:,1),diffusion_r_30(:,10),'b--')
plot(diffusion_r_50(:,1),diffusion_r_50(:,10),'c--')
plot(diffusion_r_100(:,1),diffusion_r_100(:,10),'m--')
plot(diffusion_r_500(:,1),diffusion_r_500(:,10),'r--')
legend('r=1','r=2','r=3','r=4','r=7','r=10','r=15','r=30','r=50','r=100','r=500')
xlim([0 0.2])
hold off