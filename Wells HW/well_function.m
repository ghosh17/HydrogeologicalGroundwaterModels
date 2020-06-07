function W = well_function(u)
W=-0.5772-log(u)+u;
for i=2:1:100
    if mod(i,2)==0
       W=W-u^i/(i*factorial(i));
    else
         W=W+u^i/(i*factorial(i));
    end
end
