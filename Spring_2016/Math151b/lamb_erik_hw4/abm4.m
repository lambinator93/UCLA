%Erik Lamb
%Homework 4
%Part 2

%ABM4 function solves a given initial value problem using the Adams
%Fourth-Order Predictor-Corrector algorithm. Uses RK4 to find initial
%approximations, explicit Adams-Bashforth to predict w4, and implicit Adams-Moulton to
%correct it.
%INPUTS: Inputs are the time interval [a,b], time step h,
%the initial condition at y(a)=y0, and the derivative y'(t) = f(t,y) f. 
%OUTPUTS: The outputs are two vectors, t holds the time values at which the
%IVP is approximated, w holds the approximated values using the Adams Fourth-Order
%Predictor Corrector method.

function [t, w] = abm4(a,b,h,y0,f)

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
        
        %Compute prediction using initial values with Adams-Bashforth
        wp = w(i) + h*(55*f(t(i),w(i))-59*f(t(i-1),w(i-1))+37*f(t(i-2),w(i-2))-9*f(t(i-3),w(i-3)))/24;
        
        %Compute corrector using wp, initial values and Adams-Moulton 
        w(i+1) = w(i) + h*(9*f(t(i+1),wp)+19*f(t(i),w(i))-5*f(t(i-1),w(i-1))+f(t(i-2),w(i-2)))/24;
        
    end
    
    return;
    
    
        
        