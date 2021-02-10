%Erik Lamb
%Homework 1
%Part 2

%Main function performs the different Euler approximations on the given IVP
%for different h (N) values.

%function f(t,y) = y'(t) for the IVP. r =0.2, K=4000
r = 0.2;
K = 4000;
f =@ (t,y) r*(1-(y/K))*y;

%Time interval values, initial conditions
a = 0;
b = 50; %years

y0 = 1000; %Initial condition at a

%Euler Approximations
%h=10, N=5
[t1, w1] = euler(a,b,5,y0,f);

%h=1, N=50
[t2, w2] = euler(a,b,50,y0,f);

%h=0.1, N=50
[t3, w3] = euler(a,b,500,y0,f);

%Actual solution and its values
y =@ (t) (y0*K)/(y0 + (K-y0)*exp(-r*t)); %solution

%Solution values at different time intervals
y1 = zeros(5,1); %h=10
for i = 1:5 
    y1(i) = y(t1(i)); 
end

y2 = zeros(50,1); %h=1
for i = 1:50 
    y2(i) = y(t2(i)); 
end

y3 = zeros(500,1); %h=0.1
for i = 1:500 
    y3(i) = y(t3(i)); 
end


%plots
%approximation and solution plots
hold on 
plot(t1,w1, 'b-')
plot(t1,y1,'b--')
plot(t2,w2,'r-')
plot(t2,y2,'r--')
plot(t3,w3,'g-')
plot(t3,y3,'g--')
title('Population vs. Time: r = 0.2, K = 4000, y0 = 1000', 'FontSize',14)
xlabel('Time t_i','FontSize',14)
ylabel('Population','FontSize',14)
legend('h=10 Euler', 'h=10 Actual', 'h=1 Euler', 'h=1 Actual', 'h=0.1 Euler', 'h=0.1 Actual')
hold off

%error plots
figure
hold on 
plot(t1,abs(y1-w1), 'b-')
plot(t2,abs(y2-w2),'r-')
plot(t3,abs(y3-w3),'g-')

title('Absolute Error |y(t_i)-w_i| vs. Time: r = 0.2, K = 4000, y0 = 1000', 'FontSize',14)
xlabel('Time t_i','FontSize',14)
ylabel('Absolute Error |y(t_i)-w_i|','FontSize',14)
legend('h=10', 'h=1', 'h=0.1')
hold off

%Absolute error, find the max error
e1 = abs(y1-w1);
e2 = abs(y2-w2);
e3 = abs(y3-w3);

%Second derivative. Find maximum
d2y =@(t) (2880000000000.*exp(-(2.*t)/5))/(3000.*exp(-t./5) + 1000).^3 - (480000000.*exp(-t./5))/(3000.*exp(-t./5) + 1000).^2;
d2y3 = zeros(500,1);
for i = 1:500
    d2y3(i)=d2y(t3(i));
end
figure
hold on
title('d^2y/dt^2 vs t','FontSize',14)
xlabel('t','FontSize',14)
ylabel('d^2y/dt^2','FontSize',14)
plot(t3,d2y3, 'b-')
hold off

