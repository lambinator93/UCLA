%Erik Lamb
%Homework 7

%Function pval evaluateS the interpolation Lagrangian polynomial given the
%coefficients, interpolation points, and test points at which the
%Lagrangian is to be evaluauted
%INPUTS: Coefficients of Lagrangian in vector P, interpolation points in
%vector ip, and test points in vector tp
%OUTPUTS: Vector pval which contains the values of the Lagrangian for given
%P and ip vectors at each element in tp

function pval = evalP(P, ip, tp)
   %Initialize two vectors used in computing the Lagrangian
   %diff = zeros(length(ip)); %Stores (x-x_i) for each element in ip and tp
   prod = zeros(length(P), 1); %Stores each (x-x_i)(x-x_i+1)...
   
   %Initialize pval. Must store a value for the Lagrangian at each tp
   pval = zeros(length(tp),1); 
   
   %Loops until the Lagrangian for each tp is computed
   for i = 1:length(tp)
       diff = tp(i)-ip(:); %Calculate difference between current tp and each ip
      
       prod(1) = 1; %Set first element to 1 for multiplication with F_00 (P(1)) term later
       
       %Calculates and stores the (x-x_i)(x-x_i+1)... terms
       for j = 2:1:length(P)
        prod(j) = prod(j-1)*diff(j-1);
       end
       
       %Calculates and stores the F_ii(x-x_i)(x-x_i+1)... terms using
       %element by element multiplication in the vector lag
       lag = dot(P,prod);
       
       %Finally, set the value of pval as the sum of all terms of the
       %Lagrangian polynomial, vector lag, for the current tp
       pval(i) = sum(lag);
       
   end
   
   return 
       
       
           
       
       