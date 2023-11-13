%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Newton iteration
%%%%%%%%%%%%%%%%%%%%%%%%%%
function [x,steps]=newton(obj_fun,x0,tol,max_iter)
ifconv=false;
if nargin<4
    max_iter=100;
end
if nargin<3
    tol=1E-7;
end
steps=0;
sol=feval(obj_fun,x0);
e=abs(sol);
syms x
y=obj_fun(x);
if e<tol
    ifconv=true;
end
while e>tol && steps<max_iter
    steps=steps+1;
    x0=double(x0-subs(y,x,x0)./subs(diff(y),x,x0));
    sol=feval(obj_fun,x0);
    e=abs(sol);
    if e<tol
        ifconv=true;
        break;
    end
end
if ~ifconv
    fprintf("Not converged !\n");
end
x=x0;
end