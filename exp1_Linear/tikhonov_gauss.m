%%%%%%%%%%%%%%%%%%%%%%
%% New Gauss
% assisted by Tikhonov
%%%%%%%%%%%%%%%%%%%%%%
function [x]=tikhonov_gauss(A,b,n)
[regular_A,regular_b]=tikhonov(A,b,n);
x=gauss(regular_A,regular_b,n);
end