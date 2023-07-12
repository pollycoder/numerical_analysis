%%%%%%%%%%%%%%%%%%%%%%%%%
%% Explicit Euler method
%%%%%%%%%%%%%%%%%%%%%%%%%
function [t, y] = ode_euler_exp(odefun, tspan, y0, N)
    t0 = tspan(1);
    tf = tspan(2);
    h = (tf - t0) / N;
    m = length(y0);
    t = linspace(t0, tf, N+1)';
    y = zeros(N+1, m);
    y(1, :) = y0;
    for i = 1:N
        y(i+1, :) = y(i, :) + h * odefun(t(i), y(i, :))';
    end
end
