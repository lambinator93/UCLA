load Xr.dat
load Yr.dat

hold on
plot(Xr(:,100),Yr(:,100),'r-')
plot(Xr(:,1000),Yr(:,1000),'b-')
plot(Xr(:,10000),Yr(:,10000),'g-')
xlabel('x', 'FontSize', 14)
ylabel('y','FontSize',14)
title({'Random Walk Simulation of Brownian Motion:','L=100, l=random, N=400, Z=10000'}, 'FontSize', 14)
legend('Z=100', 'Z=1000','Z=10000')
xlim([-50,50])
ylim([-50,50])

hold off