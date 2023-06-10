%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Deeper exploration
% Stable point VS fixed point
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
X1i=1;
X2i=1;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Iterred functions
% The first one got 2 stable points: 0.549 and 1.922, which caused
% vibration; the 3rd and 4th stable points (3.61 and -3.61) are unstable
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[X1i,step1i,x1i_arr]=directIter(@cube, @iter1, X1i, 1E-7,100);
[X2i,step2i,x2i_arr]=directIter(@cube, @iter2, X2i, 1E-7,100);

%%%%%%%%%%%%
% Plot
%%%%%%%%%%%%
% Result
subplot(2,2,1);
plot(0:step1i-1,x1i_arr,"-",'LineWidth',1);hold on;
plot(0:step2i-1,x2i_arr,"-",'LineWidth',1);
legend('函数1-双迭代直接迭代',...
       '函数2-双迭代直接迭代');


x=-5:0.00001:5;
y1=iter1(x);
y2=iter2(x);

subplot(2,2,2);
plot(x,x);hold on;
plot(x,y1);

subplot(2,2,3);
plot(x,x);hold on;
plot(x,y2);


%%%%%%%%%%%%%%%%%%%
% Original function
%%%%%%%%%%%%%%%%%%%
function y=cube(x)
y=x.^3+2.*x.^2+10.*x-20;
end

%%%%%%%%%%%%%%%%%%%%%%%%%
% Functions for iteration
%%%%%%%%%%%%%%%%%%%%%%%%%

% Function 1: 
% Not converged, vibrate, 
% "inf" if x0 is too large
function y=noConv1(x)
y=(20-2.*(x.^2)-x.^3)./10;
end

% Function 2: 
% Not converged, vibrate
% But more stable than func1
function y=noConv2(x)
y0=20-10*x-2*x.^2;
if sign(y0)==-1
    y=-power(abs(y0),1/3);
elseif sign(y0)==0
    y=0;
else
    y=power(abs(y0),1/3);
end
end

% Iterred functions
% For func1 and func2, iter them once
function y=iter1(x)
y=noConv1(noConv1(x));
end

function y=iter2(x)
y=noConv2(x);
y=noConv2(y);
end
