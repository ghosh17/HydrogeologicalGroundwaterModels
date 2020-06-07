%Calculate Hantush-Jacob well function (leaky artesian)
%Inputs:
% r = distance from pumping well
% T = transmissivity of confined aquifer
% S = storativity of confined aquifer
% Kc = hydraulic conductivity of confining layer
% bc = thickness of confining layer
% t = time
%
% Output:
% h = W(u,r/B) = values of leaky confined aquifer well-function
function h = leak_well_function(r,T,S,Kc,bc,t)
    rho= r/sqrt(T*bc/Kc);
    tau = log(2/rho*t/(bc/Kc*S));
    tau = tau(:);
    tau(find(tau>100)) = 100;
    h_inf = besselk(0,rho);
    expintrho = expint(rho);
    w = (expintrho-h_inf)/(expintrho-expint(rho/2));
    I=h_inf - w*expint(rho/2*exp(abs(tau))) + ...
    (w-1)*expint(rho*cosh(tau));
    h=h_inf+sign(tau).*I;
end