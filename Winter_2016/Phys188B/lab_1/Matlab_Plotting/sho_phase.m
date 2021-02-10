load euler_01_1_05.dat
load rk2_01_1_05.dat
load stormer_01_1_05.dat



subplot(3,1,1)
hold on
title({'Oscillator Phase Space: x0 = 1, \Omega = 0.5, h = 0.1, steps = 1000','Euler Method'})
plot(euler_01_1_05(:,2),euler_01_1_05(:,3),'b-')
t = euler_01_1_05(:,1);
plot(1*sin(0.5*t),0.5*cos(0.5*t),'r--')
axis([-2.3 2.3 -2 2])
legend('Numerical', 'Analytical')
hold off

subplot(3,1,2) 
hold on
title('2nd Order Runge-Kutta Method')
plot(rk2_01_1_05(:,2),rk2_01_1_05(:,3),'b-')
t = rk2_01_1_05(:,1);
plot(1*sin(0.5*t),0.5*cos(0.5*t),'r--')
ylabel('v(t)', 'FontSize', 12)
axis([-1.02 1.02 -0.55 0.55])
hold off

subplot(3,1,3)
hold on
title('Stormer Method')
plot(stormer_01_1_05(:,2),stormer_01_1_05(:,3),'b-')
t = stormer_01_1_05(:,1);
plot(1*sin(0.5*t),0.5*cos(0.5*t),'r--')
xlabel('x(t)', 'FontSize', 12)
axis([-1.02 1.02 -0.55 0.55])
hold off

