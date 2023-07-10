%%%%%%%%%%%%%%%%%%%%%%%%%
%% QR Factorization method
%%%%%%%%%%%%%%%%%%%%%%%%%
function [lambda,times]=eig_qr(A,e)
[~,n]=size(A);
times=0;
while true
    flag=true;
    times=times+1;
    [Q,R]=qr(A);
    A=R*Q;
    for i=1:n
        for j=1:n
            if i~=j && abs(A(i,j))>e
                flag=false;
            end
        end
    end
    if flag
        break;
    end
end
lambda=diag(A);
end
