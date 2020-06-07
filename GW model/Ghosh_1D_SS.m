%% This is a 1D Steady State Ground Water Model.
%Author: Adit Ghosh
%Hydrogeology
%Spring 2020, CSUN
%%
clear all;
clf;
close all;
%%

%Define Variables
Lx = 100;
dx = 0.5;
n = Lx/dx;

%Define Matrixes
A = zeros(n,n);

h = zeros(n,1);
b = zeros(n,1);

%Boundary conditions
b(1) = 10;
b(n) = 5;

%Define diagonal elements
v1 = zeros(n-1,1);
v2 = zeros(n,1);
v3 = zeros(n-1,1);
for i=1:n
    
    v2(i) = (-2)/(dx^2);
    if i <= n-1
        v1(i) = 1/(dx^2);
        v3(i) = 1/(dx^2);
    end
end

%Create 2D matrix with v1,v2,v3 as diagonal elements

A = diag(v1,-1) + diag(v2,0) + diag(v3,1);

A(1,:) = zeros(1,n);
A(n,:) = zeros(1,n);
A(1,1) = 1;
A(n,n) = 1;
%Solve for x in Ax = b; using matlab built in linear algebra function
h = A\b;



%defining Xaxis
xaxis = zeros(n,1);
%xaxis(1)=0.5;
%for j = 2:n
%    xaxis(j) = xaxis(j-1) + dx;
%end
    
xaxis = 0.5:0.5:100
%Contour data
plot(xaxis,h)
%plot (xaxis, h,'r');
xlabel('Horizontal distance (m)');
ylabel('Head (m)');
legend('1D Steady State Drawdown');




%%EOF




