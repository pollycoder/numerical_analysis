%%%%%%%%%%%%%%%%%%%%%
% Pade approximation
%%%%%%%%%%%%%%%%%%%%%
function [num_coeffs, den_coeffs] = pade_approx(f, m, n)
% Coefficient matrix 
c=zeros([m+n+1,1]);

% Denominator coefficient
den_coeffs=zeros([m+1,1]);
for i=1:m+n+1
    syms x;
    df=diff(f(x),i-1);
    c(i)=subs(df,x,0)./factorial(i-1);
end
H=size(m);
for i=1:m
    for j=1:m
        H(i,j)=c(n+i-j+1);
    end
end
ck=-c(n+2:m+n+1);
b=H\ck;
den_coeffs(1)=1;
den_coeffs(2:m+1)=b;

% Numerator coefficient
a=zeros([n+1,1]);
for i=0:n
    a(i+1)=a(i+1)+c(i+1);
    for j=max(0,i-m):i-1
        a(i+1)=a(i+1)+c(j+1).*b(i-j);
    end
end
num_coeffs=a;
end






