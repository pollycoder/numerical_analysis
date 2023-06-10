%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Main program
%   1. Best square approximation
%   2. Tchebychev approximation 
%   3. Lagrange remainder minimization
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clc
clear workspace
n=4;
func=@(x)x.^2.*log(2+x);

a_sqr=sqr_approx(n,func);
func_sqr=@(x)0;

syms y;
Tn=[1,y,cos(2.*acos(y)),cos(3.*acos(y)),cos(4.*acos(y))];
a_tche=tche_approx(func,n);
func_tche=@(x)0;

func_real=@(x)0;
for i=1:n+1
    func_sqr=@(x)func_sqr(x)+a_sqr(i).*x.^(i-1);
    func_tche=@(x)func_tche(x)+a_tche(i).*subs(Tn(i),y,x);
end

x_input=-1:0.01:1;
y_real=func(x_input);
y_sqr=func_sqr(x_input);
y_tche=double(func_tche(x_input));
y_lag=lag_approx(func,n,x_input);

err_sqr_2=norm(y_sqr-y_real,2);
err_tche_2=norm(y_tche-y_real,2);
err_lag_2=norm(y_lag-y_real,2);

err_sqr_inf=norm(y_sqr-y_real,inf);
err_tche_inf=norm(y_tche-y_real,inf);
err_lag_inf=norm(y_lag-y_real,inf);

figure
plot(x_input,y_real,'-','LineWidth',3,'Color','k');hold on;
plot(x_input,y_sqr,'-','LineWidth',2,'Color','m');hold on;
plot(x_input,y_tche,'-','LineWidth',2,'Color','r');hold on;
plot(x_input,y_lag,'-','LineWidth',2,'Color','c');
legend('Baseline','Approx-Sqrt','Approx-Tchebychev','Approx-Lagrange');
title("Functional Approximation");

figure
plot(x_input,y_sqr-y_real,'-','LineWidth',2,'Color','m');hold on;
plot(x_input,y_tche-y_real,'-','LineWidth',2,'Color','r');hold on;
plot(x_input,y_lag-y_real,'-','LineWidth',2,'Color','c');
legend('Approx-Sqrt','Approx-Tchebychev','Approx-Lagrange');
title("Error");