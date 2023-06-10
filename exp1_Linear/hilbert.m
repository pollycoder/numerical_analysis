%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Linear equations
% Problem:
%   1. Gauss VS Cholesky and compare the error
%   2. Regularization method --- optimization
%   3. Conjugate gradient methods and GMRES,
%      and compare the result
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clc
clear

n_arr=[];
res_arr1=[];
res_arr2=[];
res_arr3=[];
res_arr31=[];
res_arr4=[];
res_arr5=[];
step4_arr=[];
% Dimension number of the equations
% n can be randomly changed
for n=10:15
    % Hilbert matrix
    % Size: n x n
    gaussH=hilb(n);
    choleH=hilb(n);
    tikGaussH=hilb(n);
    tikCholH=hilb(n);
    conjgradH=hilb(n);
    gmresH=hilb(n);
    
    % X, size: n x 1
    X=ones([n,1]);
    gauss_bn=gaussH*X;
    chole_bn=choleH*X;
    tikGauss_bn=tikGaussH*X;
    tikChol_bn=tikCholH*X;
    conjgrad_bn=conjgradH*X;
    gmres_bn=gmresH*X;

    fprintf("n=%d\n", n);
    
    % Solve in gauss elimination solution
    [Y1]=gauss(gaussH,gauss_bn,n);
    res1=mse(Y1-X);
    fprintf("Y1=\n");
    disp(Y1);
    fprintf("Residual 1 = %d\n", res1);

    % Solve in Cholesky Factorization
    Y2=cholesky(choleH,chole_bn,n);
    res2=mse(Y2-X);
    fprintf("Y2=\n");
    disp(Y2);
    fprintf("Residual 2 = %d\n", res2);

    % Solve in Tikhonov Regularization
    % First is gauss, then cholesky
    Y3=tikhonov_gauss(tikGaussH,tikGauss_bn,n);
    res3=mse(Y3-X);
    fprintf("Y3=\n");
    disp(Y3);
    fprintf("Residual 3 = %d\n", res3);

    Y31=tikhonov_chol(tikCholH,tikChol_bn,n);
    res31=mse(Y31-X);
    fprintf("Y31=\n");
    disp(Y31);
    fprintf("Residual 3-1 = %d\n", res31);

    % Solve in Conjugate Gradient Methods
    [Y4,step4]=cg(conjgradH,conjgrad_bn,n,9.3e-10);
    res4=mse(Y4-X);
    fprintf("Y4=\n");
    disp(Y4);
    fprintf("Residual 4 = %d\n", res4);

    % Solve in GMRES Methods
    Y5=GMRES(gmresH,gmres_bn);
    res5=mse(Y5-X);
    fprintf("Y5=\n");
    disp(Y5);
    fprintf("Residual 5 = %d\n", res5);
    
    % Array
    n_arr(end+1)=n;
    res_arr1(end+1)=res1;
    res_arr2(end+1)=res2;
    res_arr3(end+1)=res3;
    res_arr31(end+1)=res31;
    res_arr4(end+1)=res4;
    res_arr5(end+1)=res5;
    step4_arr(end+1)=step4;
end

% Plot
subplot(2,2,1);
plot(n_arr,res_arr1,":",'LineWidth',2);hold on
plot(n_arr,res_arr2,"-o",'LineWidth',2);hold on
plot(n_arr,res_arr3,"-.",'LineWidth',2);hold on
plot(n_arr,res_arr31,"--",'LineWidth',2);hold on
plot(n_arr,res_arr4,"-*",'LineWidth',2);hold on
plot(n_arr,res_arr5,"-v",'LineWidth',2);
legend('Gauss消去法', ...
    'Cholesky分解法', ...
    'Tikhonov正则化-Gauss消去法', ...
    'Tikhonov正则化-Cholesky分解法',...
    '共轭梯度法', ...
    'GMRES法');
xlim([10,15]);
ylim([0,1E-3]);
set(gca,'XTick',10:1:15);
xlabel('n');
ylabel('Res');
title('各种求解方法的误差随n的变化关系(1E-03量级)');

subplot(2,2,2);
plot(n_arr,res_arr1,":",'LineWidth',2);hold on
plot(n_arr,res_arr2,"-o",'LineWidth',2);hold on
plot(n_arr,res_arr3,"-.",'LineWidth',2);hold on
plot(n_arr,res_arr31,"--",'LineWidth',2);hold on
plot(n_arr,res_arr4,"-*",'LineWidth',2);hold on
plot(n_arr,res_arr5,"-v",'LineWidth',2);
legend('Gauss消去法', ...
    'Cholesky分解法', ...
    'Tikhonov正则化-Gauss消去法', ...
    'Tikhonov正则化-Cholesky分解法',...
    '共轭梯度法', ...
    'GMRES法');
xlim([10,15]);
ylim([0,1]);
set(gca,'XTick',10:1:15);
xlabel('n');
ylabel('Res');
title('各种求解方法的误差随n的变化关系(1E+00量级)');

subplot(2,2,3);
plot(n_arr,res_arr1,":",'LineWidth',2);hold on
plot(n_arr,res_arr2,"-o",'LineWidth',2);hold on
plot(n_arr,res_arr3,"-.",'LineWidth',2);hold on
plot(n_arr,res_arr31,"--",'LineWidth',2);hold on
plot(n_arr,res_arr4,"-*",'LineWidth',2);hold on
plot(n_arr,res_arr5,"-v",'LineWidth',2);
legend('Gauss消去法', ...
    'Cholesky分解法', ...
    'Tikhonov正则化-Gauss消去法', ...
    'Tikhonov正则化-Cholesky分解法',...
    '共轭梯度法', ...
    'GMRES法');
xlim([10,15]);
ylim([0,1E03]);
set(gca,'XTick',10:1:15);
xlabel('n');
ylabel('Res');
title('各种求解方法的误差随n的变化关系(1E03量级)');

subplot(2,2,4);
plot(n_arr,res_arr1,":",'LineWidth',2);hold on
plot(n_arr,res_arr2,"-o",'LineWidth',2);hold on
plot(n_arr,res_arr3,"-.",'LineWidth',2);hold on
plot(n_arr,res_arr31,"--",'LineWidth',2);hold on
plot(n_arr,res_arr4,"-*",'LineWidth',2);hold on
plot(n_arr,res_arr5,"-v",'LineWidth',2);
legend('Gauss消去法', ...
    'Cholesky分解法', ...
    'Tikhonov正则化-Gauss消去法', ...
    'Tikhonov正则化-Cholesky分解法',...
    '共轭梯度法', ...
    'GMRES法');
xlim([10,15]);
ylim([0,1]);
set(gca,'XTick',10:1:15);
xlabel('n');
ylabel('Error');
title('各种求解方法的误差随n的变化关系(1E+06量级)');


