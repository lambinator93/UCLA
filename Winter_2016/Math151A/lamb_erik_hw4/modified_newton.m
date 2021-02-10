%Erik Lamb
%Homework 4
%Problem 4

%Modified Newton's Method finds a root for the passed function f with quadratic convergence.
%INPUTS: x0, the initial approximation of the root, the function f,
%the first derivative of f df, the second derivative of f d2f
%the tolerance TOL, and the max number of iterations N
%OUTPUTS: x, the root approximation
function x = modified_newton(x0, f, df, d2f, TOL, N)
    i = 1;
    
    while(i <= N)
        x = x0 - (f(x0)*df(x0))/((df(x0))^2 - f(x0)*d2f(x0)); %Calculate xi using modified method
        
        if(abs(x - x0) < TOL)
            display('Max iterations for Modified Newtons Method: ') 
            fprintf('%d', i) %displays the number of iterations before returning 
            return
        end
        
        i = i+1; %Update i
        
        x0 = x; %Update x0
        
    end
    
    disp('Modified Newton method failed after N = %d' + N +' iterations.') %If the while loop ends then a fixed point was not found in N iterations
    return; %End function call