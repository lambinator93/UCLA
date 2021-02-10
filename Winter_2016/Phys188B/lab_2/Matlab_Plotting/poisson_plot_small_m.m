load poisson_01_10.dat
load poisson_001_100.dat
load poisson_05_2.dat
load poisson_02_5.dat


U =@(x) (x.*(1-(x.^2)/3))/2; %Define the analytical potential

subplot(3,1,1)
hold on
plot(poisson_05_2(:,1),poisson_05_2(:,2),'b-')
x = poisson_001_100(:,1);
plot(x, U(x), 'r--')

title({'Electrostatic Potential in a P-N Junction: U(x) v. x','\Deltax = 0.5, M = 2'}, 'FontSize', 11)
legend('Numerical', 'Analytical')
hold off

subplot(3,1,2)
hold on
title('\Deltax = 0.2, M = 5','FontSize', 11)
ylabel('U(x)/u', 'FontSize', 12)
plot(poisson_02_5(:,1),poisson_02_5(:,2),'b-')
x = poisson_001_100(:,1);
plot(x, U(x), 'r--')
hold off


subplot(3,1,3)
hold on
title('\Deltax = 0.1, M = 10','FontSize', 11)
plot(poisson_01_10(:,1),poisson_01_10(:,2),'b-')
x = poisson_001_100(:,1);
plot(x, U(x), 'r--')
xlabel('x/a','FontSize', 12)
hold off
