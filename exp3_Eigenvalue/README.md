# Eigenvalue

## I. Algorithms

1. Jacobi passing method
2. QR method
3. Inverse power method combined with translation technique

## II. Usage

1. QR and Jacobi method

```matlab
[lambda,time]=ALGORITHM(A,e)
```

**Output**:`lambda` is the final result for eigenvalue, `time` is the running time.

**Input**: `A` is the matrix, `e` is the tolerance.

2. Inverse power method

```matlab
[lambda,times]=eig_invPow(A,lambda0, tol)
```

**Output**:`lambda` is the final result for eigenvalue, `time` is the running time.

**Input**: `A` is the matrix, `lambda0` is the initial value,  `e` is the tolerance.

## III. Experiments

### 1. Comparison between Jacobi method and QR method

Pay attention to the running time and error of the two methods.

### 2. Inverse power method with translation method

Try different initial values. Pay attention to the matrix A and the initial vector.

1. When you try 1, you may find that the algorithm is not converged. What does the iteration matrix look like under this condition ?
2. When you try a value from [1.2, 1.3], you may find that the answer is wrong. What is the condition number of the iteration matrix ?
3. When you try to get the maximum eigenvalue, you may find you fail every time, because the answer is always the second maximum eigenvalue. This is related to the orthogonality between the eigen-vector and the initial vector.

p.s. If you have already taken Dynamics and Control Course, you may have some idea about the meaning of the matrix, then you may figure out why there is orthogonality.

















---

本仓库开源仅作为科学与工程计算学习使用，禁止直接抄袭！
