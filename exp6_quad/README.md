# Numerical Integration

## I. Alogorithms

1. Newton-Cotes
2. Gauss-Legendre
3. Romberg
4. Gauss-Lobatto
5. Filon

## II. Usage

The output of all the integeral formula is the integeration value.

1. Newton-Cotes

```matlab
result=newton_cotes_comp(f,a,b,m,n);
```

**Input:**`f` is the function to be integrated, `(a,b)` is the integral section, `m` is the order, `n` is the number of sub-sections for integeration.

2. Gauss-Legendre (5 points formula)

```matlab
result=gaussLegendre5_comp(f,a,b,n);
```

**Input:**`f` is the function to be integrated, `(a,b)` is the integral section,  `n` is the number of sub-sections for integeration.

3. Romberg

```
result=romberg(f,a,b,n,e)
```

**Input:**`f` is the function to be integrated, `(a,b)` is the integral section,  `n` is the timesr of Richardson's extrapolation, `e` is the error.

4. Gauss-Lobatto

```matlab
result=gauss_lobatto(f,a,b,n);
```

**Input:**`f` is the function to be integrated, `(a,b)` is the integral section,  `n` is the order.

5. Filon

```matlab
result=filon(f,a,b,N,n);
```

**Input:**`f` is the function to be integrated, `(a,b)` is the integral section,  `n` is the angular velocity of Fourier integeration, `N` is the number of sub-sections.

## III. Experiments

### 1. Normal integeration

Compare the error among Newton-Cotes (you can change the number of sub-sections and order), Gauss-Legendre, Romberg and Gauss-Lobatto method. You may find that Romberg is more flexible about the tolerance.

### 2. Integeration for viberating function

Take Fourier integeration as an example. Compare the result from Gauss-Lobatto and Filon method. You may find that Gauss-Lobatto method is both suitable for the two kinds of integerations, but it suits viberating integeration better. However, if the tolerance should be taken into account, then Filon method is better.





---

本仓库开源仅作为科学与工程计算学习使用，禁止直接抄袭！