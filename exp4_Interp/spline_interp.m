%%%%%%%%%%%%%%%%%%%%%%%
%% Spline interpolation
%%%%%%%%%%%%%%%%%%%%%%%
function y=spline_interp(x,x0,y0)
y=0;
d=zeros(size(x0))';
h=diff(x0);
mu=zeros(size(h));
lambda=zeros(size(h));
for i=1:length(mu)-1
    mu(i)=h(i)/(h(i)+h(i+1));
    lambda(i+1)=h(i+1)/(h(i)+h(i+1));
end
for i=2:length(d)-1
    f1=(y0(i+1)-y0(i))/(x0(i+1)-x0(i));
    f2=(y0(i)-y0(i-1))/(x0(i)-x0(i-1));
    d(i)=6*(f1-f2)/(h(i)+h(i-1));
end
P=diag(repmat(2,1,length(x0)))+diag(mu,-1)+diag(lambda,1);
M=P\d;
for i=1:length(x0)-1
    if (x>=x0(i) && x<=x0(i+1))
        y=M(i)*((x0(i+1)-x)^3)/(6*h(i)) ...
        +M(i+1)*((x-x0(i))^3)/(6*h(i)) ...
        +(y0(i)-(M(i)*(h(i)^2))/6)*(x0(i+1)-x)/h(i) ...
        +(y0(i+1)-(M(i+1)*(h(i)^2))/6)*(x-x0(i))/h(i);
    end
end