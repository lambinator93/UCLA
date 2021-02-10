load kepler_01_09.dat
load kepler_01_05.dat
load kepler_01_02.dat
load kepler_001_09.dat
load kepler_001_05.dat
load kepler_001_02.dat
load kepler_0001_09.dat
load kepler_0001_05.dat
load kepler_0001_02.dat
load kepler_01_01.dat
load kepler_001_01.dat
load kepler_0001_01.dat

load kepler_01_07.dat
load kepler_001_07.dat
load kepler_0001_07.dat



subplot(3,1,1)
hold on 
title({'Kepler Orbit Angular Momentum verus Time', 'h = 0.1'})
plot(kepler_01_09(:,1), kepler_01_09(:,7),'b')
plot(kepler_01_07(:,1), kepler_01_07(:,7),'c')

plot(kepler_01_05(:,1), kepler_01_05(:,7),'r')
plot(kepler_01_02(:,1), kepler_01_02(:,7),'g')
plot(kepler_01_01(:,1), kepler_01_01(:,7),'m')

xlim([0 1000])
hold off

subplot(3,1,2)
hold on
title('h = 0.01')
plot(kepler_001_09(:,1), kepler_001_09(:,7),'b')
plot(kepler_001_07(:,1), kepler_001_07(:,7),'c')

plot(kepler_001_05(:,1), kepler_001_05(:,7),'r')
plot(kepler_001_02(:,1), kepler_001_02(:,7),'g')
plot(kepler_001_01(:,1), kepler_001_01(:,7),'m')


xlim([0 100])
ylabel('L(t)','FontSize', 12)
hold off

subplot(3,1,3)
hold on 
title('h = 0.001')
plot(kepler_0001_09(:,1), kepler_0001_09(:,7),'b')
plot(kepler_0001_07(:,1), kepler_0001_07(:,7),'c')

plot(kepler_0001_05(:,1), kepler_0001_05(:,7),'r')
plot(kepler_0001_02(:,1), kepler_0001_02(:,7),'g')
plot(kepler_0001_01(:,1), kepler_0001_01(:,7),'m')

xlim([0 10])
xlabel('t', 'FontSize', 12)
hold off


