%Erik Lamb
%Homework 4
%Part 2

%RK4 function solves a given initial value problem using the fourth order
%Runge-Kutta method
%INPUTS: Inputs are the time interval [a,b], time step h,
%the initial condition at y(a)=y0, and the derivative y'(t) = f(t,y) f. 
%OUTPUTS: The outputs are two vectors, t holds the time values at which the
%IVP is approximated, w holds the approximated values using RK4.
function [t, w] = rk4(a,b,h,y0,f)
    
    N = (b-a)/h; %Set number of iterations given time step
    
    %declare two empty arrays to store return values
    t = zeros(N+1,1);
    w = zeros(N+1,1);
    
    
    %Set initial values
    t(1) = a; 
    w(1) = y0;
    
    
    %Fill arrays t, w with meshpoints and approximations, respectively
    for i = 1:N
        %Implement RK4
        K1 = h*f(t(i), w(i));
        K2 = h*f(t(i)+h/2, w(i) + K1/2);
        K3 = h*f(t(i)+h/2, w(i) + K2/2);
        K4 = h*f(t(i)+h, w(i)+ K3);
        
        %Set next approximation
        w(i+1) = w(i) + (K1+2*K2+2*K3+K4)/6; 
        %Set next time value
        t(i+1) = t(i)+h;
    end
    
    return; 
