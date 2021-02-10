%Erik Lamb
%Homework 7

%DivDiff finds the divided differences for calculating the interpolating
%Lagrange Polynomials
%INPUTS: vector x constaing interpolating nodes x_i, vector y containing
%function values f(x_i)
%OUTPUTS: matric Q used to calculate all divided differences whose diagonals are the
%divided differences used to calculate the Lagrange Polynomial. vector P
%containg the diagonal elements of Q

function [P,Q] = divdif(x,y)

    Q = zeros(length(x),length(y)); %Declare an empty matrix Q to store divdiff. Same dimensions as vector lengths, x,y
    
    Q(:,1) = y; %Set the first column of Q equal to y
    
    %Double nested for loop. Calculates all elements of matrix Q using the 
   %divided difference formula from algorithm 3.2
    for i = 2:length(x)
        for j = 2:i
            Q(i,j) = (Q(i,j-1)-Q(i-1,j-1))/(x(i) - x(i-j+1));
        end
    end
    
    %[I,J] = meshgrid(2:length(x),2:length(y));
    %Q(I,J) = (Q(I,J-1)-Q(I-1,J-1))./(x(I) - x(I-J+1));
    
    %Set vector P equal to the diagonal elements of Q
    P = diag(Q)
    
    return 
    
    
    
    
    
