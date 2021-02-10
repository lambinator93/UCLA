load kepler09001.dat;
load kepler091.dat;
load kepler06001.dat;
load kepler061.dat;
load rk201_vs_time_py.dat;
load rk21_vs_time_py.dat;
hold on
subplot(3,2,3)
plot(kepler09001(:,2), kepler09001(:,3),'-');
title({'Kepler Orbit using Stormer-Verlet Method:', 'x0 = 0.9, h = 0.001, steps = 10000 '})
ylabel('y')
xlabel('x')
subplot(3,2,1)
plot(kepler091(:,2), kepler091(:,3),'-');
title({'Kepler Orbit using Stormer-Verlet Method:', 'x0 = 0.9, h = 0.1, steps = 10000 '})
ylabel('y')
xlabel('x')
subplot(3,2,5)
x = 0:0.1:10*pi
[X,Y] = pol2cart(x,(0.9*0.9)./(1-0.1*cos(x)))
plot(X,Y,'-');
title({'Kepler Orbit using Analytical Method:',' x0 = 0.9'})
ylabel('y')
xlabel('x')

subplot(3,2,4)
plot(kepler06001(:,2), kepler06001(:,3),'-');
title({'Kepler Orbit using Stormer-Verlet Method:', 'x0 = 0.6, h = 0.001, steps = 10000 '})
ylabel('y')
xlabel('x')
subplot(3,2,2)
plot(kepler061(:,2), kepler061(:,3),'-');
title({'Kepler Orbit using Stormer-Verlet Method:', 'x0 = 0.6, h = 0.1, steps = 10000 '})
ylabel('y')
xlabel('x')
subplot(3,2,6)
x = 0:0.1:10*pi
[X,Y] = pol2cart(x,(0.6*0.6)./(1-0.4*cos(x)))
plot(X,Y,'-');
title({'Kepler Orbit using Analytical Method:',' x0 = 0.6'})
ylabel('y')
xlabel('x')