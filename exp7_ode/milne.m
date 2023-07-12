%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Milne Method
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [T, Y] = milne(odefun, tspan, y0)
    % Initialize variables
    t0 = tspan(1);
    tf = tspan(end);
    t = t0;
    y = y0(:);
    h = 1e-3;
    T = t;
    Y = y.';
    
    % Function to compute the derivative at a given point
    function dy = derivate(t, y)
        dy = odefun(t, y);
    end
    
    % Run Milne's method
    while t < tf
        y0 = y;
        
        % Predictor step
        y = y0 + (4/3)*h*derivate(t, y0);
        t = t + h;
        
        % Corrector step
        y = y0 + (h/3)*(derivate(t, y0) + 4*derivate(t - h, y0 - (h/3)*derivate(t, y) + (h/3)*derivate(t - h, y0)));
        
        % Update solution
        T = [T; t];
        Y = [Y; y.'];
        
        % Check for integration end
        if t >= tf
            return;
        end
    end
end
