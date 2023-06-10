%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Newton iteration
%%%%%%%%%%%%%%%%%%%%%%%%%%
function [x,steps,x_array,e,time]=newton(obj_fun,x0,tol,max_iter)
time=tic;
ifconv=false;
x_array=[];
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
while e>tol && steps<max_iter
    steps=steps+1;
    x0=double(x0-subs(y,x,x0)./subs(diff(y),x,x0));
    sol=feval(obj_fun,x0);
    e=abs(sol);
    fprintf("%d\n",x0);
    if e<tol
        ifconv=true;
        break;
    end
end
time=toc(time);
if ifconv
    fprintf("Converged! Iteration: %d\n",steps);
else
    fprintf("Not converged !\n");
end
x=x0;
end