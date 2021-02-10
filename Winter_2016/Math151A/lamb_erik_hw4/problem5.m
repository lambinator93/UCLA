%Erik Lamb
%Homework 4
%Problem 5

%See fixed_point.m
%See steffensen.m

%This code finds the fixed point of the following fucntion
f =@(x) 2^(-x);

%Common Parameters
TOL = 10^-4;
N = 50;
x0 = 1

%Function Calls
fixed_point(x0, f, TOL, N)

steffensen(x0, f, TOL, N)

%Both methods are equally accurate, but the steffensen method is much
%faster due to its accelerated, quadratic convergence.

