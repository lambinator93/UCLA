%Erik Lamb
%Homework 7
%Part 2

%This code implements the Homotopy Method, which solves a system of
%nonlinear equaitions F(x) by first mapping them into the lambda domain of
%[0,1], thereby generating an N dimensional set of simple, linear, IVPs which can
%then be solved by an IVP solver with the increment function being PHI =
%-J^(-1)(x)F(x0). For this function we give two options of IVP solvers, the
%midpoint method and RK4.
%INPUTS: Initial approximation vector x0, system of equations F, corresponding 
%Jacobian matrix J, and a string variable which determines which IVP solver
%to use, called hoption
%OUTPUTS: x is a vector of n-elements consisting of the Homotopy and
%hoption method of approximation for the nonlinear system of equations, and runtime
%is the time required for the method to complete.

function [x, runtime] = homotopy(x0, F, J, N, hoption)

%Define the increment function PHI as it is used throughout
PHI =@(X) -J(X)\F(x0);

%Switch case. If the use lets hoption = 'midpoint' then the first case
%runs, and if the user lets hoption = 'rk4' then the second case runs
switch hoption 
    %midpoint method
    case 'midpoint' 
        tic; %start timer
        h = 1/N; %The space is divided into N intervals
        i=0; %set index to zero
        
        w = x0; %initial approximation for w
        
        %loop until the end of the interval is reached; lambda=1
        while i < N
            
            %Implement the midpoint method. Find the next approximation
            x = w + h*PHI(w+0.5*h*PHI(w));
            
            %Update w
            w = x;
            
            %Update index
            i = i+1;
        end
        
        %Get time
        runtime = toc;
    
    %Runge-Kutta Order 4 method
    case 'rk4'
        tic; %start timer
        h= 1/N; %The space is divided into N intervals
        i = 0; %set index to zero
        
        w = x0; %initial approximation for w
        
        %loop until the end of the interval is reached; lambda=1
        while i < N
            
            %Implement the rk4 method
            k1= h*PHI(w);
            k2= h*PHI(w+0.5*k1);
            k3= h*PHI(w+0.5*k2);
            k4= h*PHI(w+k3);
            
            %Find the next approximation
            x = w + (k1+2*k2+2*k3+k4)/6;
            
            %Update W
            w = x;
            
            %Update index
            i = i+1;
        end
        %Get time
        runtime = toc;
                   
end