%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Numerical integration and differential
%   1. 5-Gauss-Legendre integration
%   2. Romberg
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clc
clear all
format long e

% Section number
n_gauss(1)=4;
n_rom(1)=4;
e=1e-20;

% Test function
test_func=@(x)sin(2.*pi./x)./x.^2;
range=[1,3];

% Baseline
y_baseline=integral(test_func,range(1),range(2));

% Integration
for i=1:20
    y_gauss(i)=gaussLegendre5_comp(test_func,range(1),range(2),n_gauss(i));
    y_romberg(i)=romberg(test_func,range(1),range(2),n_rom(i),e);
    e_gauss(i)=abs(y_gauss(i)-y_baseline);
    e_romberg(i)=abs(y_romberg(i)-y_baseline);
    if i<20
        n_gauss(i+1)=n_gauss(i)+1;
        n_rom(i+1)=n_rom(i)+1;
    end
end
e_gauss=log10(e_gauss);
e_romberg=log10(e_romberg);

display(y_gauss(1));
display(y_romberg(20));

subplot(1,2,1)
plot(n_gauss,e_gauss,'-o','Color','r','LineWidth',1.5);
xlabel('n-section');
ylabel('Error');
title('Error of Gauss-Legendre-5');

subplot(1,2,2)
plot(n_rom,e_romberg,'-o','Color','b','LineWidth',1.5);
xlabel('n-richardson');
ylabel('Error');
title('Error of Romberg');

y_gauss=y_gauss';
y_romberg=y_romberg';
e_gauss=e_gauss';
e_romberg=e_romberg';







