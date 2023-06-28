%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Cholesky factorization
%   ---Square Method
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [x]=cholesky_sq(A,b)
tic
% Check the size of A and b
[m, n] = size(A);
if m ~= length(b)
    error('ERROR: The size of A and b is not compatible.');
end
L=zeros(n);
for j=1:n
    % Diagonic elements
    sum_diag=0;
    for k=1:j-1
        sum_diag=sum_diag+L(j,k).^2;
    end
    L(j,j)=sqrt(A(j,j)-sum_diag);
        
    % Other elements
    for i=j+1:n
        sum_other=0;
        for k=1:j-1
            sum_other=sum_other+L(i,k).*L(j,k);
        end
        L(i,j)=(A(i,j)-sum_other)./L(j,j);
    end
end
x=L'\(L\b);
time=toc;
fprintf("Time for chol-sq method=%f", time);
end
