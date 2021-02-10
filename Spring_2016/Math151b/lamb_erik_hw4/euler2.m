%Erik Lamb
%Homework 4
%Part 2

%Euler function solves a given initial value problem using the Euler Method
%INPUTS: Inputs are the time interval [a,b], time step h,
%the initial condition at y(a) y0, and the derivative y'(t) = f(t,y) f. 
%OUTPUTS: The outputs are two vectors, t holds the time values at which the
%IVP is approximated, w holds the approximated values using Euler's method.
function [t, w] = euler2(a,b,h,y0,f)
 
    N = (b-a)/h; %Set number of iterations given time step
    %declare two empty arrays to store return values
    t = zeros(N+1,1);
    w = zeros(N+1,1);
   
    %Set initial values
    t(1) = a;
    w(1) = y0;
   
    %Loop through and perform Euler's method to find approximate solution
    for i = 2:N
       w(i+1) = w(i) + h*f(t(i),w(i)); %Eulers method approximation
       t(i+1) = t(i) + h; %Update time  
    end
    
    
    return;