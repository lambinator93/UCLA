load poisson_0001_1000.dat
U =@(x) (x.*(1-(x.^2)/3))/2; %Define the analytical potential

hold on
plot(poisson_0001_1000(:,1),poisson_0001_1000(:,2),'b-')
x = poisson_0001_1000(:,1);
plot(x, U(x), 'r--')

title({'Electrostatic Potential in a P-N Junction: U(x) v. x','\Deltax = 0.001, M = 1000'}, 'FontSize', 11)
legend('Numerical', 'Analytical')
xlabel('x/a','FontSize',12)
ylabel('U(x)/u','FontSize',12)
hold off
