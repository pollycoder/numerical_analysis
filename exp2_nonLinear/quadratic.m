%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Quadratic Method
% Acknowledgement: 
%   https://blog.csdn.net/weixin_44384477/article/details/105161363
%%%%%%%%%%%%%%%%%%%%%%%%%%
function [root, iter] = quadratic(f, x0, x1, x2, tol, max_iter)
ifconv=false;
if nargin<6
    max_iter=100;
end
if nargin<5
    tol=1E-10;
end
iter = 0;
e=abs(f(x2));
while e > tol && iter < max_iter
    h1=x1-x0;
    h2=x2-x1;
    d1=(feval(f,x1)-feval(f,x0))/h1;
    d2=(feval(f,x2)-feval(f,x1))/h2;
    a=(d1-d2)/(h2+h1);
    b=d2+h2*a;
    c=feval(f,x2);
    t=x2-(2*c*sign(b))/(abs(b)+sqrt(b^2-4*a*c));
    s=feval(f,t);

    iter = iter + 1;
    e=abs(s);
    if e<tol
        ifconv=true;
        break;
    end
    x0=x1;
    x1=x2;
    x2=t;
end
if ifconv
    fprintf("Converged! Iteration: %d\n",iter);
else
    fprintf("Not converged !\n");
end
root=x2;
end
