%% Malibu creek stream and sediment dynamics
%% Author: Adit Ghosh


g = 9.8;%m/s^2; Accelaration due to gravity
H = 30;%m; Height of dam

%As measured over first guage
l = 15.6;%length
w = 0.15;%depth of flow
Area = l * w; %m^2; Area of flow as observed on Rindge dam.

v_max = sqrt(2*g*H); %Velocity of water at the base of dam.

%Average velocity of water.

v_avg = (v_max + 0) / 2; % arithmatic between top of flow over dam (0m/s) and bottom base of dam (v)


Q = v_avg * Area; % Discharge in m^3/s.

K =  0.0864;%???

Sediment_Flux = (1.25*(10^(-4))) * (Q^4) * K;


