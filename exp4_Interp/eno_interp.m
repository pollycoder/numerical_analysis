%%%%%%%%%%%%%%%%%%%%%%%%%
%% ENO interpolation
%%%%%%%%%%%%%%%%%%%%%%%%%
function result = eno_interp(x, y, xi)
    n = length(x);
    k = min(2, n-1);  % 控制插值阶数，这里选择二阶插值

    % 找到 xi 所在的区间 [x_i, x_{i+1}]
    i = find(x <= xi, 1, 'last');

    % 确保插值点不超出给定数据的范围
    i = max(i, 1);
    i = min(i, n-k);

    % 选择使用的节点
    nodes = x(i:i+k);
    values = y(i:i+k);

    % 计算节点间的差分比率
    ratios = zeros(k+1, k+1);
    ratios(:, 1) = values;

    for j = 2:k+1
        for m = 1:k-j+1
            ratios(m, j) = (ratios(m+1, j-1) - ratios(m, j-1)) / (nodes(m+j) - nodes(m));
        end
    end

    % 计算插值结果
    result = values(1);
    product = 1.0;

    for j = 2:k+1
        product = product * (xi - nodes(j-1));
        result = result + ratios(1, j) * product;
    end
end
