# Interpolation

## I. Algorithms

1. Polynominal interpolation: 

   Lagrange interpolation and Newton interpolation

   There should be no difference between the two methods.

1. Polynominal interpolation through Tchebychev nodes

2. Hermite interpolation

3. Piecewise interpolation: spline interpolation (cubic and B-spline)

4. ENO interpolation

## II. Usage

1. Polynominal interpolation

```matlab
y=lagrange_interp(x,x0,y0);
y=newton_interp(x,x0,y0);
```

**Output:** `y` is the result of each interpolation

**Input:** `x` is the points to be interpolated, `(x0,y0)` is the points for interpolation.

2. Hermite interpolation

```matlab
y=hermite_interp(x0, y0, dy0, x);
```

**Output: ** `y` is the result of each interpolation

**Input:** `x` is the points to be interpolated, `(x0,y0)` is the points for interpolation, `dy0` is the derivative value for each `x0`.

3. Cubic spline

```matlab
y=spline_interp(x,x0,y0);
```

**Output: ** `y` is the result of each interpolation.

**Input:** `x` is the points to be interpolated, `(x0,y0)` is the points for interpolation.

## III. Experiments

You may try different functions for interpolation.

### 1. The comparison between Lagrange interpolation and Newton interpolation

This experiment proved the uniqueness of polynominal interpolation. You will find out that the curves are totally the same, which means that though the formulas of the two interpolation methods are different, the final polynominals are the same.

However, when we try to interpolate some functions, Runge phenomenon will appear. The rest of the methods can solve the problem.

### 2. Cubic spline interpolation

Spline interpolation can make the interpolation curve smoother, and as well reduces the residual. Cubic spline interpolation is the most common method.

### 3. Polynominal interpolation through Tchebychev nodes

In Lagrange and Newton interpolation we used equidistant nodes for interpolation ,which will cause Runge phenomenon when interpolating some functions. If we use Tchebychev nodes, Runge phenomenon will be weakened.

### 4. Hermite interpolation

## IV. Apology

Sorry that there are some bugs in the code of B-spline and ENO interpolation, therefore the experiment will come out later.



---

本仓库开源仅作为科学与工程计算学习使用，禁止直接抄袭！
