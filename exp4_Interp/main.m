%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Interpolation
%   1. Lagrange interpolation
%   2. Piecewise linear interpolation
%   3. Cubic spline interpolation
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clc
clear workspace

n=10;
bound=1;

% Baseline
x_base=-bound:2*bound/(1000*n):bound;
x_base=x_base';
y_base=zeros(size(x_base));
for i=1:length(y_base)
    %y_base(i)=1/(1+25*x_base(i)^2);
    %y_base(i)=sin(x_base(i));
    y_base(i)=x_base(i)^3+x_base(i);
end


% Prepare for the sampling points
x=-bound:2*bound/n:bound;
y=zeros(size(x));
for i=1:length(y)
    %y(i)=1/(1+25*x(i)^2);
    %y(i)=sin(x(i));
    y(i)=x(i)^3+x(i);
end


% Lagrange interpolation -- Runge
yl=y_base;
err_l=y_base;
rel_err_l=err_l;
for i=1:length(yl)
    yl(i)=lagrange_interp(x_base(i),x,y);
    err_l(i)=yl(i)-y_base(i);
    rel_err_l(i)=err_l(i)/y_base(i);
end
figure
% Plot the interpolating points and baseline curve
plot(x_base,y_base,"-",'LineWidth',2,'Color','r');hold on;
plot(x,y,"o",'LineWidth',2,'Color','r');
% Plot the interpolated curve
plot(x_base,yl,":",'LineWidth',2,'Color','b');hold off;
legend('原函数','采样点','Lagrange插值');
title("Lagrange插值结果");



% Piecewise linear interpolation
yp=y_base;
err_p=y_base;
rel_err_p=err_p;
for i=1:length(yp)
    yp(i)=piece_lin_interp(x_base(i),x,y);
    err_p(i)=yp(i)-y_base(i);
    rel_err_p(i)=err_p(i)/y_base(i);
end
figure
% Plot the interpolating points and baseline curve
plot(x_base,y_base,"-",'LineWidth',2,'Color','r');hold on;
plot(x,y,"o",'LineWidth',2,'Color','r');hold on;
% Plot the interpolated curve
plot(x_base,yp,"-.",'LineWidth',2,'Color','b');hold off;
legend('原函数','采样点','分段线性插值');
title("分段线性插值结果");


% Spline interpolation
ys=y_base;
err_s=y_base;
rel_err_s=err_s;
for i=1:length(ys)
    ys(i)=spline_interp(x_base(i),x,y);
    err_s(i)=ys(i)-y_base(i);
    rel_err_s(i)=err_s(i)/y_base(i);
end
figure
% Plot the interpolating points and baseline curve
plot(x_base,y_base,"-",'LineWidth',2,'Color','r');hold on;
plot(x,y,"o",'LineWidth',2,'Color','r');hold on;
% Plot the interpolated curve
plot(x_base,ys,":",'LineWidth',2,'Color','b');hold off;
legend('原函数','采样点','三次样条插值');
title("三次样条插值结果");










