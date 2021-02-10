%Erik Lamb
%Homework 3
%Problem 3a

%Newton's Method finds a root for the passed function f using
%successive tangent lines.
%INPUTS: x0, the initial approximation of the root, the function f,
%the first derivative of f df,
%the tolerance TOL, and the max number of iterations N
%OUTPUTS: x, the root approximation
function x = newton(x0, f, df, TOL, N)
    i = 1;
    
    while(i <= N)
        x = x0 - f(x0)/df(x0); %Calculate xi
        
        if(abs(x - x0) < TOL)
            display('Max iterations for Newtons Method: ') 
            fprintf('%d', i) %displays the number of iterations before returning 
            return
        end
        
        i = i+1; %Update i
        
        x0 = x; %Update x0
        
    end
    
    disp('Newton method failed after N = %d' + N +' iterations.') %If the while loop ends then a fixed point was not found in N iterations
    return; %End function call
        
    
    