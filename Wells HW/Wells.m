%% Wells HW
%Author: Adit Ghosh
%Hydrogeology
%Spring 2020
%%

clear all;
clf;
close all;

%%
%1
Q = 165000; %ft^3/day
t_01 = 30; %day
S = 7*(10^(-4));
T = 5320;%ft^2/day
r_01 = [50,150,250,500,1000,3000,5000,10000];%ft
u = ((r_01.^2)*S)/(4*T*t_01);
s_01 = zeros(1,8);

for i=1:8
    fprintf('\tFor r = %d',r_01(i));
    fprintf('\tu = %d',u(i));
    W = well_function(u(i));
    fprintf('\tW = %d',W);
    s_01(i) = (Q / (4*pi()*T)) * W;
    fprintf('\ts = %d',s_01);
    fprintf('\n');
end





%%
%2
r_02 = 100;
t_02 = [1/(24*60), 2/(24*60), 5/(24*60), 10/(24*60), 15/(24*60), 30/(24*60), 1/24, 2/24, 5/24, 12/24, 1, 5, 10, 20, 30];
u = ((r_02^2)*S)./(4*T*t_02);
s_02 = zeros(1,15);
for i=1:15
    fprintf('\tFor t = %d',t_02(i));
    fprintf('\tu = %d',u(i));
    W = well_function(u(i));
    fprintf('\tW = %d',W);
    s_02(i) = (Q / (4*pi()*T)) * W;
    fprintf('\ts = %d',s_02(i));
    fprintf('\n');
end

%%
%3
bc = 8;%ft
Kc = 0.034;%ft^2/day
r_03 = [50,150,250,500,1000,3000,5000,10000];
t_03 = 30;%days
u = ((r_03.^2)*S)/(4*T*t_03);
%B = sqrt(T*b0/K0);
s_03 = zeros(1,8);
for i=1:8
    fprintf('\tFor r = %d',r_03(i));
    fprintf('\tu = %d',u(i));
    H = leak_well_function(r_03(i),T,S,Kc,bc,t_03);
    fprintf('\tH = %d',H);
    s_03(i) = (Q / (4*pi()*T)) * H;
    fprintf('\ts = %d',s_03(i));
    fprintf('\n');
end


%%
%4
r_04 = 100; %ft
s_04 = zeros(1,15);
t_04 = [1/(24*60),2/(24*60),5/(24*60),10/(24*60),15/(24*60),30/(24*60),1/24,2/24,5/24,12/24,1,5,10,20,30];
u = ((r_04^2)*S)./(4*T*t_04);
for i=1:15
    fprintf('\tFor t = %d',t_04(i));
    fprintf('\tu = %d',u(i));
    H = leak_well_function(r_04,T,S,Kc,bc,t_04(i));
    fprintf('\tW = %d',W);
    s_04(i) = (Q / (4*pi()*T)) * H;
    fprintf('\ts = %d',s_04(i));
    fprintf('\n');
end

%%
%5
 figure(1)
    
    semilogx(r_01,s_01,'r')%.legend('confined');
    hold on
    xlabel('Radius (ft)');
    ylabel('Drawdown ft');
    title('Drawdown v/s radial distance');
    semilogx(r_03,s_03,'b')
    legend('non leaky', 'leaky');
    grid on;
    hold off;
    
    
figure(2)
    
    semilogx(t_02,s_02,'r')%.legend('confined');
    hold on
    xlabel('Time (days)');
    ylabel('Drawdown ft');
    title('Drawdown v/s Time');
    semilogx(t_04,s_04,'b')%.legend('unconfined');
    legend('non leaky', 'leaky');
    grid on;
    hold off;

%%
%6
%A leaky confining layer results in a greater drawdown -> s -> h0-h over a
%given radial distance.
%A leaky confining layer reaches equilibrium much quicker. Reaches 
%equilibrium drawdown quicker
%
  
    
%%
%7
Q = 78000; %ft^3/day
r1 = 125; %ft
b1 = 277; %ft
r2 = 385; %ft
b2 = 291; %ft
%Find K
K = Q  * log(r2/r1) / (pi() * ((b1^2) - (b2^2)));
fprintf('\nThe Hydraulic Conductivity of the unconfined aquifer is: %f', K);


%%
%8
%Attached function 

r = 582;
%b = 15;
Q = 8.154;
t = [1.93,2.98,4.00,5.12,5.95,6.88,8.05,8.88,10.97,12.73,14.73,17.75,35.22,41.41,53.65,59.51,97.06,117.06,193.64,280.46];
s = [0.11,0.14,0.15,0.18,0.20,0.22,0.23,0.24,0.27,0.29,0.31,0.34,0.40,0.42,0.45,0.47,0.53,0.54,0.59,0.64];
T_ini = 500;
S_ini = 0.23;
T,S = theis_function(T_ini, S_ini, r, Q, t, s);

fprintf ('\n\t T=%f',T,'\n\t S=%f',S);



%%EOF



