

function [output] = geomser(r,n)

% This function calcuates the sum of geometric progression (GP) for a value r, n times where a=1.

sum = 1; 
for m=1:n
    
    sum = sum + r^m;
end
output = sum;

end
