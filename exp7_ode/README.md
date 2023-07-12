# ODE Numerical Solution

## I. Algorithms

1. Euler method

- Explicit
- Implicit
- Improved (prediction-correction)

2. Runge-Kutta method

- Explicit
- Implicit

3. Linear multi-step method (Milne method)

## II. Usage

The input and output can be referred from the documentation of `@ode45`.

```matlab
[t,y_euler_exp]=ode_euler_exp(@odefcn,tspan,y0,N);				% Explicit Euler
[t,y_euler_exp]=ode_euler_imp(@odefcn,tspan,y0,N);				% Implicit Euler
[t,y_euler_improve]=ode_euler_improve(@odefcn,tspan,y0,N);% Improved Euler

[t,y_rk4_exp]=ode_expRK4(@odefcn,tspan,y0);								% Explicit Runge-Kutta
[t,y_rk4_imp]=ode_impRK4(@odefcn,tspan,y0);								% Implicit Runge-Kutta

[t,y_milne]=milne(@odefcn,tspan,y0);											% Milne method
```

## III. Experiments

The ODE we chose here is actually a harmonic oscillator:
$$
\begin{align}
\dot{p}&=-q\\
\dot{q}&=p
\end{align}
$$
With the initial condition $p_0=0, q_0=1$.

The physical meaning of $p$ and $q$ is velocity and displacement of the oscillator. So here we introduce another physical quantity: the energy of the system.

Pay attention to the two plots for each method. One shows the transformation of $p$ and $q$, the other shows the transformation of the energy. Compare the stability of different method. Is the conclusion the same with the one mentioned in class ?

P.s. The energy should conserved analytically, but actually it's not because of the error in numerical method. So pay attention to the error of energy !



---

本仓库开源仅作为科学与工程计算学习使用，禁止直接抄袭！