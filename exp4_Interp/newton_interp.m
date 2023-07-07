%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Newton Interpolation
%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [interp_values]=newton_interp(interp_points,x,y)
% Difference quotient
n=length(x);
F=zeros(n,n);                % Difference quotient
F(:,1)=y;
for j=2:n
    for i=1:(n-j+1)
        F(i,j)=(F(i+1,j-1)-F(i,j-1))/(x(i+j-1)-x(i));
    end
end

% Interpolation
m=length(interp_points);
interp_values=zeros(1,m);
for k=1:m
    interp_values(k)=F(1,1);
    for j=2:n
        term=F(1,j);
        for i=1:(j-1)
            term=term*(interp_points(k)-x(i));
        end
        interp_values(k)=interp_values(k)+term;
    end
end
end
