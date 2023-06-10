%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Best square approximation
%  Parameters:
%   n: order
%   func: object function
%   int_min,int_max: range for integration
%   w_func: weight function
%  Output:
%   a: coefficient
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function a=sqr_approx(n,func)
% Get the Legendre polynomial
syms x;
f=zeros([n+1,1]);
Pn=[1,x,x.^2,x.^3,x.^4,x.^5];
G=zeros(n+1);
for i=1:n+1    
    for j=1:n+1
        foo1=Pn(i)*Pn(j);
        G(i,j)=int(foo1,x,-1,1);
    end
    foo2=@(x)Pn(i)*func(x);
    f(i,1)=int(foo2,x,-1,1);
end
a=gmres(G,f);
end