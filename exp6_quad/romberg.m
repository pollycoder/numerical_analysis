%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Romberg Integration
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function result=romberg(f,a,b,n,e)
if nargin==4
    e=1e-5;
elseif nargin==3
    e=1e-5;
    n=10;
end
h=b-a;
R(1,1)=h/2*(feval(f,a)+feval(f,b));
for i=2:n
    H=0;
    h=h/2;
    % Trapezoidal rule
    for j=1:2^(i-2)
        x=a+h*(2*j-1);
        H=H+feval(f,x);
    end
    R(i,1)=1/2*R(i-1,1)+h*H;

    % Richardson
    for j=2:i
        R(i,j)=(4^(j-1)*R(i,j-1)-R(i-1,j-1))/(4^(j-1)-1);
    end
    err=R(i,i)-R(i,i-1);
    if abs(err)<e
        result=R(i,i);
        return;
    end
end
result=R(n,n);
fprintf("Warning: Not converged !\n");
end
