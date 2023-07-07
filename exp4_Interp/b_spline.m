%%%%%%%%%%%%%%%%%%%%%%%%
% B-spline interpolation
%%%%%%%%%%%%%%%%%%%%%%%%
function [interp_values] = b_spline(x, y, interp_points, k)
% x: 已知点的 x 坐标
% y: 已知点的 y 坐标
% interp_points: 需要进行插值的点的 x 坐标
% k: B样条的次数

% 计算参数向量 t
n = length(x);
t = [zeros(1, k), x, ones(1, k)*x(n)];

% 计算节点向量
knots = linspace(min(x), max(x), n+k+1);

% 计算插值结果
m = length(interp_points);
interp_values = zeros(1, m);
for l = 1:m
    xi = interp_points(l);
    interp_values(l) = b_spline_interpolate(xi, x, y, knots, k);
end

end

function [interp_value] = b_spline_interpolate(xi, x, y, knots, k)
% xi: 需要插值的点的 x 坐标
% x: 已知点的 x 坐标
% y: 已知点的 y 坐标
% knots: 节点向量
% k: B样条的次数

n = length(x);
interp_value = 0;

for i = 1:n+k
    basis_value = b_spline_basis(xi, i, knots, k);
    interp_value = interp_value + y(i) * basis_value;
end

end

function [N] = b_spline_basis(xi, i, knots, k)
if k == 0
    if knots(i) <= xi && xi < knots(i+1)
        N = 1;
    else
        N = 0;
    end
else
    denominator1 = knots(i+k) - knots(i);
    if denominator1 ~= 0
        alpha1 = (xi - knots(i)) / denominator1;
        term1 = alpha1 * b_spline_basis(xi, i, knots, k-1);
    else
        term1 = 0;
    end
    
    denominator2 = knots(i+k+1) - knots(i+1);
    if denominator2 ~= 0
        alpha2 = (knots(i+k+1) - xi) / denominator2;
        term2 = alpha2 * b_spline_basis(xi, i+1, knots, k-1);
    else
        term2 = 0;
    end
    
    N = term1 + term2;
end

end
