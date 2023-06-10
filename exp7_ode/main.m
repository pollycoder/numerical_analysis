%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Main Experiment
%  Solvers we are going to try: 
%   1. Manual solvers: 
%       ode_expRK4:explicit R-K in 4 orders
%       ode_impRK4:implicit R-K in 4 orders
%   2. Matlab solvers:ode45,ode15s
%  Baseline result is provided in each experiment.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clc
clear all

% Initial value and span
y0=[0,1];
tspan=[0,100];

% Experiments
ode_exp(@ode_expRK4,tspan,y0,'Explicit R-K (order=4)');
ode_exp(@ode_impRK4,tspan,y0,'Implicit R-K (order=4)');
ode_exp(@ode45,tspan,y0,'ode45');
ode_exp(@ode15s,tspan,y0,'ode15s');