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

A = zeros(n,n);
h = zeros(n,1);
b = zeros(n,1);
H = zeros(n,m);%matrix to store full h matrix, temporal and spatial
b(1,:) = 8;
v2 = ones(n,1) * (1 + (2*T*dt/(S*(dx^2))));
v1 = ones(n-1,1) * (T*dt/(S*(dx^2)));
v3 = ones(n-1,1) * (T*dt/(S*(dx^2)));

H(:,1) = 8;%initial time
H(1,:) = 10;%one end
H(n,:) = 5;%other end

A = diag(v1,-1) + diag(v2,0) + diag(v3,1);

j=2;

b = H(:,1);
while j<= m
    h = A\b;
    H(:,j) = h;
    b = h;
    j=j+1;
end

mesh(H);
xlabel('Time')
ylabel('Location')
zlabel('Head')
%EOF

