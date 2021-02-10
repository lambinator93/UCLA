load kepler_01_09.dat
load kepler_001_09.dat
load kepler_0001_09.dat


load kepler_01_05.dat
load kepler_001_05.dat
load kepler_0001_05.dat


load kepler_01_01.dat
load kepler_001_01.dat
load kepler_0001_01.dat





subplot(3,1,1)
hold on
title({'Kepler Orbit Energy versus Time','x0 = 0.9'})
plot(kepler_01_09(:,1), kepler_01_09(:,6),'b-')
plot(kepler_001_09(:,1), kepler_001_09(:,6),'r-')
plot(kepler_0001_09(:,1), kepler_0001_09(:,6),'g-')
plot(kepler_01_09(:,1), -0.6111111,'m-')
legend('0.1','0.01','0.001','Actual Energy')

axis([0 100 -0.6123 -0.611])
hold off

subplot(3,1,2)
hold on
title('x0 = 0.5')
plot(kepler_01_05(:,1), kepler_01_05(:,6),'b-')
plot(kepler_001_05(:,1), kepler_001_05(:,6),'r-')
plot(kepler_0001_05(:,1), kepler_0001_05(:,6),'g-')
plot(kepler_01_05(:,1), -1.5,'m-')
ylabel('E(t)','FontSize',12)
xlim([0 100])
hold off

subplot(3,1,3)
hold on 
title('x0 = 0.1')
plot(kepler_01_01(:,1), kepler_01_01(:,6),'b-')
plot(kepler_001_01(:,1), kepler_001_01(:,6),'r-')
plot(kepler_0001_01(:,1), kepler_0001_01(:,6),'g-')
plot(kepler_01_01(:,1), -9.5,'m-')
axis([0 100 -200 400])
xlabel('t','FontSize', 12)
hold off