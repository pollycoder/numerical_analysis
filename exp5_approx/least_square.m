%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Least square method
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [coeffs] = least_square(x, y, n)
    % Gram matrix
    A = zeros(length(x), n+1);
    for i = 1:n+1
        A(:, i) = x.^(n+1-i);
    end
    
    % result
    coeffs = A\y;
end
