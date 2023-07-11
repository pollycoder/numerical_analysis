%%%%%%%%%%%%%%%%%%%%%%%
% Gauss-Lobatto method
%%%%%%%%%%%%%%%%%%%%%%%
function int_value=gauss_lobatto(func,a,b,order)
switch order
    case 3
        points=[0, -1, 1];
        weights=[4/3, 1/3, 1/3];
    case 4
        points=[-sqrt(1/5), sqrt(1/5), -1, 1];
        weights=[5/6, 5/6, 1/6, 1/6];
    case 5
        points=[0,-sqrt(3/7),sqrt(3/7), -1, 1];
        weights=[32/45, 49/90, 49/90, 1/10, 1/10];
    case 6
        points=[-sqrt(1/3 - 2 * sqrt(7)/21), sqrt(1/3 - 2 * sqrt(7)/21),...
          -sqrt(1/3 + 2 * sqrt(7)/21), sqrt(1/3 + 2 * sqrt(7)/21), -1, 1];
        weights= [(14 + sqrt(7))/30, (14 + sqrt(7))/30, ...
          (14 - sqrt(7))/30, (14 - sqrt(7))/30, 1/15, 1/15];
    otherwise
        fprintf("order must be 3, 4, 5, 6");
end

res=0;

for i=1:length(points)
    x = (b - a) / 2 * points(i) + (b + a) / 2;
    res=res+func(x) * weights(i);  
end
int_value=(b - a) / 2 * res;

end