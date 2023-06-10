%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Gauss elimination method
% Equation: AX=b
% A: initial matrix
% b: initial vector
% n: scale of the matrix
%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [x]=gauss(A,b,n)
    [Ax,bx]=gaussElimination(A,b,n);
    [X]=gaussBack(Ax,bx,n);
    x=X;
end

% Elimination
function [Ax,bx]=gaussElimination(A,b,n)
    for k=1:(n-1)                  
        if(A(k,k)~=0)
            for i=(k+1):n
                c=(-1*A(i,k))/A(k,k);
                for j=1:n
                    A(i,j)=A(i,j)+c*A(k,j);
                end
                b(i)=b(i)+c*b(k);
            end
        else
            disp("Error! There is a zero on the diagnal line!");
            return;
        end
    end
    Ax=A;bx=b;
end

% Returning
function [x]=gaussBack(A,b,n)
    for i=n:-1:1
        if(A(i,i)~=0)
            x(i)=b(i);
            for j=n:-1:i+1
                x(i)=x(i)-A(i,j)*x(j);
            end
            x(i)=x(i)/A(i,i);
        else
            disp("Error! There is a zero on the diagnal line!");
            return;
        end
    end  
    x=x';
end



