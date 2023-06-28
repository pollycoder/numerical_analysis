%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Tikhonov regularization
%   Mainly for optimize the matrix by reducing 
% its condition number.
%   However, the shortage is that you can never 
% get the precise solution through this method 
% because the matrix has already been changed.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [regular_A,regular_b]=tikhonov(A,b)
[~,n]=size(A);
[~,S,~]=svd(A);               % singualr value decomposition
umax=S(1,1);                  % The largest sigular value
alpha=umax.^2.*1E-6;          % The almost best tikhonov factor
regular_A=alpha*eye(n)+A'*A;
regular_b=A'*b;
end