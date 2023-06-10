%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Lagrange remainder minimization
%  Parameters:
%   func: object function
%   n: order
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function y = lag_approx(func,n,x)
coefficients = zeros(n, 1);
for i=1:n+1
coefficients(i)=cos((2*i-1)*pi/(2*(n+1)));
end
y0=func(coefficients);
y=lagrange_interp(x,coefficients,y0);
end

