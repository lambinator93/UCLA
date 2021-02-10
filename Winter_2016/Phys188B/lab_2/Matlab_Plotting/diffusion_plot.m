load diffusion.dat
load diffusion_0001_1000.dat
load diffusion_001_100.dat
load diffusion_000004_500.dat
load diffusion_01_10.dat
load diffusion_002_5.dat

hold on
x = diffusion_001_100(:,1);
plot(x, 1-x, 'k--')
plot(diffusion_002_5(:,1), diffusion_002_5(:,5),'c-')
plot(diffusion_01_10(:,1), diffusion_01_10(:,10),'b-')
plot(diffusion_001_100(:,1), diffusion_001_100(:,100),'m-')
plot(diffusion_000004_500(:,1), diffusion_000004_500(:,500),'r-')
plot(diffusion_0001_1000(:,1), diffusion_0001_1000(:,1000),'g-')
title('Magnetic Diffussion: H(x,t) v. x for different t','FontSize',12)
ylabel('H/K','FontSize',12)
xlabel('x/a','FontSize',12)
legend('H(x, t=\infty) = 1-x', 'H(x, t = 0.2)', 'H(x, t = 0.1)', 'H(x, t = 0.01)', 'H(x, t = 0.002)', 'H(x, t = 0.001)' )




hold off