%Erik Lamb
%Homework 6
%Part 2

%shoot function implements the Nonlinear Shooting method with Newton's
%method and RK4 to approximate both solutions required by Newton's method.
%The shoot function is for solving non-linear BVPs.
%INPUTS: Domain [a,b], boundary conditions A and B, second derivative
%y''=f(x,y,y'), derivative of f with respect to y fy, derivative of f with
%respect to y' fyp, number of subintervals N, absolute error tolerance TOL,
%and finally the maximum number of iterations M
%OUTPUTS: x is a vector of the position coordinates corresponding to the
%solutions of the BVP. w is a 2x(N+1) matrix which stores the solutions y
%in w(1,i) and y' in w(2,i).
function [x,w] = shoot(a,b,A,B,f,fy,fyp,N,TOL,M)

    %Initialize step size, index k, and initial y'(a,t) = TK
    h = (b-a)/N;
    k=1;
    TK = 2.12; %(B-A)/(b-a) does not give convergence for mu = 2, requires better initial approximation for TK. 
    %This was determined from the initial slope of the finite-difference
    %method.
    
    %Declare empty arrays x,w (the return variables) and K, KP (used in
    %calulations
    x = zeros(1,N+1);
    w = zeros(2,N+1);
    K = zeros(4,2);
    KP = zeros(4,2);
   
    %Perform shoot method until maximum number of iterations M are reached
    while k <= M
        
        %Declare initial w and u1 and u2 (the u's are z(a,t)=u1,
        %z'(a,t)=u2)
        w(1,1) = A;
        w(2,1) = TK;
        u1=0;
        u2=1;
        
        %Set end point
        x(N+1) = b;
        
        %Loop until the maximum number of subintervals is reached.
        for i = 1:1:N
            
            %Increment position
            x(i) = a + (i-1)*h;
            
            %Perform RK4 on the solution variables y=w(1,i) and y'=w(2,i)
            K(1,1) = h*w(2,i);
            K(1,2) = h*f(x(i),w(1,i),w(2,i));
            K(2,1) = h*(w(2,i)+0.5*K(1,2));
            K(2,2) = h*f(x(i)+0.5*h,w(1,i)+0.5*K(1,1),w(2,i)+0.5*K(1,2));
            K(3,1) = h*(w(2,i)+0.5*K(2,2));
            K(3,2) = h*f(x(i)+0.5*h,w(1,i)+0.5*K(2,1),w(2,i)+0.5*K(2,2));
            K(4,1) = h*(w(2,i)+K(3,2));
            K(4,2) = h*f(x(i)+h,w(1,i)+K(3,1),w(2,i)+K(3,2));
            
            %Find next w(1,i+1), w(2,i+1) using RK4
            w(1,i+1) = w(1,i) + (K(1,1)+2*K(2,1)+2*K(3,1)+K(4,1))/6;
            w(2,i+1) = w(2,i) + (K(1,2)+2*K(2,2)+2*K(3,2)+K(4,2))/6;
            
            %Perform RK4 on z and z' terms u1 and u2.
            KP(1,1) = h*u2;
            KP(1,2) = h*(fy(x(i),w(1,i),w(2,i))*u1 + fyp(x(i),w(1,i),w(2,i))*u2);
            KP(2,1) = h*(u2+0.5*KP(1,2));
            KP(2,2) = h*(fy(x(i)+0.5*h,w(1,i),w(2,i))*(u1+0.5*KP(1,1)) + fyp(x(i)+0.5*h,w(1,i),w(2,i))*(u2+0.5*KP(1,2)));
            KP(3,1) = h*(u2+0.5*KP(2,2));
            KP(3,2) = h*(fy(x(i)+0.5*h,w(1,i),w(2,i))*(u1+0.5*KP(2,1)) + fyp(x(i)+0.5*h,w(1,i),w(2,i))*(u2+0.5*KP(2,2)));
            KP(4,1) = h*(u2+0.5*KP(3,2));
            KP(4,2) = h*(fy(x(i)+h,w(1,i),w(2,i))*(u1+KP(3,1)) + fyp(x(i)+h,w(1,i),w(2,i))*(u2+KP(3,2)));
            
            %Update u1 and u2 using RK4
            u1 = u1 + (KP(1,1)+2*KP(2,1)+2*KP(3,1)+KP(4,1))/6;
            u2 = u2 + (KP(1,2)+2*KP(2,2)+2*KP(3,2)+KP(4,2))/6;
            
        end
        
        %End program if the last approximation is within tolerance TOL
        if abs(w(1,N+1) - B) <= TOL
            return; 
        else
            %Otherwise update the initial y'(a,t)=TK using Newtons Method
            %and index k
            TK = TK - (w(1,N+1)-B)/u1;
            k = k+1;
        end
        
    end
    
    %If the program makes it out of the while-loop then it failed. 
    disp('Maximum number of iterations exceeded. Procedure unsuccessful.')
    
    return;
            
                
            
            
            
        