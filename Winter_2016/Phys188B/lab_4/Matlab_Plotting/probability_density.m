load Xr.dat
load Yr.dat
load AX2r.dat
load X2K.dat

x = -50:0.01:50;
w =@(x,s) (1/sqrt(2*pi*s))*exp(-(x.^2)/(2*s));



hold on
histnorm(Xr(401,:))
p = plot(x,w(x,AX2r(401)), 'r-');
set(p,'LineWidth', 2)
title('Probability Density w(x): N=400, l=random','FontSize',14)
xlabel('x','FontSize', 14)
ylabel('w(x)','FontSize',14)
legend('Histogram', 'Gaussian')
hold off