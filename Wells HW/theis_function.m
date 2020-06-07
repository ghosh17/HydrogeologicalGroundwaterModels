%%Thiess function
function [T,S] = theis_function(T_ini,S_ini,r,Q,t,s)
    %s = Q * W(u) / 4*pi*T
    %T = Q * W(u) / 4*pi*s
    %T = r^2*S/4ut  or  S = 4uTt/r^2
    %f(1) = T
    %f(2) = S
    %W(u) = -0.5772-ln(u)+u-u^2/2.2!
    %u = r^2*S/4Tt
    
    theis_f = @(f,t) Q ./ (4 .* pi() .* f(1)) .* (-0.5772 - log((r.^2).*f(2)./(4.*f(1).*t)) + ((r.^2).*f(2)./(4.*f(1).*t)) - ((((r.^2).*f(2)./(4.*f(1).*t)).^2)./(2.*2.*1)));
    ini = [T_ini S_ini];
    [all_calc] = nlinfit(t,s,theis_f,ini);
    calc = real(all_calc);
    T = calc(:,1);
    S = calc(:,2);
    figure(3)
        loglog(t,s,'o');
        hold on;
        loglog(t, theis_f(calc,t), 'b-');
        grid on;
        xlabel('time(min)');
        ylabel('drawdown');
        legend('data','best-fit');
        hold off;
    
    
   
    
end