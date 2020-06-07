% Matlab Script for Lab 8 - Transport Modeling
% This skeleton script will help you complete the modeling for Lab 8
% This is set up to deal with multiple times simulataneous (i.e. t can be
% a vector). For varying lambda or dispersivity you will need to modify OR
% copy outputs into Excel or another Matlab script.

clear all
close all
clf

%axk = [10];
%f_array = [0.001];
lambda_array = [0,0.001,0.1,1];
 for itr=1:length(lambda_array)
    %% ENTER constant parameters here (these will not change)

    K = 350; % Hydraulic conductivity (ft/d)
    i = 0.008; % Hydraulic gradient (dh/dx)
    ne = 0.3; % Effective porosity
    C0 = 1500; %Concentration of TCE at the source (mg/L)
    rhob = 1.9; %Bulk density (g/mL)
    Koc = 152; %Organic carbon distribution coefficient (mL/g)

    %% ENTER variable parameters here (these will vary depending on the question)

    ax = 10; %axk(itr); % Longitudinal dispersivity (ft)
    k = lambda_array(itr); %0; %Reaction rate constant (lambda)
    foc = 0; %f_array(itr);%0.001; %Fraction of organic carbon - set this to 0 for no sorption case
    t = [73.25]; %Enter time - this may be either a single value or a vector of values


    %% Automatic calculations -- ENTER EQUATIONS HERE

    vx = (K*i)/ne; %GW flow velocity - ENTER equation to calculate GW velocity here
    Kd = Koc*foc; %ENTER equation to calculate Kd from foc and Koc
    Rf = (1 + (rhob/ne)*Kd); %Retardation factor - ENTER equation to calculate 



    %% Initialize variables -- DON'T DO ANYTHING HERE
    x=[0:20:1200]; % Create x vector (0-1200 ft from source, 20ft spacing)
    Cx=zeros(length(x),length(t)); %Concentration as a function of x+t


    %% Main calculation - calculate C(x,t) using Domenico solution - DON'T DO ANYTHING HERE
    for i=1:length(t)
    Cx(:,i)=C0/2*(exp(x./(2*ax).*(1-sqrt(1+(4*k.*ax)./vx)))).*erfc((Rf.*x-vx.*t(i)*sqrt(1+4*k*ax./vx))./(2*sqrt(Rf.*ax.*vx.*t(i))));
    end

    %% Plot Results; YOU MAY WANT TO MODIFY THINGS HERE
    %Plotted as concentration/concentration at source
    hold on;
    figure(1)
    plot(x,Cx/C0);
    xlabel('Distance (x;ft)')
    ylabel('$\frac{C}{C_0}$','Interpreter','latex')
    legend('0','0.01','0.1','1');
    %legend('w/o sorption','sorption'); 

    %Plotted as absolute concentration for determining breakthrough time
    figure(2)
    hold on
    plot(x,Cx); 
    xlabel('Distance (x;ft)')
    ylabel('C (mg/L)')
    legend('0','0.01','0.1','1');
    %legend('w/o sorption','sorption');
    %legend('1','20','100');


    %Plotted as absolute concentration for determining breakthrough time
    figure(3)
    hold on
    plot(x,Cx,[0,1200],[0.005 0.005],':'); % Dashed line = 5ppb = TCE MCL
    axis([998 1002 0 0.01]) %This will zoom in at the well and C= ~5ppb
    xlabel('Distance (x;ft)')
    ylabel('C (mg/L)')
    legend('0','0.01','0.1','1');
    %legend('w/o sorption','sorption');
    %legend('1','20','100');
 end




%%ANSWERS
%1 vx = -9.33 ft/day
%2 Kd =  0.1520
%4 t = 57.25 days
%6 ax = 1 ; t = 87.5 days
%  ax = 20 ; t ~= 46 days
%  ax = 100; t = 18.20 days
%8 t ~= 112 days
%10 t= 73.25 days
%11 With increasing bioremidiation,the plume travels a lesser distance.
%Even as time increases the plume is restricted to it's source, equilibrates; as compared
%to the case where no bioremidiation occurs. 

















