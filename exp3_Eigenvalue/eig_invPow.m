function [lambda,times]=eig_invPow(A,n,e)
v0=ones([n,1]);
times=0;
while true
    times=times+1;
    v0=A*v0;
    m0=max(v0);
    v0=v0/m0;
    v0=A*v0;
    m1=max(v0);
    v0=v0/m1;
    if abs(m1-m0)<e
        break;
    end
end
lambda=m1;
end