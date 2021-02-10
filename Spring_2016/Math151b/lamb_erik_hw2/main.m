%Erik Lamb
%Homework 2
%Part 2

%Main script performs the different 2nd Order Taylor method and the
%Midpoint method on the given IVP

%IVP
y0 = 2;
f =@ (t,y) 1 + y/t;
df =@ (t,y) (1/t);
a = 1;
b = 2;

%Set array of h values
hval = zeros(3,1);
hval(3) = 0.2;
hval(2) = 0.1;
hval(1) = 0.05;

%2nd Order Taylor Approximations
%Declare array for runtime
taytime = zeros(3,1);

%h=0.2, N=5
tic
[tt1,tw1] = taylor2(a,b,5,y0,f,df);
taytime(3) = toc;

%h=0.1, N=10
tic
[tt2,tw2] = taylor2(a,b,10,y0,f,df);
taytime(2) = toc;

%h=0.05, N=20
tic
[tt3,tw3] = taylor2(a,b,20,y0,f,df);
taytime(1) = toc


%Midpoint Method
%Declare array for midpoint runtime
midtime = zeros(3,1);

%h=0.2, N=5
tic
[mt1,mw1] = midpt(a,b,5,y0,f);
midtime(3) = toc;

%h=0.1, N=10
tic
[mt2,mw2] = midpt(a,b,10,y0,f);
midtime(2) = toc;

%h=0.05, N=20
tic
[mt3,mw3] = midpt(a,b,20,y0,f);
midtime(1) = toc

%Actual Solution
y =@ (t) t.*log(t) + 2.*t;

%time array for solution plot
t = 1:0.001:2;

%Solution values at different time intervals
ty1 = zeros(5,1); %h=0.2
my1 = zeros(5,1); %h=0.2
for i = 1:5 
    ty1(i) = y(tt1(i)); 
    my1(i) = y(mt1(i));
end

ty2 = zeros(10,1); %h=0.1
my2 = zeros(10,1); %h=0.1
for i = 1:10 
    ty2(i) = y(tt2(i)); 
    my2(i) = y(mt2(i)); 
end

ty3 = zeros(20,1); %h=0.05
my3 = zeros(20,1); %h=0.05
for i = 1:20 
    ty3(i) = y(tt3(i));
    my3(i) = y(mt3(i)); 
end

%Error Arrays
te1 = abs(ty1-tw1);
te2 = abs(ty2-tw2);
te3 = abs(ty3-tw3);

me1 = abs(my1-mw1);
me2 = abs(my2-mw2);
me3 = abs(my3-mw3);

%Plots
figure 
hold on
plot(tt1,tw1,'b-')
plot(tt2,tw2,'r-')
plot(tt3,tw3,'g-')
plot(t,y(t),'k-')
title('Second Order Taylor Method y vs. t','FontSize',14)
xlabel('t','FontSize',14)
ylabel('y','FontSize',14)
legend('h=0.2','h=0.1','h-0.05','Exact')


hold off

figure
hold on
plot(mt1,mw1,'b-')
plot(mt2,mw2,'r-')
plot(mt3,mw3,'g-')
plot(t,y(t),'k-')
title('Midpoint Method y vs. t','FontSize',14)
xlabel('t','FontSize',14)
ylabel('y','FontSize',14)
legend('h=0.2','h=0.1','h-0.05','Exact')



hold off

%Run time plot
figure
hold on
plot(hval,taytime,'b-')
plot(hval,midtime,'r-')
title('Runtime vs. Timestep (T vs. h)','FontSize',14)
xlabel('Timestep h','FontSize',14)
ylabel('Runtime T','FontSize',14)
legend('2nd Order Taylor','Midpoint')
hold off


%Error Plots
figure
hold on
plot(tt1,te1,'b-')
plot(tt2,te2,'r-')
plot(tt3,te3,'g-')
title({'Absolute Error for 2nd Order Taylor Method','|y_i-w_i| vs. t'},'FontSize',14)
xlabel('t','FontSize',14)
ylabel('|y_i-w_i|','FontSize',14)
legend('h=0.2','h=0.1','h-0.05')
hold off

figure
hold on
plot(mt1,me1,'b-')
plot(mt2,me2,'r-')
plot(mt3,me3,'g-')
title({'Absolute Error for Midpoint Method','|y_i-w_i| vs. t'},'FontSize',14)
xlabel('t','FontSize',14)
ylabel('|y_i-w_i|','FontSize',14)
legend('h=0.2','h=0.1','h-0.05')
hold off



