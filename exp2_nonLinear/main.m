%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Solutions to non-linear equations
% 1. Two functions
% 2. Steffensen acceleration
% 3. Newton
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clc
clear
% Initial result
X1=1;
X2=1;

X3=1;
X1s=1;
X2s=1;
X3s=1;

X4=1;

% Direct functions
% Func 1 and func 2 had vibrations, while func 3 is converged
fprintf("Direct functions:\n");
[X1,step1,x1_arr]=directIter(@cube,@noConv1,X1,1E-7,100);
[X2,step2,x2_arr]=directIter(@cube,@noConv2,X2,1E-7,100);
[X3,step3,x3_arr]=directIter(@cube,@conv,X3);
fprintf("\n");

% Steffensen acceleration
fprintf("Steffensen acceleration:\n");
[X1s,step4,x4_arr]=steffen_acc(@cube,@noConv1,X1s);
[X2s,step5,x5_arr]=steffen_acc(@cube,@noConv2,X2s);
[X3s,step6,x6_arr]=steffen_acc(@cube,@conv,X3s);
fprintf("\n");

% Newton iteration
fprintf("Newton iteration:\n");
[X4,step7,x7_arr]=newton(@cube,X4);

% Plot
subplot(2,1,1);
plot(0:step1-1,x1_arr,"-x",'LineWidth',1);hold on;
plot(0:step2-1,x2_arr,"-v",'LineWidth',1);
legend('函数1直接迭代',...
       '函数2直接迭代');
subplot(2,1,2);
plot(0:step3-1,x3_arr,"-o",'LineWidth',1);hold on;
plot(0:step4-1,x4_arr,"-square",'LineWidth',1);hold on;
plot(0:step5-1,x5_arr,"-diamond",'LineWidth',1);hold on;
plot(0:step6-1,x6_arr,"-*",'LineWidth',1);

% Mark the converged points
text(step3-1,X3+0.02,{'函数3收敛点','\downarrow'},'Color','red');
text(step4-1,X1s+0.02,{'函数1加速收敛点','\downarrow'},'Color','red');
text(step5-1,X2s+0.02,{'函数2加速收敛点','\downarrow'},'Color','red');
text(step6-1,X3s-0.02,{'\uparrow','函数3加速收敛点'},'Color','red');

% Legend
legend('函数3直接迭代', ...
       '函数1-steffensen加速',...
       '函数2-steffensen加速', ...
       '函数3-steffensen加速');

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
y0=20-10*x-2*x^2;
if sign(y0)==-1
    y=-power(abs(y0),1/3);
else
    y=power(y0,1/3);
end
end

% Function 3
% Converged, iteration: 23
function y=conv(x)
y=20/(x^2+2*x+10);
end


