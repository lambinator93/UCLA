%Erik Lamb
%Homework 7

%findpath is a function that performs either spline or lagrange
%interpolation for the data given in tp and ip
%INPUTS: nx3 Matrix of interpolation points and the function values ip, vectors of test points tp,
%string method that specifies which interpolation method to use, and
%varargin which is used for optional arguments
%OUTPUTS: Matrix path that stores the test points and the approximations
%for each test point made by either interpolating method. Matrix coeffs
%that return the coefficients for either interpolation method
function [path, coeff] = findpath(ip, tp, method, varargin)
    if strcmp('lagrange',method) %If string method is 'lagrange' execute
        
        %Find coefficient vectors using Lagrange for different function
        %values. Use ~ for unwanted Q matrix
        [Cx,~] = divdif(ip(:,1),ip(:,2));
        [Cy,~] = divdif(ip(:,1),ip(:,3));
        
        %Find values at test points for different coefficients
        Px = evalP(Cx, ip(:,1), tp);
        Py = evalP(Cy, ip(:,2), tp);
        
        %Set path and coeff matrices with calculated values
        size(tp)
        size(Px)
        size(Py)
        path = horzcat(tp, Px, Py);
        coeff = horzcat(ip(:,1), Cx, Cy);    
    end
    
    
    if strcmp('spline',method) %If string entered is 'spline' execute
        %Find coefficient vectors using Spline method for different function
        %values
        Sx = spline(ip(:,1),ip(:,2));
        Sy = spline(ip(:,1),ip(:,3));
        
        %Find values at test points for different coefficients
        Px = evalS(Sx, ip(:,1), tp);
        Py = evalS(Sy, ip(:,2), tp);
        
        %Set path and coeff matrices with calculated values
        p = ip(1:end-1,1);
        size(p)
        size(Sx)
        size(Sy)
        path = horzcat(tp, Px, Py);
        coeff = horzcat(p, Sx, Sy);     
    end
    
    return