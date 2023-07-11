%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Newton-Cotes Integration
%%%%%%%%%%%%%%%%%%%%%%%%%%%
function result=newton_cotes_comp(f,a,b,m,n)
result=0;
dx=linspace(a,b,n-1);
for i=1:length(dx)-1
    y=newton_cotes(f,dx(i),dx(i+1),m);
    result=result+y;
end
end

function y=newton_cotes(fun,a,b,n)
sum=0;
% Cotes coefficient
coeff=zeros(7,8);
coeff(1,:)=[1,1,0,0,0,0,0,0]/2;                     % Trapezoid
coeff(2,:)=[1,4,1,0,0,0,0,0]/6;                     % Simpson
coeff(3,:)=[1,3,3,1,0,0,0,0]/8;
coeff(4,:)=[7,32,12,32,1,0,0,0]/90;
coeff(5,:)=[19,75,50,50,75,19,0,0]/288;
coeff(6,:)=[41,216,27,272,27,216,41,0]/840;
coeff(7,:)=[751,3577,1323,2989,2989,1323,3577,751]/17280;

% Linspace
x=zeros(1,n+1);
x(1)=a;
for i=2:n+1
    x(i)=x(i-1)+(b-a)/n;
end

% Integral
for k=1:n+1
    sum=sum+coeff(n,k)*fun(x(k));
end 
sum=sum * (b-a);
y=sum;
end
