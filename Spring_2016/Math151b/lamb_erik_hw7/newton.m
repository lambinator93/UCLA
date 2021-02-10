%Erik Lamb
%Homework 7
%Part 2


%This function implements the Newton method for solving nonlinear systems
%of equations. Though this method is not of interest in this assignment, it
%is neccessary to find the ``actual'' answer to the given system. The
%method is a generalized version of the Newton IVP method studied earlier.
%To obtain an a very good approximation, the tolerance will be the machine
%precision 'eps'.
%INPUTS: Initial approximation vector x0, system of equations F, corresponding 
%Jacobian matrix J, error tolerance and stopping conditions tol, and
%maximum iterations maxiter
%OUTPUTS: x is a vector of n-elements consisting of the Newton method 
%approximation for the nonlinear system of equations, iter is the number of
%iterations required for the method to make an approximation, and runtime
%is the time required for the method to complete.
function [x, iter, runtime] = newton(x0,F,J,tol,maxiter)
    tic; %start clock
    iter = 0; %start index
    
    while iter <= maxiter %stop if the index exceeds max iteration
        iter = iter+1;
        
        x = x0 - J(x0)\F(x0); %Implement Newtons method
        
        %stop if the inifite norm of x-x0 is smaller than machine precision
        
        
        if max(abs(x-x0)) < tol
            runtime = toc;
            return
        end
        
        %otherwise increment the index and update the x0
        
        x0 = x;
        
    end
    
    %if this displays the method failed.
    disp('Maximum number of iterations reached. Method failed.')
    runtime = toc;
    return
    
    
        
        
    