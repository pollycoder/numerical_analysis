%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Piecewise Linear Interpolation
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function y=piece_lin_interp(x,x0,y0)
y=0;
for i=1:length(x0)-1
    if (x>x0(i) && x<=x0(i+1))
        y=(x-x0(i+1))/(x0(i)-x0(i+1))*y0(i)...
           +(x-x0(i))/(x0(i+1)-x0(i))*y0(i+1);
    end
end
end