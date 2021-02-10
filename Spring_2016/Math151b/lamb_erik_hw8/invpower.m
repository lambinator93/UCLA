%Erik Lamb
%Homework 8
%Part 2

%This function implements the inverse power method with l_inf vector scaling
%where l_inf = max(abs(x_i)) of a vector x. Given a matrix A, the inverse power method
%approximates the dominant eigenvalue and eigenvector of the matrix.
%INPUTS: Matrix A, initial approximation vector x,
%error toleracne TOL, maximum number of iteration MAX.
%OUTPUTS: The approximated dominant eigenvalue e and the approximated dominant eigenvector
%x with l_inf norm scaling ||x|| = 1, number of iterations k

function [e, x, k] = invpower(A,x,TOL,MAX)

    k = 1; %iteration
    
    q = (x.'*A*x)/(x.'*x); %Set q approximation. Want close to eigenvalue e
   
    x = x/max(abs(x)); %normalize x with l_inf norm
    
    I = eye(size(A,1)); %create an identity matrix the same size as A
    
    while k<=MAX
        
        w = x\(A-q*I); %update eigenvector approximation. 
        
        xp = x; %set previous x
        
        wn = max(abs(w)); %norm of w 
        x = (w/wn).'; %normalize eigenvector with l_inf norm
        
        e = max(abs(w)); %update eigenvalue
        
        if max(abs(x-xp))<TOL
            return;
        end
        
        %update k
        k = k+1;
        
    end
    
    %display if maximum number of iterations is exceeded
    disp('Invpower method failed. Maximum number of iterations exceeeded.')
    return;