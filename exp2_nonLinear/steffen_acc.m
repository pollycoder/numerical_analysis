%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Steffensen acceleration
% Use steffensen to generate a new iteration function
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [x,steps,x_array,e,time]=steffen_acc(obj_fun,iter_fun,x0,tol,max_iter)
ifconv=false;
x_array=[];
if nargin<5
    max_iter=100;
end
if nargin<4
    tol=1E-7;
end
steps=0;
sol=feval(obj_fun,x0);
e=abs(sol);
while e>tol && steps<max_iter
    steps=steps+1;
    x0=steffensen(iter_fun,x0);
    sol=feval(obj_fun,x0);
    e=abs(sol);
    x_array(end+1)=x0;
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

% Steffensen: process the function
function x=steffensen(iter_fun,x0)
x=x0-(iter_fun(x0)-x0).^2./(iter_fun(iter_fun(x0))-2.*iter_fun(x0)+x0);
end