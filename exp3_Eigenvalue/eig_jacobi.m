%%%%%%%%%%%%%%%%%%%%%%%%
%% Jacobi passing method
%%%%%%%%%%%%%%%%%%%%%%%%
function [lambda,times] = eig_jacobi(A,e)
[~,n]=size(A);
Frob=sqrt(norm(A,"fro"));
delta=sqrt(Frob)/n;
times=0;
while true
    for i=1:n
        for j=1:n
            if i~=j && abs(A(i,j))>delta
                % Givens
                J=eye(n);
                if A(i,i)==A(j,j)
                    theta=pi/4;
                else
                    theta=0.5*atan(2*A(i,j)/(A(i,i)-A(j,j)));
                end
                c=cos(theta);
                s=sin(theta);
                J(i,i)=c;
                J(j,j)=c;
                J(i,j)=s;
                J(j,i)=-s;
                A=J*A/J;
                times=times+1;
            end
        end
    end
    if delta<e
        break;
    end
    delta=delta/n;
end
lambda=diag(A);
end
