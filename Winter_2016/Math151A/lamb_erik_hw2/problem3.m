%Erik Lamb
%Homework 2
%Problem 3

%See three_digit_chop.m

%Exact Sum
i = 1;
sumex = 0;

while(i <= 10)
    sumex = (1/i)^3 + sumex;
    i = i + 1;   
end

sumex %Exact sum

%Forward 3-digit chopping sum
i = 1;
sumfo = 0;

while(i <= 10)
    sumfo = three_digit_chop((1/i)^3, sumfo);
    i = i + 1;
end

sumfo %Sum from three-digit chopping in the forward order

%Reverse 3-digit chopping sum
i = 10;
sumre = 0;

while(i >= 1)
    sumre = three_digit_chop((1/i)^3, sumre);
    i = i - 1;
end

sumre %Sum from three-digit chopping in the reverse order

%Compute Absolute and Relative Error of Forward Sum
af = abs(sumex - sumfo); %absolute
rf = af/sumex %relative

%Compute Absolute and Relative Error of Reverse Sum
ar = abs(sumex - sumre); %absolute 
rr = ar/sumex %relative

%From the relative errors, it is clear that summing the terms (1/i)^3 in
%the reverse order, from i=10 to i=1, is more accurate when using 3-digit
%chopping machine arithmetic. This is because when summing in the reverse
%order, the largest terms are added last, meaning less round-off error due
%to chopping is accumulated when adding the larger terms. When summing in
%the forward order, the larger terms are added first, which means
%significant round-off error is accumulated as smaller and smaller terms
%are added.


