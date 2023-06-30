%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Secant Method
%%%%%%%%%%%%%%%%%%%%%%%%%%
function [x,steps]=secant(obj_fun,x0,x1,tol,max_iter)
ifconv=false;
if nargin<5
    max_iter=100;
end
if nargin<4
    tol=1E-10;
end
steps=0;
sol=feval(obj_fun,x0);
e=abs(sol);
while e>tol && steps<max_iter
    steps=steps+1;
    x2=x1-obj_fun(x1)*(x1-x0)/(obj_fun(x1)-obj_fun(x0));
    x0 = x1;
    x1 = x2;
    sol=feval(obj_fun,x1);
    e=abs(sol);
    if e<tol
        ifconv=true;
        break;
    end
end
if ifconv
    fprintf("Converged! Iteration: %d\n",steps);
else
    fprintf("Not converged !\n");
end
x=x1;
end