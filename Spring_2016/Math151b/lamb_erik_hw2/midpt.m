%Erik Lamb
%Homework 2
%Part 2b

%Implements the Midpoint difference method for solving IVPs
%INPUTS: Inputs are the time interval [a,b], the number of steps N, the
%initial value y0 at a, and the derivative y'=f.
%OUTPUTS: The outputs are two vectors, t holds the time values at which the
%IVP is approximated, w holds the approximated values using the Midpoint method.

function [t,w] = midpt(a,b,N,y0,f)
    
    %declare two empty arrays to store return values
    t = zeros(N,1);
    w = zeros(N,1);
    
    %set the time step h
    h = (b-a)/N;
   
    %Set initial values
    t(1) = a;
    w(1) = y0;
    
    %Loop through and perform the Midpoint method to find approximate solution
    for i = 2:N
       w(i) = w(i-1) + h*f(t(i-1)+(h/2),w(i-1)+(h/2)*f(t(i-1),w(i-1))); %Midpoint method approximation
       t(i) = a + i*h; %Update time  
    end
    
    
    return;