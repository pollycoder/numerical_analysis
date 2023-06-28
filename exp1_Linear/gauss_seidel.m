%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Gauss-Seidel Iteration
%%%%%%%%%%%%%%%%%%%%%%%%%%%
function x = gauss_seidel(A, b, e)
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
fgs=(D-L)\b;
B=(D-L)\U;

while true
    x=B*tmp+fgs;
    res=norm(x-tmp,2);
    if res<e
        return;
    else
        tmp=x;
    end
end
end