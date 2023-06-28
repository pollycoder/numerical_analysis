%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Thomas Method
%   Suitable for tridiagonal matrix
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function X = thomas(A, b)
% A's size
n = size(A, 1);

% LDU factorization
L = zeros(n, 1);  
U = zeros(n, 1);  

% Diagonal matrix
D = diag(A);
L(2:n) = diag(A, -1);
U(1:n-1) = diag(A, 1);

% Initialize
X = zeros(n, 1);

% Forward elimination
for k = 2:n
    factor = L(k) / D(k-1);
    D(k) = D(k) - factor * U(k-1);
    b(k) = b(k) - factor * b(k-1);
end

% Backward substitution
X(n) = b(n) / D(n);
for k = n-1:-1:1
    X(k) = (b(k) - U(k) * X(k+1)) / D(k);
end
end
