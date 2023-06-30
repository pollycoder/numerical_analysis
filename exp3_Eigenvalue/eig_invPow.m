function [lambda,times]=eig_invPow(A,lambda0, tol)
[n,~]=size(A);
v0=ones([n,1]);
times=0;
steps=0;
max_iter=100;
ifconv=false;

% Translation technique
if lambda0==inf
    A=A;
elseif lambda0==-inf
    A=inv(A);
else
    A=inv(A-lambda0*eye(n));
end

while steps<max_iter
    times=times+1;
    v0=A*v0;
    m0=max(v0);
    v0=v0/m0;
    v0=A*v0;
    m1=max(v0);
    v0=v0/m1;
    if abs(m1-m0)<tol
        ifconv=true;
        break;
    end
    steps=steps+1;
end
if ~ifconv
    fprintf("Not converged !");
end
if lambda0==inf
    lambda=m1;
elseif lambda0==-inf
    lambda=1/m1;
else
    lambda=1/m1+lambda0;
end