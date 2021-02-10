load kepler010001.dat
load kepler02001.dat
load kepler020001.dat
load kepler03001.dat
load kepler04001.dat
load kepler0100001.dat

subplot(2,2,4)
plot(kepler020001(:,2), kepler020001(:,3),'-');
title({'Kepler Orbit using Stormer-Verlet Method:', 'x0 = 0.2, h = 0.0001, steps = 10000 '})
ylabel('y')
xlabel('x')
subplot(2,2,3)
plot(kepler02001(:,2), kepler02001(:,3),'-');
title({'Kepler Orbit using Stormer-Verlet Method:', 'x0 = 0.2, h = 0.001, steps = 10000 '})
ylabel('y')
xlabel('x')
subplot(2,2,2)
plot(kepler0100001(:,2), kepler0100001(:,3),'-');
title({'Kepler Orbit using Stormer-Verlet Method:', 'x0 = 0.1, h = 0.00001, steps = 10000 '})
ylabel('y')
xlabel('x')
subplot(2,2,1)
plot(kepler010001(:,2), kepler010001(:,3),'-');
title({'Kepler Orbit using Stormer-Verlet Method:', 'x0 = 0.1, h = 0.0001, steps = 10000 '})
ylabel('y')
xlabel('x')
