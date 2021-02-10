%Erik Lamb
%Homework 3
%Problem 2b

%see fixed_point.m

%Find fixed point of gx using the fixed_point function
gx =@(x) pi + 0.5*sin(x/2);%define function in problem 2

TOL = 10^-4; %given tolerance

N = 50; %Max iterations

x0 = pi; %In the middle of the interval from 0 to 2pi

x_fix = fixed_point(x0, gx, TOL, N) %Approximate fixed-point value

gx_fix = gx(x_fix) %Check that x_fix is a fixed point by pluggin back into g(x)
