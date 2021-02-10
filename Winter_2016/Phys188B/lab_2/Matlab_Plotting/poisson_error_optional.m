load poisson_0005_200.dat
load poisson_001_100.dat

U =@(x) (x.*(1-(x.^2)./3))./2; %Define the analytical potential
x2 = poisson_001_100(:,1);
x3 = poisson_0005_200(:,1);
hold on
title('Numerical Solution Error |U(x) - U(x)*| v. x', 'FontSize', 12)
plot(x2, abs(U(x2) - poisson_001_100(:,2)), 'b-')
plot(x3, abs(U(x3) - poisson_0005_200(:,2)), 'r-')
ylabel('Error: |U(x) - U(x)*|', 'FontSize', 12)
xlabel('x','FontSize', 12)
legend('\Deltax_1 = 0.01', '\Deltax_2 = 0.005')
text(0.2,1.05*10^-5, 'y1 = 1.67e-05x - 1.03e-15')
text(0.5, 0.4*10^-5, 'y2 = 4.17e-06x - 3.46e-16')
hold off

fitvars1 = polyfit(x2,abs(U(x2) - poisson_001_100(:,2)),1);
fitvars2 = polyfit(x3,abs(U(x3) - poisson_0005_200(:,2)),1);

m1 = fitvars1(1)
c1 = fitvars1(2)

m2 = fitvars2(1)
c2 = fitvars2(2)
