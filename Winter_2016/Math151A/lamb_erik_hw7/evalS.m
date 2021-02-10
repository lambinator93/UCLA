%Erik Lamb
%Homework 7

%evalS evaluates interpolating cubic spline at each test point and returns
%all values in vector sval
%INPUTS: Coefficient matrix of the cubic spline S, vector of all
%interpolationg points ip, and vector tp of all test points at which the cubic
%is evaluated
%OUTPUTS: Vector sval containing the all values at test nodes as predicted
%by cubic spline function
function sval = evalS(S, ip, tp)
   
    sval = zeros(length(tp), 1);
    
    for j = 1:length(tp)
        
        ind = find(ip.' >= tp(j),1);
    %Declare and empty 4xsize(tp) array to calculate the cubic spline at
    %each tp
        cubic = zeros(4,1);
    %All first elements are as they will be multiplied by a_j later
        cubic(1) = 1;
    %Fill vector cubic with the cubic terms 1, (x-x_j), (x-x_j)^2, (x-x_j)^3
    %for the current x which is tp(j). The correct index for ip is finding x_j is the
    %index ind(j), which corresponds to tp(j)
    if isempty(ind) == 0 %Makes sure the index isnt empty
        for i = 2:4
            cubic(i) = cubic(i-1)*(tp(j)-ip(ind));
        end
    end

    %Evaluates the interpolating cubic spline at each tp by multiplying the
    %correct row of S, determined by the index ind, with the vectorcubic, which corresponds with the test point 
    %tp(j). %Stores value is sval for j index
    if isempty(ind)==0
        sval(j) = dot(S(ind,:),cubic(:));
    end
    end
    
    return
    
    
    
    
    
    
    
    
    
    