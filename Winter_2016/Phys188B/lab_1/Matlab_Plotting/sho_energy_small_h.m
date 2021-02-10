load euler_0001_1_05.dat
load rk2_0001_1_05.dat
load stormer_0001_1_05.dat



subplot(3,1,1)
hold on
title({'Oscillator Energy Versus Time: x0 = 1, \Omega = 0.5, h = 0.001, steps = 100000','Euler Method'})
plot(euler_0001_1_05(:,1),euler_0001_1_05(:,4),'b-')
plot(euler_0001_1_05(:,1),0.5*0.5*0.5*1*1,'r--')
axis([0 100 0.124 0.13])
legend('Numerical', 'Analytical')
hold off

subplot(3,1,2) 
hold on
title('2nd Order Runge-Kutta Method')
plot(rk2_0001_1_05(:,1),rk2_0001_1_05(:,4),'b-')
plot(rk2_0001_1_05(:,1),0.5*0.5*0.5*1*1,'r--')
ylabel('E(t)', 'FontSize', 12)
axis([0 100 0.124999999 0.125000001])
hold off

subplot(3,1,3)
hold on
title('Stormer Method')
plot(stormer_0001_1_05(:,1),stormer_0001_1_05(:,4),'b-')
plot(stormer_0001_1_05(:,1),0.5*0.5*0.5*1*1,'r--')
xlabel('t', 'FontSize', 12)
axis([0 100 0.124899 0.12501])
hold off