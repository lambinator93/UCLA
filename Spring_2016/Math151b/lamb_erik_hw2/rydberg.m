R = 10.977373;


for i = 1:6
    for j = 1:6
        matrix(i,j) = R*(1/i^2 - 1/j^2);
    end
end

(1./matrix)*1000
