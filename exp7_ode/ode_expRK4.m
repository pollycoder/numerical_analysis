%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% ODE solver - Explicit Runge-Kutta in 4 orders
%   The input can be referred from ode45.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [T1, Y1] = ode_expRK4(odefun, tspan, y0)
t0 = tspan(1);              
tfinal = tspan(end);        
hmax = 1e-3 * (tfinal - t0); 
T = t0;
Y = y0.';
t = t0;        
y = y0.';      
h = hmax;       

while t < tfinal
    if t + h > tfinal
        h = tfinal - t;
    end
    k1 = h * feval(odefun, t, y);
    k2 = h * feval(odefun, t + h/2, y + k1/2);
    k3 = h * feval(odefun, t + h/2, y + k2/2);
    k4 = h * feval(odefun, t + h, y + k3);

    ynew = y + (k1 + 2*k2 + 2*k3 + k4)/6;
    tnew = t + h;    
    t = tnew;
    y = ynew;
    
    T = [T, t];
    Y = [Y, y];
end
T1=T;
Y1=Y;
end

