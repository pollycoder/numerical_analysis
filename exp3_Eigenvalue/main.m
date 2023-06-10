%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Eigenvalue calculating
% Jacobi
% QR
% Input: matrix A, error e
% Output: a diagonal matrix - eig-matrix
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clc
clear workspace

% Get matrix A and set the error
e=1E-5;
n_array=[];
time_ja=[];
time_qra=[];
err_ja=[];
err_qra=[];
for n=10:5:100
    A=diag(repmat(2,1,n))...
    +diag(repmat(-1,1,n-1),1)...
    +diag(repmat(-1,1,n-1),-1);

    % True value
    real=eig(A);

    % Jacobi
    tic;
    [lambda1,times1]=eig_jacobi(A,e,n);
    lambda1=sort(lambda1);
    time_j=toc;
    time_ja(end+1)=time_j;
    err_ja(end+1)=norm(real-lambda1);

    % QR
    tic
    [lambda2,times2]=eig_qr(A,n,e);
    lambda2=sort(lambda2);
    time_q=toc;
    time_qra(end+1)=time_q;
    err_qra(end+1)=norm(real-lambda2);

    n_array(end+1)=n;

    % Inverse power method
    tic
    [lambda3,times3]=eig_invPow(A,n,e);
    time_inv=toc;
end

subplot(1,2,1)
plot(n_array,time_ja,'-o','Linewidth',1.5);hold on;
plot(n_array,time_qra,'-v','Linewidth',1.5);
legend("Jacobi方法","QR方法");
title('两种方法的求解时间随阶数变化关系图');

subplot(1,2,2)
plot(n_array,err_ja', "-o",'LineWidth',2);hold on;
plot(n_array,err_qra', "-v",'LineWidth',2);
legend("Jacobi方法","QR方法");
title('两种方法的求解误差随阶数变化关系图');

err_qra=err_qra';
err_ja=err_ja';
time_ja=time_ja';
time_qra=time_qra';