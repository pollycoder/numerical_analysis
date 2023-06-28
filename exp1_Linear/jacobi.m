%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Jacobi Iteration
%%%%%%%%%%%%%%%%%%%%%%%%%%%
function x = jacobi(A, b, e)
[~,m]=size(A);
if nargin<3
    e=1e-6;
end
if m~=length(b)
    error('ERROR: The size of A and b is not compatible.');
end
x=zeros(size(b));
tmp=ones(size(b));

D=diag(diag(A));
LU=D-A;
fj=D\b;
B=D\LU;

while true
    x=B*tmp+fj;
    res=norm(x-tmp,2);
    if res<e
        return;
    else
        tmp=x;
    end
end
end