load euler_01_1_05.dat
load rk2_01_1_05.dat
load stormer_01_1_05.dat



subplot(3,1,1)
hold on
title({'SHO Energy Versus Time: x0 = 1, \Omega = 0.5, h = 0.1, steps = 1000','Euler Method'})
plot(euler_01_1_05(:,1),euler_01_1_05(:,4),'b-')
plot(euler_01_1_05(:,1),0.5*0.5*0.5*1*1,'r--')
legend('Numerical', 'Analytical')
axis([0 100 0 1])

hold off

subplot(3,1,2) 
hold on
title('2nd Order Runge-Kutta Method')
plot(rk2_01_1_05(:,1),rk2_01_1_05(:,4),'b-')
plot(rk2_01_1_05(:,1),0.5*0.5*0.5*1*1,'r--')
ylabel('E(t)', 'FontSize', 12)
axis([0 100 0.12489 0.125211])
hold off

subplot(3,1,3)
hold on
title('Stormer Method')
plot(stormer_01_1_05(:,1),stormer_01_1_05(:,4),'b-')
plot(stormer_01_1_05(:,1),0.5*0.5*0.5*1*1,'r--')
xlabel('t', 'FontSize', 12)
axis([0 100 0.1249 0.125009])
hold off
