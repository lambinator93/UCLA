%Erik Lamb
%Homework 4
%Part 2

%ms function solves a given initial value problem using the Milnes-Simpson
%Predictor-Corrector algorithm which is similar to ABM4 and uses RK4 for
%initial approximations, but then uses explicit Milnes method for a
%prediction and implicit Simpson method for a correction.
%INPUTS: Inputs are the time interval [a,b], time step h,
%the initial condition at y(a)=y0, and the derivative y'(t) = f(t,y) f. 
%OUTPUTS: The outputs are two vectors, t holds the time values at which the
%IVP is approximated, w holds the approximated values using the Milnes-Simpson method.

function [t, w] = ms(a,b,h,y0,f)

    N = (b-a)/h; %Set number of iterations given time step
    
    %declare two empty arrays to store return values
    t = zeros(N+1,1);
    w = zeros(N+1,1);
    
    
    
    %Set initial values
    t(1) = a; 
    w(1) = y0;
    
    
    for i = 1:3
        %Starting values computed using RK4
        K1 = h*f(t(i), w(i));
        K2 = h*f(t(i) + h/2, w(i) + K1/2);
        K3 = h*f(t(i) + h/2, w(i) + K2/2);
        K4 = h*f(t(i) + h, w(i) + K3);
        
        %Set new approximation and time
        w(i+1) = w(i) + (K1 + 2*K2 + 2*K3 + K4)/6;
        t(i+1) = t(i) + h;
    end
    
    for i = 4:N
        %Compute next time
        t(i+1) = t(i) + h;
        
        %Compute prediction using initial values with explicit Milnes method
        wp = w(i-3) + 4*h*(2*f(t(i),w(i))-f(t(i-1),w(i-1))+2*f(t(i-2),w(i-2)))/3;
      
        %Compute corrector using wp, initial values and implicit Simpson method 
        w(i+1) = w(i-1) + h*(f(t(i+1),wp)+4*f(t(i),w(i))+f(t(i-1),w(i-1)))/3;
        
    end
    
    return;