%%Author: Adit Ghosh
%%Hydrogeology HW


function [q] = darcy(K,dH,L)
    % This function calcuates the discrage of ground water using darcy's
    % law, given parameters for hydraulic constant, height difference and
    % length of tube/flow.
    q = K * dH / L;
end
