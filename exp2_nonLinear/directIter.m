%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Direct functions
% Caution: Cannot converge
% Vibrate or close to inf, depending on the initial value
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [x,steps,x_array,e,time]=directIter(obj_fun,iter_fun,x0,tol,max_iter)
time=tic;
ifconv=false;
x_array=[];
if nargin<5
    max_iter=25;
end
if nargin<4
    tol=1E-7;
end
steps=0;
sol=feval(obj_fun,x0);
e=abs(sol);
while e>tol && steps<max_iter
    steps=steps+1;
    x0=iter_fun(x0);
    sol=feval(obj_fun,x0);
    e=abs(sol);
    x_array(end+1)=x0;
    if e<tol
        ifconv=true;
        break;
    end
end
time=toc(time);
if ifconv
    fprintf("Converged! Iteration: %d\n",steps);
else
    fprintf("Not converged ! Iteration: %d\n",steps);
end
x=x0;
end
