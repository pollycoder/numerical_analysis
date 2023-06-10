%%%%%%%%%%%%%%%%%%%%%%
%% New Cholesky
% assisted by Tikhonov
%%%%%%%%%%%%%%%%%%%%%%
function [x]=tikhonov_chol(A,b,n)
[regular_A,regular_b]=tikhonov(A,b,n);
x=cholesky(regular_A,regular_b,n);
end