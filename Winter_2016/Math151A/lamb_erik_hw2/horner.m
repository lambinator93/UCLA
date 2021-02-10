%Erik Lamb
%Homework 2
%Problem 4 

%horner function evaluates a polynomial of arbitrary coefficients and of
%any order.
%INPUTS: are coeffs, a column vector of coefficients representing the
%polynomial, and x0, the value at which the polynomial is to be evaluated.
%The first term of coeffs represents the coefficient of the highest order
%term of the polynomial. The last term represents the constant. 
%OUTPUTS: value is y, the polynomial evaluated at x0
function y = horner(coeffs, x0)

    y = coeffs(1)*x0; %Return value, start at coeffs(1)*x0
    i = 2; %Vector index. Starts at 2
 
    while(i <= length(coeffs))%Loops until the index is greater than the vector size
        
        if(i < length(coeffs))
            y = (y + coeffs(i))*x0 ; %Rewrites polynomial in nested manner to perform less operations
        else
            y = y + coeffs(i); %Handles the n = 0 order case. The constant is summed with y
        end
        
        i = i + 1; %Increase index
   
    end
    
    