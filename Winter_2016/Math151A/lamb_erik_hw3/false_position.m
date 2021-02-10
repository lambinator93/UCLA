%Erik Lamb
%Homework 3
%Problem 3c

%Method of False Position approximates a root x for the function f
%using a method similar to the secant method with the added insurance that
%the fixed point lies within successive intervals
%INPUTS: Initial boundaries x0 and x1, function f to find the root of,
%tolerance of error TOL, and maximum number of iterations N
%OUTPUTS: x, the root approximation

function x = false_position(x0, x1, f, TOL, N)
    %Initialize variables used to calculate xi
    i = 2;
    q0 = f(x0);
    q1 = f(x1);
    
    while(i <= N)
        x = x1 - q1*(x1 - x0)/(q1 - q0); %Calculae xi
        
        if(abs(x - x1) < TOL)
            display('Max iterations for Method of False Position: ') 
            fprintf('%d', i) %displays the number of iterations before returning 
            return
        end
        
        i = i+1; %Update i
        
        q = f(x); %Initialz q, used for finding next interval
        
        if(sign(q)*sign(q1) < 0) %Keeps root within successive interval
            x0 = x1;
            q0 = q1;
        end
        
        %Update x1 and q1
        x1 = x;
        q1 = q;
        
    end
    
    disp('Method of False Position failed after N = %d' + N +' iterations.') %If the while loop ends then a fixed point was not found in N iterations
    return; %End function call
        
        
            
        
        
    