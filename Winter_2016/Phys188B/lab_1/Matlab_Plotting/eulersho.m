load kepler.dat;
load rk201_vs_time_py.dat;
load rk21_vs_time_py.dat;
hold on
subplot(2,1,1)
plot(kepler(:,1), kepler(:,2),'-');
title('Kepler Orbit using Stormer-Verlet Method: x0 = 0.75, h = 0.01, steps = 10000 ')
ylabel('x(t)')
xlabel('t')
subplot(2,1,2)
x = 0:0.1:10*pi
[X,Y] = pol2cart(x,(0.75*0.75)./(1-0.25*cos(x)))
plot(X,Y,'-');
title('Kepler Orbit using Analytical Method: x0 = 0.75')
ylabel('y')
xlabel('x')



%legend('Stormer-Verlet Method', 'Analytical Solution')
hold off