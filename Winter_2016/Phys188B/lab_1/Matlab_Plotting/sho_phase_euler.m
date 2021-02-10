load euler_0001_1_05.dat

hold on
title({'Oscillator Phase Space','Euler Method: x0 = 1, \Omega = 0.5, h = 0.001, steps = 100000'})
plot(euler_0001_1_05(:,2),euler_0001_1_05(:,3),'b-')
t = euler_0001_1_05(:,1);
plot(1*sin(0.5*t),0.5*cos(0.5*t),'r--')
xlabel('x(t)','FontSize', 12);
ylabel('v(t)','FontSize', 12);
legend('Euler', 'Analytical')
axis([-1.04 1.04 -0.53 0.53])
hold off