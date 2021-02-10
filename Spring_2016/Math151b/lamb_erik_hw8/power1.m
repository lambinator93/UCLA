%Erik Lamb
%Homework 8
%Part 2

%This function implements the power method with infinite vector scaling
%where l_inf = max(abs(x_i)) of a vector x. Given a matrix A, the power method
%approximates the dominant eigenvalue and eigenvector of the matrix.
%INPUTS: Matrix A, initial approximation vector x,
%error toleracne TOL, maximum number of iteration MAX.
%OUTPUTS: The approximated dominant eigenvalue e and the approximated dominant eigenvector
%x with infinite norm scaling ||x|| = 1, number of iterations k

function [e, x, k] = power1(A,x,TOL,MAX)

    k = 1; %iteration
    
    x = x/max(abs(x)); %normalize x
    
    while k<=MAX
        
        w = A*x; %update eigenvector approximation
        
        e = max(abs(w)); %update eigenvalue
        
        if e == 0
            disp('Matrix has dominant eigenvalue of 0. Select new vector x and restart.')
            return;
        end
        
        xp = x; %set previous x
        x = w/max(abs(w)); %normalize eigenvector with infinite norm
        
        %end function if tolerance is reached
        if max(abs(x-xp))<TOL
            return;
        end
        
        %update k
        k = k+1;
        
    end
    
    %display if maximum number of iterations is exceeded
    disp('Power1 method failed. Maximum number of iterations exceeeded.')
    return;