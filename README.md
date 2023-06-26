# Numerical Analysis - Code Material Repository
## The Very Beginning
The repositiry is for numerical analysis learning, containing the source code for all the algorithms would be learned in this course. To make it easier to use, here's the construction of the files:
1. ${ALGORITHM_NAME}.m: the implement for each alogorithm. They would be sealed into a function. For more information, go into each directory and read the README file within.
2. example.m: examples for one experiment.
3. experiment.m: a sealed function to do experiment more conveniently. If you don't want to spend time to design experiments by yourself, this might be a good choice.
You can also create your own file to do experiments. Both sealed and unsealed examples can be found in example.m.

## Experiment List

### Experiment 1 Linear Equations Solving
1. Gauss elimination
2. Cholesky Factorization
3. CG and GMRES

Compare the error

### Experiment 2 Non-linear Equations Solving
1. Direct function construction
2. Accelerations --- Steffensen
3. Newton

Requirements: Error < 1e-7

### Experiment 3 Eigenvalue Calculation
1. Jacobi method
2. QR method

### Experiment 4 Interpolation
1. Lagrange interpolation
2. Piecewise linear interpolation
3. Cubic spline interpolation

### Experiment 5 Function Approximation
1. Best square approximation
2. Tchebychev series truncation
3. Lagrange remainder minimization

### Experiment 6 Numerical Integration
1. 5-point-Gauss-Legendre
2. Romberg, Error<1e-7

### Experiment 7 ODE Numerical Solution
1. Explicit Runge-Kutta in 4 orders (ode45 without 5-order correction)
2. Implicit Runge-Kutta in 4 orders

## Acknowledgement
Thanks to Professor Zhongyi Huang from Department of Mathematical Sciences, Tsinghua University, our lecturer for Engineering and Scientific Computing Course. His course with large capacity provided us with many practical algorithms and deeper understanding about its usage, and the
most importantly, pros and cons, which helped us to decide which algorithm to use in real situations.

