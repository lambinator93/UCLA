%Erik Lamb
%Homework 4
%Problem 5

%Steffensen's Method method finds the fixed point of the passed function
%with accelerated quadratic convergence
%INPUTS: initial approximation x0, function of interest f, tolerance TOL,
%and max number of iterations N
%OUTPUTS: approximate fixed point solution x or an error message
function x = steffensen(x0, f, TOL, N)
    i = 1;
    
    while(i <= N)
        x1 = f(x0); %x1^(i - 1)
        x2 = f(x1); %x2^(i - 1)
        x = x0 - ((x1 - x0)^2)/(x2 - 2*x1 + x0); %x0^i
        
        if(abs(x - x0) < TOL)
            display('Max iterations for Steffensens Method: ') 
            fprintf('%d', i) %displays the number of iterations before returning 
            return
        end
        
        i = i + 1; %update i
        
        x0 = x; %update x0
        
    end
    
    disp('Modified Newton method failed after N = %d' + N +' iterations.') %If the while loop ends then a fixed point was not found in N iterations
    return; %End function call