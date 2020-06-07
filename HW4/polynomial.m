

function [output] = polynomial(a,b,c)

%This function calcuates the solution to a polynomial equation of the form:
%a*LN(x)+b*x^2+c/x
%for values of x between 10 and 100 in increments of 10. 

x = [10:10:100]

y = a .* log(x) + b * (x.^2) + (c./x);

%Plot points
figure(1);

%Fitting graph
fun = 'a*log(x)+b*(x^2)+(c/x)';
f = fit(x(:),y(:),fun);

plot (f, x, y, 'o');
xlabel('input x value');
ylabel('polynomial y value');
title('Best fit curve');

%Return value
output = y;



end