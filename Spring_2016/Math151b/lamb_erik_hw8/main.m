%Erik Lamb
%Homework 8
%Part 2

%This code implements the the functions power1.m, power2.m, and invpower.m,
%using all three methods to find the dominant eigenvector and eigenvalue of
%a modified adjacency matrix M which models the PageRank algorithm of the
%Google search engine. The results and performance of the three methods are
%then compared with the actual solution found using the MATLAB function
%eig.

clear;

%Declare adjacency matrix from Figure 1 in the homework. 15x15 array
B = [ 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0; 1 0 0 0 0 0 0 0 0 0 1 0 0 0 0; 
    0 1 0 0 1 0 0 0 0 0 0 0 0 0 0; 1 1 0 0 0 0 0 0 0 0 0 0 1 0 0;
    0 0 0 0 0 1 0 1 0 0 0 0 0 0 0; 0 0 0 0 0 0 1 1 0 1 0 0 0 0 0;
    0 0 0 0 0 0 0 0 0 1 0 0 0 0 0; 0 0 0 0 0 0 0 0 1 1 0 0 0 0 0;
    0 0 0 0 1 0 0 0 0 0 1 0 0 0 0; 0 0 0 0 0 0 0 0 1 0 1 0 0 1 0;
    0 0 0 0 0 0 0 0 0 0 0 1 0 1 0; 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0;
    0 0 0 0 0 0 0 0 0 0 1 0 0 0 1; 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0;
    0 0 0 0 0 0 0 0 0 0 0 0 0 1 0];

n = 15; %dimension of B
p = 0.85; %damping factor

for i = 1:1:15
    for j = 1:1:15
        m(i,j) = p*B(i,j)/sum(B(i,:)) + (1-p)/n; %Create modified adjacency matrix using B
    end
end

M = m.'; %Take transpose to find the left eigenvector of M

%find exact eigenvalues of M
e = eig(M);


%create random initial vector
x = randn(n,1);

TOL = 10^(-5); %Set tolerance
MAX = 1000;

%Implement power1 method
[e1,x1,k1] = power1(M,x,TOL,MAX);

%Implement power2 method
[e2,x2,k2] = power2(M,x,TOL,MAX);

%Implement invpower method
[ei,xi,ki] = invpower(M,x,TOL,MAX);

sum(x1) 
sum(x2)
sum(xi)






    
    



