%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Conjugate Gradient Methods
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [x,steps]=cg(A,b,eps)
[m,n]=size(A);
x0=zeros([n,1]);
r0=b-A*x0;
p0=r0;
if nargin == 3
    eps=1.0e-6;
end
steps=0;
while 1
    alpha=(r0'*p0)./((A*p0)'*p0);
    if norm(alpha*p0)<eps
        break;
    end
    steps=steps+1;
    x1=x0+alpha*p0;
    r1=b-A*x1;
    beta=-(r1'*(A*p0))./((A*p0)'*p0);
    p1=r1+beta*p0;
    r0=r1;
    p0=p1;
    x0=x1;    
end
x=x0;
end