%Erik Lamb
%Homework 3
%Problem 2b

%Fixed-point method finds a fixed point x for the function f such that
%f(x)= x
%INPUTS: Initial approximation for the fixed point x0, function to find the
%fixed point of f, error tolerance and stopping condition TOL, and max
%number of iterations N.
%OUTPUTS: x, the fixed point or the colsest value to a fixed point of f
%within the given tolerance TOL

function x = fixed_point(x0, f, TOL, N)
    i = 1;
    
    while(i <= N) %Loops whil max iterations aren't exceeded
        x = f(x0); %Set x to the fucntion at the previous x value. Follows the fixed point theorem
        
        if(abs(x - x0) < TOL) %Stops if the given tolerance is met
            display('Max iterations: ') 
            fprintf('%d', i) %displays the number of iterations before returning 
            return
        end
        
        i = i+1; %If fucntion doesn't stop, increment i
        
        x0 = x; %Update x0
        
    end
    
    disp('Fixed Point method failed after N = %d' + N +' iterations.') %If the while loop ends then a fixed point was not found in N iterations
    return; %End function call
    
    
        
        
            