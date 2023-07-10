%%%%%%%%%%%%%%%%%%%%%%%%%
%% Hermite interpolation
%%%%%%%%%%%%%%%%%%%%%%%%%
function [interp_values] = hermite_interp(x, y, dy, interp_points)
m = length(interp_points);
interp_values = zeros(1, m);
for k = 1:m
    xi = interp_points(k);
    for i = 1:length(x)-1
        if x(i) <= xi && xi <= x(i+1)
            break;
        end
    end
    h = x(i+1) - x(i);
    t = (xi - x(i)) / h;
    h00 = (1 + 2*t) * (1 - t)^2;
    h10 = t * (1 - t)^2;
    h01 = t^2 * (3 - 2*t);
    h11 = t^2 * (t - 1);
    interp_values(k) = h00*y(i) + h10*h*dy(i) + h01*y(i+1) + h11*h*dy(i+1);
end
end
