%Erik Lamb
%Homework 3
%Problem 3

f =@(x) (((230*x + 18)*x + 9)*x - 221)*x - 9; %Given function written to give the least round-off error
df =@(x) ((920*x + 54)*x + 18)*x - 221; %Derivative of given function written to reduce round-off error

%Needed for all parts
TOL = 10^-5;
N = 30;
a = -1;
b = 0;
c = 1;

%Part a: Newton Method
%[-1, 0]
x0 = -0.5;
disp('Newton Method on [-1,0]:')
x_NEWT = newton(x0, f, df, TOL, N)
%[0,1]
x0 = 0.5;
disp('Newton Method on [0,1]:')
x_NEWT = newton(x0, f, df, TOL, N)

%Part b: Secant Method
%[-1,0]
disp('Secant Method on [-1,0]:')
x_SEC = secant(a, b, f, TOL, N)
%[0,1]
disp('Secant Method on [0,1]:')
x_SEC = secant(b, c, f, TOL, N)

%Part c: Method of False Position
%[-1,0]
disp('Method of False Position on [-1,0]:')
x_FALSE = false_position(a, b, f, TOL, N)
%[1,0]
disp('Method of False Position on [1,0]:')
x_FALSE = false_position(b, c, f, TOL, N)

%You need a good first approximation for the Newton and Secant method
%otherwise you may get the wrong answer for the root of the function. The
%algorithms may move towards another nearby root. The Method of False
%Position, on the other hand, ensures that the root is always within the
%starting interval and each successive interval. Though it takes more
%iterations, it ultimately gives us the correct answer without having to
%worry about a good first approximation.

