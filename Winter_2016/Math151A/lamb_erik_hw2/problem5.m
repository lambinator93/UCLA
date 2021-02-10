%Erik Lamb
%Homework 2
%Problem 5

%See bisection.m

%Part a
fa = @(x) sqrt(x) - cos(x); %Part a function definition

xa_approx = bisection(0, 1, fa, 10^-2, 30) %Calls the bisection fucntion defined. Finds the approximate zero of fa.
                                           %Note the tolerance is 10^-2 and the max iterations is set to 30.
                                     
                                      
%Part b
fb = @(x) x - 2*sin(x); %Part b function definition. Same as x = 2sin(x)

xb_approx = bisection(pi/2, pi, fb, 10^-5, 30) %Calls the bisection function. Finds approximate zero of fb.
                                               %Note the tolerance is 10^-5 and the max iterations is set to 30.
                                               
                                