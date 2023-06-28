%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% SOR Iteration
%   Only consistency ordered matrix 
%   with all-real eigenvalues can 
%   get the optimum relaxation parameter.
%%%%%%%%%%%%%%%%%%%%%%%%%%%
function x = SOR(A, b, e)
[~,m]=size(A);
if nargin<3
    e=1e-6;
end
if m~=length(b)
    error('ERROR: The size of A and b is not compatible.');
end
x=zeros(size(b));
tmp=ones(size(b));

% LDU Factorization
D=diag(diag(A));
L=-tril(A,-1);
U=-triu(A,1);
Bj=D\(L+U);

% Optimum relexation parameter
lambda=max(abs(eig(Bj)));
omega=2/(1+sqrt(1-lambda^2));

% Get matrix B-SOR
B=(D-omega*L)\((1-omega)*D+omega*U);
fsor=omega*(D-omega*L)\b;

while true
    x=B*tmp+fsor;
    res=norm(x-tmp,2);
    if res<e
        return;
    else
        tmp=x;
    end
end
end