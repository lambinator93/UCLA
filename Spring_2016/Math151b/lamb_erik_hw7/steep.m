%Erik Lamb
%Homework 7
%Part 2

%This code implements the method of Steepest Descent which solves a
%nonlinear system of equations and finds the roots by following lines of
%the greatest decrease in the value of the function g(x), related to the
%system of equations F(x) by g(x)=F^t(x)F(x).
%INPUTS: Initial approximation vector x0, system of equations F, corresponding 
%Jacobian matrix J, error tolerance and stopping conditions tol, and
%maximum iterations maxiter
%OUTPUTS: x is a vector of n-elements consisting of the Steepest Descent method 
%approximation for the nonlinear system of equations, iter is the number of
%iterations required for the method to make an approximation, and runtime
%is the time required for the method to complete.

function [x, iter, runtime] = steep(x0,F,J,tol,maxiter)
    tic; %Start clock
    
    iter = 0; %Start index
   
    g=@(X)(F(X).'*F(X)); %Define function g(x)
    dg =@(X) 2*J(X).'*F(X); %Define the gradient of g(x) using the relation g(x) = 2J^t(x)F(x)
    h =@(a,X) g(X - a*dg(X)); %Function h(a) which we want to minimize in a. X is also a variable because h depends on g


    %loop until maximum number of iterations are reached
    while iter <= maxiter
        iter = iter+1; %increment index
        
        %Choose endpoints
        a1 = 0;
        a3 = 1;
        
        %loop until h(a3) is smaller than h(a1)
        while h(a3,x0) >= h(a1,x0)
            a3 = a3/2; %Divide by 2 to make h(a3) smaller
        end
     
        a2 = a3/2; %Define a2
        
        %Compute divided differences
        h1 = h(a1,x0);
        h12 = (h(a2,x0)-h(a1,x0))/(a2-a1);
        h23 = (h(a3,x0)-h(a2,x0))/(a3-a2);
        h123 = (h23-h12)/(a3-a1);
        
        %Polynomial P(a) we want to minimize to find the optimal a
        P =@(a) h1+h12*a+h123*a*(a-a2);
        
        %Critical point of P(a)
        ac = 0.5*(a2-h12/h123);
        
        %Set ac as the a that minimizes P(a)
        Pmin = P(ac);
        amin = ac;
        
        %Check if either endpoint is smaller, set a to that endpoint if it
        %is
        if Pmin > P(a1)
            Pmin = P(a1);
            amin = a1;
        end
        
        if Pmin > P(a3)
            Pmin = P(a3);
            amin = a3;
        end
        
        %By now the optimal a should have been found, defined as amin
        
        %Now increment x by the following relation using amin and the
        %gradient
        x = x0 - amin*dg(x0);
        
        %Stop the loop if the error is below tolerance
        if max(abs(x-x0))<tol
            runtime = toc;
            return;
        end
        
        %Otherwise update x0
        x0 = x;
    end
    
     %if this displays the method failed.
    disp('Maximum number of iterations reached. Method failed.')
    runtime = toc;
    return;
        
                
        