%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% GMRES METHOD
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [ x,j,res,resvec,step] = GMRES( A, b, x0, tol, max_it )
if nargin < 5
    max_it=1000;
end
if nargin < 4
    tol = 1.e-10;
end
if nargin < 3
    x0 = zeros(length(b),1);
end
r0 = A*x0 - b;
beta = norm(r0);
V(:,1) = r0/beta;
resvec = beta;
Q = cast(1,'like',b);

j = 0;
while ((abs(resvec(j + 1)) > tol) && (j < max_it))
    % Arnoldi
    j = j + 1;
    w = A*V(:,j);
    for i = 1:j
        H(i,j) = w'*V(:,i);
        w = w - H(i,j)*V(:,i);
    end
    H((j + 1),j) = norm(w,2);
    V(:,(j + 1)) = w/H((j + 1),j);
    
    % Solve the least square problem
    % QR factorization, construct R
    H(1:j,j) = Q*H(1:j,j);
    rho = H(j,j);
    H(j,j) = sqrt(rho^2 + H((j +1),j)^2);
    c = rho/H(j,j);
    s = H((j + 1),j)/H(j,j);
    H((j + 1),j) = 0;
    
    % Apply Givens rotation to Q
    Q((j + 1),:) = -s*Q(j,:);
    Q(j,:) = c*Q(j,:);
    Q((j + 1),(j + 1)) = c;
    Q(j,(j + 1)) = s;
    
    % Apply Givens rotation to residual vector
    resvec(j + 1,1) = -s*resvec(j,1);
    resvec(j,1) = c*resvec(j,1);
end
y = H((1:j),:)\resvec(1:j);
x = x0 - V(:,(1:j))*y;
res = abs(resvec(j + 1));
resvec = abs(resvec);
step=j;
end