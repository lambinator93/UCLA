load euler_0001_1_05.dat

hold on
title({'Harmonic Oscillator Solution','Euler Method: x0 = 1, \Omega = 0.5, h = 0.001, steps = 100000'})
plot(euler_0001_1_05(:,1),euler_0001_1_05(:,2),'b-')
t = euler_0001_1_05(:,1);
plot(t, 1*sin(0.5*t+pi/2), 'r --')
legend('Euler', 'Analytical')
ylabel('x(t)','FontSize',12)
xlabel('t','FontSize',12)
xlim([0 100])
hold off