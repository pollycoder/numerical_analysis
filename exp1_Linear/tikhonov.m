%%%%%%%%%%%%%%%%%%%%%%%%%
% Tikhonov regularization
%%%%%%%%%%%%%%%%%%%%%%%%%
function [regular_A,regular_b]=tikhonov(A,b,n)
    [U,S,V]=svd(A);               % 先对A做奇异值分解
    umax=S(1,1);
    alpha=umax.^2.*1E-6;
    regular_A=alpha*eye(n)+A'*A;
    regular_b=A'*b;
end