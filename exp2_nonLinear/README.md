# Non-Linear Equation Solution

## I. Algorithms

1. Direct iteration
2. Steffensen acceleration
3. Newton iteration

- Newton method
- Secant method
- Quadratic method

## II. Usage

1. Direct method

```matlab
[x,steps,x_array]=directIter(obj_fun,iter_fun,x0,tol,max_iter)
```

**Output**: `x` is the final solution, `steps` is the steps number it takes to iterate, `x_array` displays the process of iteration.

**Input**: `obj_fun` is the function to be solved, `iter_fun` is the function for iteration, `x0` is the initial value, `tol` is the tolerance of the algorithm, `max_iter` is the maximum iteration steps. 

2. Steffensen acceleration

```matlab
[x,steps,x_array]=steffen_acc(obj_fun,iter_fun,x0,tol,max_iter)
```

**Output**: `x` is the final solution, `steps` is the steps number it takes to iterate, `x_array` displays the process of iteration.

**Input**: `obj_fun` is the function to be solved, `iter_fun` is the function for iteration, `x0` is the initial value, `tol` is the tolerance of the algorithm, `max_iter` is the maximum iteration steps. 

3. Newton method

```matlab
[x,steps]=newton(obj_fun,x0,tol,max_iter)
```

**Output**: `x` is the final solution, `steps` is the steps number it takes to iterate.

**Input**: `obj_fun` is the function to be solved,  `x0` is the initial value, `tol` is the tolerance of the algorithm, `max_iter` is the maximum iteration steps. 

4. Secant method

```matlab
[x,steps]=secant(obj_fun,x0,x1,tol,max_iter)
```

**Output**: `x` is the final solution, `steps` is the steps number it takes to iterate.

**Input**: `obj_fun` is the function to be solved,  `x0` and `x1` are initial values, `tol` is the tolerance of the algorithm, `max_iter` is the maximum iteration steps. 

5. Quadratic method

```matlab
[x,steps]=quadratic(obj_fun,x0,x1,x2,tol,max_iter)
```

**Output**: `x` is the final solution, `steps` is the steps number it takes to iterate.

**Input**: `obj_fun` is the function to be solved,  `x0` , `x1` and `x2` are initial values, `tol` is the tolerance of the algorithm, `max_iter` is the maximum iteration steps. 

## II. Experiments

You may change the original function (here the func name is @cube: $y=x^3+x^2+10x-20$)

### 1. Direct method

Pay attention to the astringency of each iterating function. There are 3 functions:

(1) $\varphi (x)=\frac{20-2x^2-x^3}{10}$: Not converged

(2) $\varphi (x)=20-10x^2-x^3$: Not converged

**(3) $\varphi (x)=\frac{20}{x^2+2x+10}$: Converged**

Then check the iteration graphs which show the process of iteration. You may find that there are vibrations within the first two methods, which caused the misconvergence.

### 2. Steffensen method

Now we add Steffensen acceleration upon each iterating function. Do they converge now ? If so, how many steps do they take ? Compare their convergence and the steps to those without acceleration.

### 3. Newton iteration

Here we have three Newton methods: 

(1) Classical Newton method: **differential coefficient**, use tangent line.

(2) Secant method: use serif.

(3) Quadratic method: use parabola.

Compare the convergence and sort the converging speed. Which one converges the fastest ?

### 4. Bonus experiment: Why there are vibrations in experiment 1?

We iterate the first two iterating functions twice:$\varphi (x)\to \varphi (\varphi (x))$.

First we use these two function to solve the object function again, now they converged but finally reach the wrong answer. Where did they become converged ? 

Now check the graph of the two iterated functions, what are their fixed points ? 

Check the intersection points ( the fixed points) between the iterated function and $y=x$. Find the intersection points and try to explain the vibration combined with the result we get from experiment 1.

---

本仓库开源仅作为科学与工程计算学习使用，禁止直接抄袭！
