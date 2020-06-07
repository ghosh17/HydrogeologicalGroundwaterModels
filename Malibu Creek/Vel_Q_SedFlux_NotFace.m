%% Malibu creek stream and sediment dynamics
%% Author: Adit Ghosh


%As measured over first guage
l = 15.6;%length
w = 1;%depth of flow
Area = l * w; %m^2; Area of flow as observed on Rindge dam.


%Average velocity of water.

v_avg = 2;

Q = v_avg * Area; % Discharge in m^3/s.

K = 0.0864;

Sediment_Flux = (1.25*(10^(-4))) * (Q^4) * SedFlux_Constant;


