load euler_01_1_05.dat
load rk2_01_1_05.dat
load stormer_01_1_05.dat

subplot(3,1,1)
hold on 
title({'Harmonic Oscillator Solutions: x0 = 1, \Omega = 0.5, h = 0.1, steps = 1000','Euler Method'}, 'FontSize', 12)
plot(euler_01_1_05(:,1),euler_01_1_05(:,2),'b-')
t = euler_01_1_05(:,1);
plot(t, 1*sin(0.5*t+pi/2), 'r --')
legend('Numerical', 'Analytical')
hold off

subplot(3,1,2)
hold on 
title('2nd Order Runge-Kutta Method', 'FontSize', 12)
plot(rk2_01_1_05(:,1),rk2_01_1_05(:,2),'b-')
t = rk2_01_1_05(:,1);
plot(t, 1*sin(0.5*t+pi/2), 'r --')
ylabel('x(t)', 'FontSize', 12)
hold off

subplot(3,1,3)
hold on 
title('Stormer Method', 'FontSize', 12)
plot(stormer_01_1_05(:,1),stormer_01_1_05(:,2),'b-')
t = stormer_01_1_05(:,1);
plot(t, 1*sin(0.5*t+pi/2), 'r --')
xlabel('t','FontSize', 12)
hold off

