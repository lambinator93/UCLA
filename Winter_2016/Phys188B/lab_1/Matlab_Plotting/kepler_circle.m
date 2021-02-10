load kepler_01_1.dat

hold on
title('Kepler Orbit Solution: x0 = 1, h = 0.1, \epsilon = 0')
xlabel('y','FontSize',12)
ylabel('x','FontSize',12)
plot(kepler_01_1(:,2),kepler_01_1(:,3),'b-')
x = 0:0.1:10*pi
[X,Y] = pol2cart(x,(1*1)./(1-0*cos(x)))
plot(X,Y,'r--');
axis([-1.05 1.05 -1.05 1.05])
legend('Stormer','Analytical')



hold off