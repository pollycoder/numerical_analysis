



function [coeffs] = least_square(x, y, n)
    % 构建Vandermonde矩阵
    A = zeros(length(x), n+1);
    for i = 1:n+1
        A(:, i) = x.^(n+1-i);
    end
    % 计算最小二乘解
    coeffs = A\y;
end
