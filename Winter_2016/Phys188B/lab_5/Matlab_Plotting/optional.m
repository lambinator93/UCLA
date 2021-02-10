
load S_2.dat
load R_2.dat
load S_125.dat
load R_125.dat
load S_1.dat
load R_1.dat
load S_175.dat
load R_175.dat
load S_15.dat
load R_15.dat
load S.dat

k1 = 0:1:599;
k2 = 0:50/600:50-(50/600);

hold on
title('Low-Pass Sunspots Signal: T=50 years, N=600','FontSize',14)
ylabel('Monthly Mean Total Sunspot Number','FontSize',14)
xlabel('Years (Since 1966)','FontSize',14)
plot(k2,S_5(:),'b-')
plot(k2,S_3(:),'r-')
plot(k2,S_1(:),'g-')
legend('f_{max} = 5','f_{max} = 3','f_{max} = 1')




hold off

figure
hold on
plot(k2,R(:),'b-')
title('Cosmic Rays Signal: T=50 years, N=600','FontSize',14)
ylabel('Corrected Cosmic Ray Count Rates','FontSize',14)
xlabel('Years (Since 1966)','FontSize',14)


hold off