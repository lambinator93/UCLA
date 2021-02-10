%Erik Lamb
%Homework 2
%Problem 3 

%Function that performs 3-digit chop machine addition
%INPUTS: any number of the form (1/i)^3 for i >= 1.
%OUTPUTS: the 3-digit chopping machine sum of the two inputs
function [flsum] = three_digit_chop(x,y) 
    
    %Converts x to a 3-digit chopping floating number
    if(x < 1)
        flx = fix(x*1000)/1000; 
    end
    if(x >= 1)
        flx = fix(x*100)/100;
    end
    
    %Converts y to a 3-digit chopping floating number
    if(y < 1)
        fly = fix(y*1000)/1000;
    end
    if(y >= 1)
        fly = fix(y*100)/100;
    end
    
    %Computes the sum of float(x) and float(y)
    sum = flx + fly;
    
    %Converts the sum the a 3-digit chopping floating number. Sets return
    %value flsum
    if(sum < 1)
        flsum = fix(sum*1000)/1000;
    end
    if(sum >= 1)
        flsum = fix(sum*100)/100;
    end   
        
    
    
    
    
    