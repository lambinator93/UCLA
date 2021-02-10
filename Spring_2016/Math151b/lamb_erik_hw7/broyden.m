%Erik Lamb
%Homework 7
%Part 2

%This code implements the improved Broyden method for solving nonlinear
%systems of equations. The Broyden method is a quasi-Newton method, derived
%from using the secant method to approximate the Jacobian matrix at each
%iteration.
%INPUTS: Initial approximation vector x0, system of equations F, corresponding 
%Jacobian matrix J, error tolerance and stopping conditions tol, and
%maximum iterations maxiter
%OUTPUTS: x is a vector of n-elements consisting of the Broyden method 
%approximation for the nonlinear system of equations, iter is the number of
%iterations required for the method to make an approximation, and runtime
%is the time required for the method to complete.

function [x, iter, runtime] = broyden(x0,F,J,tol,maxiter)
    tic; %start timer
    iter = 0; %set iterations to zero
    
    B0 = J(x0)^(-1); %find the initial matrix B0 using the inverse of the Jacobian at x0
    F(x0);
    %Loop until the maximum number of iterations are reached
    while iter <= maxiter
        %Increment index
        iter = iter+1;
        
        
        %Implement the improved Broyden's method, Algorithm 2, lecture 18
        s = -B0*F(x0); %Approximate -J^-1F 
        x = x0 + s; %Increment x 
        y = F(x) - F(x0); %Backward difference of F
        B = B0 + ((s-B0*y)*s.'*B0)/(s.'*B0*y); %Increment B 
        
        %If the infinite norm of x-x0 is less than the tolerance, stop the
        %function as an approximation has been found.
        if abs(max(x-x0))< tol
            runtime = toc; %Set the runtime
            return;
        end
        
        %Update variables
        x0 = x;
        B0 = B;
        
        
        
    end
    
    %If this displays the maximum number of iterations has been exceeded
    %and the method failed.
    disp('Maximum number of iterations reached. Method failed.')
    runtime = toc;
    return