%Erik Lamb
%Homework 6
%Part 2

%This is the main function which solves the Van der Pol equation for
%current in a vacuum tube with three internal elements given by the
%functions f below. This equation is a nonlinear BVP and is solved by 
%the numerical methods implemented in the functions shoot.m and fd.m. We
%solve the BVP for three different values of the constant u, which are
%u=0.1,1, and 2. All approximations are made using h=0.1.


%Common constants
%X interval [a,b]:
a = 0;
b = 2;
%Boundary conditions y(a)=A,y(b)=B:
A = 0;
B = 1;
%Spatial step h, subintervals N
h = 0.1;
N = (b-a)/h;
%Absolute error tolerance and maximum iterations
TOL = 10^(-4);
M = 100;

%BVP and its partial derivatives for u=0.1:
u = 0.1;
f =@(x,y,yp) u.*(y.^2 - 1).*yp - y;
fy =@(x,y,yp) 2.*u.*y.*yp - 1;
fyp =@(x,y,yp) u*(y.^2 -1);

%Call numerical methods
[xs1,ws1] = shoot(a,b,A,B,f,fy,fyp,N,TOL,M);
[xf1,wf1] = fd(a,b,A,B,f,fy,fyp,N,TOL,M);

%BVP and its partial derivatives for u=1:
u = 1;
f =@(x,y,yp) u.*(y.^2 - 1).*yp - y;
fy =@(x,y,yp) 2.*u.*y.*yp - 1;
fyp =@(x,y,yp) u*(y.^2 -1);

%Call numerical methods
[xs2,ws2] = shoot(a,b,A,B,f,fy,fyp,N,TOL,M);
[xf2,wf2] = fd(a,b,A,B,f,fy,fyp,N,TOL,M);

%BVP and its partial derivatives for u=2:
u = 2;
f =@(x,y,yp) u.*(y.^2 - 1).*yp - y;
fy =@(x,y,yp) 2.*u.*y.*yp - 1;
fyp =@(x,y,yp) u*(y.^2 -1);

%Call numerical methods
[xs3,ws3] = shoot(a,b,A,B,f,fy,fyp,N,TOL,M);
[xf3,wf3] = fd(a,b,A,B,f,fy,fyp,N,TOL,M);

%Plots
%All plots for both methods and u = 0.1, 1, and 2 are given. These plots
%are for TK = 2.12 in the shoot method. To see the original plots change TK
%to (B-A)/(b-a). These plots give a solution for using the shoot method for
%u=2 because we gave a good first approximation for TK. (B-A)/(b-a) is not
%a good first approximation for the Van der Pol equation using the shoot
%method for u=2.
hold on
plot(xf1,wf1, 'b-')
plot(xs1,ws1(1,:),'r--')



plot(xf2,wf2, 'b-')
plot(xs2,ws2(1,:),'r--')



plot(xf3,wf3, 'b-')
plot(xs3,ws3(1,:),'r-')

legend('Finite-Difference','Shooting Method')
text(1,1,'\mu = 0.1','FontSize',14)
text(1,1,'\mu = 1','FontSize',14)
text(1,1,'\mu = 2','FontSize',14)
title('Van der Pol Equation Solutions: y(x_i) vs. x_i','FontSize',16);
ylabel('y(x_i)', 'FontSize',14);
xlabel('x_i','FontSize',14);

hold off







