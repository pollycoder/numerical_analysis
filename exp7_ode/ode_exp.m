%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Experiment module
%   To make the experiment easier to repeat, we packaged the experiment
%  into a function. This experiment is about solving the motion of a 
%  harmonic oscillator whose angular velocity is 1(rad/s). You can choose 
%  different ODE solvers to solve this ODE probelm, and the comparison 
%  between the solution provided by the solver we written and the result 
%  provided by the analytical solution of the ODE. The analytical solution
%  is given below.
%% Parameters:
%   odesolver: the numerical ODE solver
%   tspan: the span of t
%   y0: the initial value
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function ode_exp(odesolver,tspan,y0,solver)
if isequal(odesolver,@ode45) || isequal(odesolver,@ode15s)
    opts = odeset('RelTol',1e-6,'AbsTol',1e-9);
    [t,y]=odesolver(@odefcn,tspan,y0,opts);
    t=t';
    y=y';
else
    [t,y]=odesolver(@odefcn,tspan,y0);
end
X=zeros(2,length(t));
for i=1:length(t)
    X(:,i)=harmo_osc(t(i),y0(2),y0(1),1);
end
y1=y(1,:);
y2=y(2,:);
result=(y1.*y1+y2.*y2)/2;
y3=X(2,:);
y4=X(1,:);
real=(y3.*y3+y4.*y4)/2;
error_p=y1-y3;
error_q=y2-y4;

figure
sgtitle(['Comparison between the analytical solution and ODE solver (',solver,')']);
subplot(3,1,1)
plot(t,y(1,:),"Color",'r','LineWidth',1.5);hold on;
plot(t,y(2,:),"Color",'m','LineWidth',1.5);hold on;
plot(t,X(2,:),"Color",'g','LineWidth',1.5,'LineStyle','--');hold on;
plot(t,X(1,:),"Color",'c','LineWidth',1.5,'LineStyle','--');
xlabel('t');
ylabel('velocity');
ylim([-1,1]);
legend('p','q','p-baseline','q-baseline');
title('Velocity and displacement (p and q)');

subplot(3,1,2)
plot(t,result,"Color",'b','LineWidth',1.5,'LineStyle','-');hold on;
plot(t,real,"Color",'r','LineWidth',1.5,'LineStyle','-');
xlabel('t');
ylabel('energy');
if isequal(odesolver,@ode45) || isequal(odesolver,@ode15s)
    ylim([0.4997,0.50002]);
else
    ylim([0.49999,0.500003]);
end
legend(solver,'baseline');
txt=title('\textbf{Energy ($\frac{p^2+q^2}{2}$)}');
set(txt,'Interpreter','latex');

subplot(3,1,3)
plot(t,error_p,"Color",'b','LineWidth',1.5,'LineStyle','-');hold on;
plot(t,error_q,"Color",'r','LineWidth',1.5,'LineStyle','-');
xlabel('t');
ylabel('error');
if isequal(odesolver,@ode_impRK4)
    ylim([-0.1,0.1]);
elseif isequal(odesolver,@ode15s)
    ylim([-1e-3,1e-3]);
elseif isequal(odesolver,@ode_expRK4)
    ylim([-1e-4,1e-4]);
end
legend('error-p','error-q');
title('Error');
end


function dydt=odefcn(t,y)
dydt=zeros(2,1);
dydt(1)=-y(2);
dydt(2)=y(1);
end

% Real answer: a harmonic oscillator
function X=harmo_osc(t,q0,p0,w)
A=[cos(w*t),1/w*sin(w*t);-w*sin(t),cos(w*t)];
X=A*[q0;p0];
end
