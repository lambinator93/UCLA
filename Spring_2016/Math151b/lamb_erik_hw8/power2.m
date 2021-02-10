%Erik Lamb
%Homework 8
%Part 2

%This function implements the power method with l_2 vector scaling
%where l_2 = sqrt(sum(x_i^2)) of a vector x. Given a matrix A, the power method
%approximates the dominant eigenvalue and eigenvector of the matrix.
%INPUTS: Matrix A, initial approximation vector x,
%error toleracne TOL, maximum number of iteration MAX.
%OUTPUTS: The approximated dominant eigenvalue e and the approximated dominant eigenvector
%x with l_2 norm scaling ||x|| = 1, number of iterations k

function [e, x, k] = power2(A,x,TOL,MAX)

    k = 1; %iteration
    
    x = x/sqrt(x.'*x); %normalize x with l_2 norm
   
    while k<=MAX
        
        w = A*x; %update eigenvector approximation
        
        e = x.'*w; %update eigenvalue
        
        
        wn = sqrt(w.'*w); %norm of w 
        
        if wn == 0
            disp('Matrix has dominant eigenvalue of 0. Select new vector x and restart.')
            return;
        end
        
        xp = x; %set previous x
        x = w/wn; %normalize eigenvector with l_2 norm
        
        d = x - xp; %find difference
        
        %end function if tolerance is reached. l_2 norm of d is less than
        %TOL
        if sqrt(d.'*d)<TOL
            return;
        end
        
        %update k
        k = k+1;
        
    end
    
    %display if maximum number of iterations is exceeded
    disp('Power2 method failed. Maximum number of iterations exceeeded.')
    return;