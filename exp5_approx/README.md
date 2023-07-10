# Function Approximation

## I. Algorithms

1. Best square approximation ----- Legendre polynominal
2. Approximate best uniform approximation ----- Tchebychev series truncation
3. Pade approximation
4. Least square method

## II. Usage

1. Orthogonal polynominal approximation --- best square and approximate best uniform approximation

```matlab
coefficient=sqr_approx(n,func);
coefficient=tche_approx(func,n);
```

**Input:**`func` is the function handle to be approximated, `n` is the order of the polynominal.

**Output:**`coefficient` is the coefficient of the polynominal.

2. Pade approximation

```matlab
[num_coeff,den_coeff]=pade_approx(f,m,n);
```

**Input:**`f` is the function handle to be approximated, `m` is the order of denominator polynominal, `n` is the order of numerator polynominal.

**Output:**`num_coeff` is the coefficient of numerator polynominal, `den_coeff` is the coefficient of denominator polynominal.

To get the approximated function, use the code:

```matlab
% Get approximated function
Q=@(x)0;
P=@(x)0;
for i=1:m
    Q=@(x)(Q(x)+q(i).*x.^(i-1));
end
for i=1:n
    P=@(x)(P(x)+p(i).*x.^(i-1));
end
Rmn=@(x)P(x)./Q(x);													% The final function
```

**How to get the polynominal (except Pade):**

```matlab
syms x
P=@(x)0;
for i=1:n+1
	% Choose one of the two lines of code below
	P=@(x)P(x)+coefficient(i).*x.^(i-1);			% For best square and best uniform approximation
	P=@(x)P(x)+coefficient(i).*x.^(n-i+1);		% For least square method
end

% Now P is the polynominal we want.
```

3. Least square method

```matlab
coeffs=least_square(x, y, n);
```

**Input:**`(x,y)` is the points to be fit, `n` is the order of the polynominal.

**Output:**`coefficient` is the coefficient of the polynominal.

## III. Experiments

You may try different functions for interpolation.

### 1. Polynominal approximation

We have 3 methods: **best square approximation**, **Tchebychev series truncation method** (approximate best uniform approximation) and **least square method**. You may change 

We have two figures: one shows the result of approximation, the other shows the transformation of error. From the figure you can see the distribution of deviation points. Do the positive points and negative points **take turns** to appear ?

### 2. Pade approximation

Pade approximation is another kind of rational approximation. You may change the coefficient for numerator ($n$) and denominator ($m$), compare the error with the three polynominal approximation methods mentioned above.



---

本仓库开源仅作为科学与工程计算学习使用，禁止直接抄袭！
