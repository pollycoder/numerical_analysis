%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Cholesky factorization 
%   --- Optimized Square Method
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [x]=cholesky_optsq(A,b)
tic
% Check the size of A and b
[m, n]=size(A);
if m~=length(b)
    error('ERROR: The size of A and b is not compatible.');
end
L=zeros(n);
x=zeros(size(b));
d(1)=A(1,1);
t(1,1)=A(1,1);
for i=2:n
    for j=1:i-1
        sum=0;
        for k=1:j-1
            sum=sum+t(i,k)*L(j,k);
        end
        t(i,j)=A(i,j)-sum;
        L(i,j)=t(i,j)/d(j);
    end
    sum=0;
    for k=1:i-1
        sum=sum+t(i,k)*L(i,k);
    end
    d(i)=A(i,i)-sum;
end
for i=1:n
    sum=0;
    for k=1:i-1
        sum=sum+L(i,k)*y(k);
    end
    y(i)=b(i)-sum;
end
for i=n:-1:1
    sum=0;
    for k=i+1:n
        sum=sum+L(k,i)*x(k);
    end
    x(i)=y(i)/d(i)-sum;
end
time=toc;
fprintf("Time for optimized chol-sq method=%f", time);
end
