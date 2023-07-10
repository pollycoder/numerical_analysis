%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Tchebychev series truncation
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function coefficients = tche_approx(func,n)
coefficients = zeros(n+1, 1);
syms x;
Tn=[1,x,cos(2.*acos(x)),cos(3.*acos(x)),cos(4.*acos(x))];
for i=1:n+1
    foo=@(x)func(x)*Tn(i)/sqrt(1 - x^2);
    if i~=1
        coefficients(i,1) = (2 / pi) * int(foo,x,-0.9999,0.9999);
    else
        coefficients(i,1) = (1 / pi) * int(foo,x,-0.9999,0.9999);
    end
end
end

