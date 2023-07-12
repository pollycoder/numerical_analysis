%%%%%%%%%%%%%%%%%%%%%%%%%
%% Improved Euler method
%%%%%%%%%%%%%%%%%%%%%%%%%
function [t, y] = ode_euler_improve(odefun, tspan, y0, N)
    t0 = tspan(1);
    tf = tspan(2);
    h = (tf - t0) / N;
    m = length(y0);
    t = linspace(t0, tf, N+1)';
    y = zeros(N+1, m);
    y(1, :) = y0;

    for i = 1:N
        t_current = t(i);
        y_current = y(i, :)';

        % Prediction
        y_pred = y_current + h * odefun(t_current, y_current);

        % Correction
        y_next = newtonSolver(@(y) y - y_current - h * odefun(t_current+h, y), y_pred);
        y(i+1, :) = y_next';
    end
end

function x = newtonSolver(f, x0)
    MAX_ITER = 100; 
    TOL = 1e-6; 

    x = x0;
    for iter = 1:MAX_ITER
        fval = f(x);
        J = jacobian(f, x);
        delta_x = -J \ fval;
        x = x + delta_x;

        if norm(delta_x) < TOL
            break;
        end
    end
end

function J = jacobian(f, x)
    h = 1e-6; 

    m = length(f(x));
    n = length(x);
    J = zeros(m, n);

    for j = 1:n
        x_plus_h = x;
        x_plus_h(j) = x_plus_h(j) + h;

        J(:, j) = (f(x_plus_h) - f(x)) / h;
    end
end
