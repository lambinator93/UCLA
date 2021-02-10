load euler_0001_1_05.dat

hold on
title({'SHO Energy Versus Time: x0 = 1, \Omega = 0.5, h = 0.001, steps = 100000','Euler Method'})
plot(euler_0001_1_05(:,1),euler_0001_1_05(:,4),'b-')
plot(euler_0001_1_05(:,1),0.5*0.5*0.5*1*1,'r--')
hold off
