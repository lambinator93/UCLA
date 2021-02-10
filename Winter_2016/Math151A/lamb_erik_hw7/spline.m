%Erik Lamb
%Homework 7

%The function spline finds the coefficients of a natural cubic spline
%INPUTS: Vector x of all interpolating nodes x_i, vector y of all function
%values f(x_i)
%OUTPUTS: Matrix S containg all coefficiencts of the spline interpolating
%functions
function S = spline(x,y)
    h = x(2:end) - x(1:end-1); %Constructs a vector of h_j = x_{j+1} -x_j values
    da = y(2:end) - y(1:end-1); %Constructs a vector of all da_n= a_{n+1} - a_n values
   
    A1 = vertcat(1, 2*(h(1:end-1)+ h(2:end)), 1);
    A2 = vertcat(h(1:end-1), 0);
    A3 = vertcat(0 , h(2:end));
    %Creates a tridiagonal matrix A used in solving the linear equation Ax=b
    A = diag(A1, 0) + diag(A2,-1) + diag(A3, 1);
    
    %Creates b vector of solutions to the system of linear equations
    B = vertcat(0, ((3./h(2:end)).*da(2:end) - (3./h(1:end-1)).*da(1:end-1)), 0); 
    
    %Solves the system of linear equations. Finds c coefficients
    C = A\B;
    
    %Uses equation 3.20 page 145 to find b coefficients
    b = (1./h(1:end)).*da(1:end) - (h(1:end)./3).*(2.*C(1:end-1)+C(2:end));
   
    
    %Uses equation 3.17 page 145 to find d coefficients
    d = (1./(3.*h(1:end))).*(C(2:end) - C(1:end-1));
    
    %Reduce index by one so all are the same size
    a = y(1:end-1);
    c = C(1:end-1);
    %Set output matrix. Each column is a vector of coefficients for the
    %spline interpolating functions
    S = horzcat(a, b, c, d);
    
    return