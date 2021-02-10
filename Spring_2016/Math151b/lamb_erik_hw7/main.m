clear; 
%Erik Lamb
%Homework 7
%Part 2

%This code is the main script which implements the Improved Broyden method
%function broyden.m, the method of Steepest Descent function steep.m, and
%the homotopy method, using the two IVP solvers midpoint method and RK4, 
%function homotopy.m for N=10, 20, and 50. We then compare these various
%methods to the actual solution that is determined by Newton's method using
%machine epsilon precision.



%System of nonlinear equations F and its Jacobian matrix J
F =@(x) ([15*x(1)+x(2)^2-4*x(3)-13;x(1)^2+10*x(2)-x(3)-11;x(2)^3-25*x(3)+22]);
J =@(x) ([15 2*x(2) -4; 2*x(1) 10 -1; 0 3*x(2)^2 -25]);

%Initial approximation
x0 = [0;0;0];

%Max Iterations
maxiter = 10000;

%Newtons Method. Actual solution
[xn,itern,timen] = newton(x0,F,J,eps,maxiter);

%Improved Broyden's Method
tolb = 10^(-6); %Tolerance
[xb, iterb, timeb] = broyden(x0,F,J,tolb, maxiter);
errb = max(abs(xb-xn)); %Infinite norm of the error with the actual solution xn

%Steepest Decline Method
tols = 0.05; %Tolerance
[xs, iters, times] = steep(x0,F,J,tols,maxiter);
errs = max(abs(xs-xn)); %Infinite norm of the error with the actual solution xn

%Homotopy 
R = 'rk4'; %String method determiners
M = 'midpoint';

N = 10;
[x10r, t10r] = homotopy(x0, F, J, N, R); %RK4, N=10
errr10 = max(abs(x10r-xn));

[x10m, t10m] = homotopy(x0, F, J, N, M); %Midpoint, N=10
errm10 = max(abs(x10m-xn));

N = 20;
[x20r, t20r] = homotopy(x0, F, J, N, R); %RK4, N=20
errr20 = max(abs(x20r-xn));

[x20m, t20m] = homotopy(x0, F, J, N, M); %Midpoint, N=20
errm20 = max(abs(x20m-xn));

N = 50;
[x50r, t50r] = homotopy(x0, F, J, N, R); %RK4, N=50
errr50 = max(abs(x50r-xn));

[x50m, t50m] = homotopy(x0, F, J, N, M); %Midpoint, N=50
errm50 = max(abs(x50m-xn));




