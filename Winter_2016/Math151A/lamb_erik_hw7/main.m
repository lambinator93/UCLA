%Erik Lamb
%Homework 7

load('data.mat')

%Path Problem
%part a
ta = 0:0.01:3.1;
[pl,~] = findpath(ip, ta.', 'lagrange');
[ps,~] = findpath(ip, ta.', 'spline');

subplot(2,1,1)
hold on
plot(pl(:,1),pl(:,2), 'b-')
plot(ps(:,1),ps(:,2), 'r--')
xlabel('Test Points x', 'FontSize', 12)
ylabel('P_x(x) and S_x(x)','FontSize',12)
title({'Lagrange and Spline Interpolations versus X: Equidistant Nodes','X-Values'},'FontSize',13)
legend('P_x(x)', 'S_x(x)')
hold off

subplot(2,1,2)
hold on
plot(pl(:,1),pl(:,3), 'b-')
plot(ps(:,1),ps(:,3), 'r--')
xlabel('Test Points x', 'FontSize', 12)
ylabel('P_y(x) and S_y(x)','FontSize',12)
title('Y-Values','FontSize',13)
legend('P_y(x)', 'S_y(x)')
ylim([-0.05,0.05])
hold off


%Part b
[plb,~] = findpath(ip, tp, 'lagrange');
[psb,~] = findpath(ip, tp, 'spline');

figure
subplot(2,1,1)
hold on
plot(plb(:,1),plb(:,2), 'b-')
plot(psb(:,1),psb(:,2), 'r--')
xlabel('Test Points x', 'FontSize', 12)
ylabel('P_x(x) and S_x(x)','FontSize',12)
title({'Lagrange and Spline Interpolations versus X: Uniformly Distributed ','X-Values'},'FontSize',13)
legend('P_x(x)', 'S_x(x)')
hold off

subplot(2,1,2)
hold on
plot(plb(:,1),plb(:,3), 'b-')
plot(psb(:,1),psb(:,3), 'r--')
xlabel('Test Points x', 'FontSize', 12)
ylabel('P_y(x) and S_y(x)','FontSize',12)
title('Y-Values','FontSize',13)
legend('P_y(x)', 'S_y(x)')
ylim([-1.5,1.5])

hold off

%Runge's Phenomenon
f =@(x) 1./(1+25.*x.^2);

%nodes
n1 = linspace(-1,1,10);
n2 = linspace(-1,1,20);
n3 = linspace(-1,1,30);
%Chebyshev nodes
n=10;
j = 1:1:n;
c = cos((2.*j-1)*pi./(2*n));

t = linspace(-1,1,1000);

%Approximations
%10
p1 = divdif(n1,f(n1));
f1 = evalP(p1,n1,t);
%20
p2 = divdif(n2,f(n2));
f2 = evalP(p2,n2,t);
%30
p3 = divdif(n3,f(n3));
f3 = evalP(p3,n3,t);

%Chebyshev

n=10;
j = 1:1:n;
c = cos((2.*j-1)*pi./(2*n));

pc10 = divdif(c,f(c));
fc10 = evalP(pc10,c,t);

n=15;
j = 1:1:n;
c = cos((2.*j-1)*pi./(2*n));

pc15 = divdif(c,f(c));
fc15 = evalP(pc15,c,t);

n=20;
j = 1:1:n;
c = cos((2.*j-1)*pi./(2*n));

pc20 = divdif(c,f(c));
fc20 = evalP(pc20,c,t);

n=25;
j = 1:1:n;
c = cos((2.*j-1)*pi./(2*n));

pc25 = divdif(c,f(c));
fc25 = evalP(pc25,c,t);


n=30;
j = 1:1:n;
c = cos((2.*j-1)*pi./(2*n));

pc30 = divdif(c,f(c));
fc30 = evalP(pc30,c,t);


%Cheb Error Plots
figure
hold on
title('Absolute Error from Runge Function using Chebyshev Nodes','FontSize',13)
xlabel('Test Points x','FontSize', 12)
ylabel('Absolute Error |f(x)-P(x)|','FontSize',12)
plot(t,abs(f(t).'-fc10),'b-')
plot(t,abs(f(t).'-fc15),'m-')
plot(t,abs(f(t).'-fc20),'r-')
plot(t,abs(f(t).'-fc25),'c-')
plot(t,abs(f(t).'-fc30),'g-')
legend('n=10','n=15','n=20','n=25','n=30')
ylim([-0.025,0.275])
hold off

%Cheb Function plots
figure
hold on
title('Runge Function and Approximations using Chebyshev Nodes','FontSize',13)
xlabel('Test Points x','FontSize',12)
ylabel('P_n(x) and f(x)','FontSize',12)
plot(t, f(t), 'k-')
plot(t, fc10, 'b-')
plot(t, fc15, 'm-')
plot(t, fc20, 'r-')

plot(t, fc25, 'c-')

plot(t,fc30,'g-')
legend('f(x) Runge','n=10','n=15','n=20','n=25','n=30')
hold off

%Error plots
figure
subplot(3,1,1)
hold on
title('Absolute Error from Runge Function using Equidistant Nodes','FontSize',13)
plot(t, abs(f(t).'-f1),'r-')
text(-0.075,0.3,'n=10','FontSize',13)
hold off
subplot(3,1,2)
hold on
ylabel('Absolute Error |f(x)-P(x)|','FontSize',12)
text(-0.075,7.5,'n=20','FontSize',13)
plot(t,abs(f(t).'-f2),'r-')
ylim([-0.5,0.5])
hold off
subplot(3,1,3)
hold on
plot(t,abs(f(t).'-f3),'r-')
text(-0.075,300,'n=30','FontSize',13)
xlabel('Test Points x','FontSize', 12)
hold off


%Function plots
figure

subplot(3,1,1)
hold on
title('Runge Function and Approximations using Equidistant Nodes','FontSize',13)
text(-0.7,0.75,'n=10','FontSize',13)
plot(t, f(t), 'b-')
plot(t, f1, 'r-')
legend('f(x) Runge','P_n(x)')
hold off
subplot(3,1,2)
hold on
text(-0.7,7.5,'n=20','FontSize',13)



ylabel('P_n(x) and f(x)','FontSize',12)
plot(t, f(t), 'b-')
plot(t, f2, 'r-')
hold off
subplot(3,1,3)
hold on
text(-0.7,125,'n=30','FontSize',13)

plot(t, f(t), 'b-')
plot(t,f3,'r-')
xlabel('Test Points x','FontSize',12)

hold off





