%Erik Lamb
%Homework 2
%Problem 5

%Bisection function finds a zero on the interval a to b for function F with
%tolerance TOL
%INPUTS: Interval endpoints a and b, function f, tolerance TOL, max number
%of iterations N.
%OUTPUTS: x, the approximate value of the zero for the function f on the
%interval a to b
function x = bisection(a, b, f, TOL, N)

    i = 1; %Start at 1, keeps track of iterations
    
    FA = f(a); %Set FA 
    
    
    while(i <= N) %Begins loop to find x and continually bisect interval
        
        p = a + (b-a)/2; %Bisect interval to find p, a possible zero for f on [a,b]
        FP = f(p); %Set FP
        
        if(FP == 0 || (b-a)/2 < TOL) %If FP is 0, or if the interval is less than TOL, then we found the zero on [a,b]
           x = p; %set return value to the zero
           return; %end function call
        end
        
        i = i + 1; %increment index
        
        if(sign(FA)*sign(FP) > 0) %If FA and FP are both positive
            a = p; %Decrease interval by setting a to p
            FA = FP; %Set FA to FP
        else
            b = p; %Otherwise FA and FP are opposite signs and we set b to p
        end
    end
    
    disp('Bisection method failed after N = '+ N +' iterations.') %If the while loop ends then a zero was not found in N iterations
    return; %End function call
    
    
    