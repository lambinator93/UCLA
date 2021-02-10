load CR.dat
load CS.dat
load CCF.dat
load R.dat

k = -599:1:600;
hold on
plot(k,CS(:),'b-')
title('Sunspots Normalized Autocorrelation Function', 'FontSize', 14)
xlabel('lag - l (units T/N)','FontSize',14)
ylabel('Autocorrelation Function - C_{XX}(l(n))','FontSize',14)


hold off

figure
hold on
plot(k,CCF(:),'b-')
title('Normalized Crosscorrelation Function', 'FontSize', 14)
xlabel('lag - l (units T/N)','FontSize',14)
ylabel('Crosscorrelation Function - C_{XY}(l(n))','FontSize',14)

hold off

