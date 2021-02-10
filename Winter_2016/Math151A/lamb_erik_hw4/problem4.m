%Erik Lamb
%Homework 4
%Problem 4

%See newton.m 
%See modified_newton.m

%Determines which method is faster and more accurate

%Necessary fucntion and its derivatives
f =@(x) cos(x + sqrt(2)) + x*(x/2 + sqrt(2));
df =@(x) -sin(x + sqrt(2)) + x + sqrt(2);
d2f =@(x) -cos(x + sqrt(2)) + 1;

%Commonly used parameters
TOL = 10^-5;
N = 100;
x0 = -2 %Interval -2 <= x <= -1 midpoint

%Function Calls
newton(x0, f, df, TOL, N)

modified_newton(x0, f, df, d2f, TOL, N)


%Modified Newton method is definitely faster than the original Newton
%method, finishing in only 2-3 iterations whereas the orginal method can go
%well into the 20s. Different choices for x0 result in different answers
%for the original method as well. 
%For x0 = -2, original Newton finds x = -1.4144
%For x0 = -1.5, original Newton finds x = -1.4145
%For x0 = -1, original Newton finds x = -1.4140
%Modified Newton has the same value for each x0, leading me to believe it
%is the correct value and therefore more accurate