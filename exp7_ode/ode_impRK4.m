%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% ODE solver - Explicit Runge-Kutta in 4 orders
%   The input can be referred from ode45.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [T1, Y1] = ode_impRK4(odefun, tspan, y0)
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
    g = @(z) z - y - h/2 * (feval(odefun, t + h, z) + feval(odefun, t, y));
    dg = @(z) eye(size(y, 1)) - h/2 * feval(odefun, t + h, z);
    z0 = y;
    z = newton_raphson(g, dg, z0);
    ynew = z;
    tnew = t + h;
    t = tnew;
    y = ynew;    
    T = [T, t];
    Y = [Y, y];
end
T1=T;
Y1=Y;
end

% Newton-Raphson
function z = newton_raphson(g, dg, z0)
max_iter = 100;  
tol = 1e-6;      
z = z0;
for iter = 1:max_iter
    delta_z = - dg(z) \ g(z);
    z = z + delta_z;
    if norm(delta_z) < tol
        break;
    end
end
end
