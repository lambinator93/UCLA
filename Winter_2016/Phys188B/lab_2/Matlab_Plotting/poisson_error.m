load poisson_0001_1000.dat
load poisson_001_100.dat
load poisson_01_10.dat
load poisson_0005_200.dat

U =@(x) (x.*(1-(x.^2)./3))./2; %Define the analytical potential

subplot(3,1,1)
hold on
title('Numerical Solution Error |U(x) - U(x)*| v. x', 'FontSize', 12)
plot(x3, abs(U(x3) - poisson_01_10(:,2)),'g-')
legend('\Deltax = 0.1')
hold off

subplot(3,1,2)
plot(x2, abs(U(x2) - poisson_001_100(:,2)), 'r-')
legend('\Deltax = 0.01')
ylabel('Error: |U(x) - U(x)*|', 'FontSize', 12)

subplot(3,1,3)
x1 = poisson_0001_1000(:,1);
x2 = poisson_001_100(:,1);
x3 = poisson_01_10(:,1);
plot(x1, abs(U(x1) - poisson_0001_1000(:,2)), 'b-')
legend('\Deltax = 0.001')
xlabel('x','FontSize', 12)


