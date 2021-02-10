%Erik Lamb
%Homework 3
%Problem 3b

%Secant Method finds a root for the function f using a modification
%of the Newton Method that uses successive secat lines rather than tangent
%lines
%INPUTS: Initial boundaries x0 and x1, function f to find the root of,
%tolerance of error TOL, and maximum number of iterations N
%OUTPUTS: x, the root approximation

function x = secant(x0, x1, f, TOL, N)
    %initialize variables 
    i = 2;
    q0 = f(x0); 
    q1 = f(x1);
    
    while(i <= N)
        x = x1 - q1*(x1 - x0)/(q1 - q0); %Calculate xi
        
        if(abs(x - x1) < TOL)
            display('Max iterations for Secant Method: ') 
            fprintf('%d', i) %displays the number of iterations before returning 
            return
        end
        
        i = i+1; %Update i
        
        %Update variables used to find xi
        x0 = x1;
        q0 = q1;
        x1 = x;
        q1 = f(x);
        
    end
    
    disp('Secant method failed after N = %d' + N +' iterations.') %If the while loop ends then a fixed point was not found in N iterations
    return; %End function call
    

