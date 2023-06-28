%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Gauss elimination method
%%%%%%%%%%%%%%%%%%%%%%%%%%%
function x = gauss(A, b)
[m, n]=size(A);
if m~=length(b)
    error('ERROR: The size of A and b is not compatible.');
end
% Augmented matrix
Ab = [A, b];

% Gauss elimination
for k = 1:min(m, n)
    % Pivot in a column
    [~, pivot_row] = max(abs(Ab(k:end, k)));  

    % Swap the two columns
    pivot_row = pivot_row + k - 1;
    Ab([k, pivot_row], :) = Ab([pivot_row, k], :);  
        
    % Elimination
    for i = k+1:m
        factor = Ab(i, k) / Ab(k, k);
        Ab(i, k:end) = Ab(i, k:end) - factor * Ab(k, k:end);
    end
end

% Backward substitution
x = zeros(n, 1);
for i = min(m, n):-1:1
    x(i) = (Ab(i, end) - Ab(i, i+1:end-1) * x(i+1:end)) / Ab(i, i);
end
end
