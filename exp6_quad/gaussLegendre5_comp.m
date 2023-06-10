%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 5-points Gauss-Legendre Integration
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function result=gaussLegendre5_comp(f,a,b,n)
result=0;
dx=linspace(a,b,n+1);
for i=1:length(dx)-1
    y=gaussLegendre5(f,dx(i),dx(i+1));
    result=result+y;
end
end


function result = gaussLegendre5(f, a, b)
    weights = [0.236926885056189, 0.478628670499366, 0.568888888888889, 0.478628670499366, 0.236926885056189];
    nodes = [-0.906179845938664, -0.538469310105683, 0, 0.538469310105683, 0.906179845938664];
    mappedNodes = 0.5 * (b - a) * nodes + 0.5 * (b + a);
    result = sum(weights .* feval(f, mappedNodes));
    result = 0.5 * (b - a) * result;
end

