%Erik Lamb
%Homework 6
%Part 2

%fd function implements the Finite-Difference method with Newton's
%method to approximate the solution, y, to a given nonlinear BVP. Note that
%this method uses the built in MATLAB operation left division, though the
%solution using left division required resizing to match the dimensions of
%the solution array w.
%INPUTS: Domain [a,b], boundary conditions A and B, second derivative
%y''=f(x,y,y'), derivative of f with respect to y fy, derivative of f with
%respect to y' fyp, number of subintervals N, absolute error tolerance TOL,
%and finally the maximum number of iterations M
%OUTPUTS: x is a vector of the position coordinates corresponding to the
%solutions of the BVP. w is a (N+1) array which stores the solutions y

function [x,w] = fd(a,b,A,B,f,fy,fyp,N,TOL,M)
    
    %Initial output arrays x,w, and matrices for calculations F,J
    x = zeros(N+2,1);
    w = zeros(N+2,1);
    F = zeros(N,1); %Array of funtions, given by example 1, lecture 16
    J = zeros(N,N); %Corresponding Jacobian matrix, given by example, lecture 16
    
    %Step size
    h = (b-a)/(N+1);
   
    %Initialize given beginning and endpoints
    x(1) = a;
    x(N+2) = b;
    w(1) = A;
    w(N+2) = B;
   
    %Create an initial approximation for the solution vector w
    for i = 2:1:(N+1)
        w(i) = A + i*((B-A)/(b-a))*h;
    end
    
    %Initialize increment. Keeps track of how many times the method runs.
    k = 1;
    
    %Will only try to find a solution until M iterations, then stops
    while k <= M
        
        %Initial the left boundary values, n=1. First element of F, first row of
        %J. Given by example 1, lecture 16
        x(2) = a + h;
        t = (w(3)-w(1))/(2*h);
        F(1) = 2*w(2) - w(3) + h*h*f(x(2),w(2),t)-A;
        J(1,1) = 2 + h*h*fy(x(2),w(2),t);
        J(1,2) = -1 + 0.5*h*fyp(x(2),w(2),t);
        
        %Fill in the intermediate values, n=2...N-1. F and J elements given
        %by example 1 from lecture 16
        for i = 3:1:N
            x(i) = a + (i-1)*h;
            t = (w(i+1) - w(i-1))/(2*h);
            F(i-1) = -w(i-1)+2*w(i)-w(i+1)+h*h*f(x(i),w(i),t);
            J(i-1,i-1) = 2+h*h*fy(x(i),w(i),t);
            J(i-1,i) = -1+0.5*h*fyp(x(i),w(i),t);
            J(i-1,i-2) = -1-0.5*h*f(x(i),w(i),t);
        end
        
        %Final n=N values for F and J, once again, given by example 1,
        %lecture 16.
        x(N+1) = b-h;
        t = (w(N+2)-w(N))/(2*h);
        F(N) = -w(N) + 2*w(N+1) + h*h*f(x(N+1),w(N+1),t) - B;
        J(N,N) = 2+h*h*fy(x(N+1),w(N+1),t);
        J(N,N-1) = -1-0.5*h*fyp(x(N+1),w(N+1),t);
        
        %This finds J^(-1)F using MATLABs left division operation. See the
        %Newton's method to solving a nonlinear system from lecture 16
        s = J\F;
        
        %Create a new arr with 2 extra spaces
        S = zeros(N+2,1);
        
        %Copy over s except for the endpoints. This makes w and s the same
        %dimension
        for i = 2:1:N+1
            S(i) = s(i-1);
        end
        
        %Implement Newton's method to find solution y
        w = w - S;
        
        %Checks if the norm of s is below our tolerance threshold. Ends
        %approximation if it is
        if norm(s) <= TOL
            return;
        end
        
        %Other increment the index k and do another iteration
        k = k+1;
        
    end
    
    %If the function leaves the while loop then the method failed.
    disp('Maximum number of iterations exceeded. Procedure unsuccessful')
    
    return;
    
    
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
    
    