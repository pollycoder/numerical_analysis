%%%%%%%%%%%%%%%%%%%%%%%%
% Cholesky factorization
% Equation: AX=b
% A: initial matrix
% b: initial vector
% n: scale of the matrix
%%%%%%%%%%%%%%%%%%%%%%%%
function [x]=cholesky(A,b,n)
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
end
