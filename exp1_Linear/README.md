# Linear Equation Solution

## I. Algorithms
1. Gauss elimination
2. Cholesky factorization:
   Square method and optimized square method.
   Pay attention to the running time difference between the two method !!!
4. Conjugate gradient
5. GMRES
6. Regularization method (Tikhonov)

## II. Usage
```matlab
X=ALGORITHM(A,b);
```
`A` is an nxn matrix, `b` is an n-dimension vector, `X` is the solution vector.

## III. Experiments
You may change the dimension n as you like.

### 1. The function of regularization
Here we use Hilbert matrix (ill-conditioned)
Compare the condition before and after the Hilbert matrix is regularized.

### 2. The Difference between direct method and iterating method
Here we use Hilbert matrix again, and take the 2-norm of the residual as our ERROR.
You will see direct method is not suitable for ill-conditioned matrix, but iterating method can still work.

### 3. WHen to use Thomas method ?
Here we use two matrixes, one is regualarized Hilbert matrix (not ill-conditioned now), the other is a triple-diagonal matrix.
You will see only the second one can work out the precise solution, because Thomas method is only suitable for triple-diagonal matrix.

---

本仓库开源仅作为科学与工程计算学习使用，禁止直接抄袭！
