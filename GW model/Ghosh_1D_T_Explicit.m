%% This is a 1D Fully Explicit Transient Ground Water Model.
%Author: Adit Ghosh
%Hydrogeology
%Spring 2020, CSUN
%%
clear all;
clf;
close all;
%%
%Defining variables
S = 1*10^(-4);
T = 7*10^(-3);
dt = 0.01;
dx = 5;
Lx = 100;
tend = 20;
n = Lx/dx;
m = tend/dt;

%h matrix in space and time
h = zeros(n+2,m);

%Temporal and spatial initial condition
h(:,1) = ones(n+2,1)*8;
h(1,:) = 10;
h(n+2,:) = 5;

%
j = 2;

%Temporal and spatial loop
while j <= m 
    for i=2:n+1
        h(i, j) = (T*(dt)/(S*(dx^2))) * (h(i+1,j-1)-2*h(i,j-1)+h(i-1,j-1)) + h(i,j-1);
    end
    j = j + 1;   
end


mesh(h);
xlabel('Time')
ylabel('Location')
zlabel('Head')
colorbar;

%EOF
