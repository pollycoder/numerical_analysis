%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Lagrange Interpolation
%%%%%%%%%%%%%%%%%%%%%%%%%%%
function y=lagrange_interp(x,x0,y0)
y=0;
ii=1:length(x0);
for i=ii
    ij=find(ii~=i);
    li=1;
    for j=1:length(ij)
        li=li.*(x-x0(ij(j)))/(x0(i)-x0(ij(j)));
    end
    y=y+y0(i).*li;
end
end