%Erik Lamb
%Homework 4
%Part 2

%Main script that implements the Euler method, RK4 method, Adams
%Fourth-Order Predictor-Corrector method, and the Milnes-Simpson method to
%solve the following IVP for different time step values h. We will also compute the error of each method
%from the exact solution of the IVP, |yi-wi|, and use this to determine the
%stability of each method. Finally, based on the values of h chosen, we
%will make a statement on the region of absolute stability for Eulers and
%RK4 method.

clear;

%Declare IVP
f =@ (t,y) -20*y + 20*t.^2 + 2*t;
y0 = 1/3;
a=0;
b=1;

%Declare Solution to IVP
y =@(t) t.^2 + exp(-20*t)/3;

%Time array for exact solution
T = 0:0.001:1;

%Solutions for h=0.2, N=5
h=0.2;
[te1,we1]=euler2(a,b,h,y0,f);
[tr1,wr1]=rk4(a,b,h,y0,f);
[ta1,wa1]=abm4(a,b,h,y0,f);
[tm1,wm1]=ms(a,b,h,y0,f);

%Solutions for h=0.125, N=8
h=0.125;
[te2,we2]=euler2(a,b,h,y0,f);
[tr2,wr2]=rk4(a,b,h,y0,f);
[ta2,wa2]=abm4(a,b,h,y0,f);
[tm2,wm2]=ms(a,b,h,y0,f);

%Solutions for h=0.1, N=10
h=0.1;
[te3,we3]=euler2(a,b,h,y0,f);
[tr3,wr3]=rk4(a,b,h,y0,f);
[ta3,wa3]=abm4(a,b,h,y0,f);
[tm3,wm3]=ms(a,b,h,y0,f);

%Solutions for h=0.02, N=50
h=0.02;
[te4,we4]=euler2(a,b,h,y0,f);
[tr4,wr4]=rk4(a,b,h,y0,f);
[ta4,wa4]=abm4(a,b,h,y0,f);
[tm4,wm4]=ms(a,b,h,y0,f);

%Plots of approximations for each time step for each method compared to the actual solution
hold on
plot(te1,we1,te2,we2,te3,we3,te4,we4,T,y(T))
legend('h=0.2','h=0.125','h=0.1','h=0.02','y(t)=t^2 + exp(-20t)/3');
xlabel('t_i','FontSize',16);
ylabel('w_i','FontSize',16);
title('Euler Method Approximations w_i vs. t_i','FontSize',16);
hold off

figure
hold on
plot(tr1,wr1,tr2,wr2,tr3,wr3,tr4,wr4,T,y(T))
legend('h=0.2','h=0.125','h=0.1','h=0.02','y(t)=t^2 + exp(-20t)/3');
xlabel('t_i','FontSize',16);
ylabel('w_i','FontSize',16);
ylim([0,1.5]);
xlim([0,1]);
title('RK4 Method Approximations w_i vs. t_i','FontSize',16);
hold off

figure
hold on
plot(ta1,wa1,ta2,wa2,ta3,wa3,ta4,wa4,T,y(T))
legend('h=0.2','h=0.125','h=0.1','h=0.02','y(t)=t^2 + exp(-20t)/3');
xlabel('t_i','FontSize',16);
ylabel('w_i','FontSize',16);
ylim([0,1.5]);
xlim([0,1]);

title('Adams 4th-Order Method Approximations w_i vs. t_i','FontSize',16);
hold off

figure
hold on
plot(tm1,wm1,tm2,wm2,tm3,wm3,tm4,wm4,T,y(T))
legend('h=0.2','h=0.125','h=0.1','h=0.02','y(t)=t^2 + exp(-20t)/3');
xlabel('t_i','FontSize',16);
ylabel('w_i','FontSize',16);
ylim([0,1.5]);
xlim([0,1]);

title('Milne-Simpson Method Approximations w_i vs. t_i','FontSize',16);
hold off

%Error Plots
figure
hold on
plot(te1,abs(we1-y(te1)),te2,abs(we2-y(te2)),te3,abs(we3-y(te3)),te4,abs(we4-y(te4)))
legend('h=0.2','h=0.125','h=0.1','h=0.02');
xlabel('t_i','FontSize',16);
ylabel('|w_i-y_i|','FontSize',16);
title('Euler Method Absolute Error |w_i-y_i| vs t_i','FontSize',16);
ylim([0,1.5]);
xlim([0,1]);
hold off

figure
hold on
plot(tr1,abs(wr1-y(tr1)),tr2,abs(wr2-y(tr2)),tr3,abs(wr3-y(tr3)),tr4,abs(wr4-y(tr4)))
legend('h=0.2','h=0.125','h=0.1','h=0.02');
xlabel('t_i','FontSize',16);
ylabel('|w_i-y_i|','FontSize',16);
title('RK4 Method Absolute Error |w_i-y_i| vs t_i','FontSize',16);
ylim([0,1.5]);
xlim([0,1]);
hold off

figure
hold on
plot(ta1,abs(wa1-y(ta1)),ta2,abs(wa2-y(ta2)),ta3,abs(wa3-y(ta3)),ta4,abs(wa4-y(ta4)))
legend('h=0.2','h=0.125','h=0.1','h=0.02');
xlabel('t_i','FontSize',16);
ylabel('|w_i-y_i|','FontSize',16);
title('Adams Method Absolute Error |w_i-y_i| vs t_i','FontSize',16);
ylim([0,1.5]);
xlim([0,1]);
hold off

figure
hold on
plot(tm1,abs(wm1-y(tm1)),tm2,abs(wm2-y(tm2)),tm3,abs(wm3-y(tm3)),tm4,abs(wm4-y(tm4)))
legend('h=0.2','h=0.125','h=0.1','h=0.02');
xlabel('t_i','FontSize',16);
ylabel('|w_i-y_i|','FontSize',16);
title('Milne-Simpson Method Absolute Error |w_i-y_i| vs t_i','FontSize',16);
ylim([0,1.5]);
xlim([0,1]);
hold off

