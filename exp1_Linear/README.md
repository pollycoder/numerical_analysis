# 数值分析——线性方程组解法

## 问题描述

设$H_n=[h_{ij}] \in \mathbb{R}^{n \times n}$是Hilbert矩阵，即
$$
h_{ij}=\frac{1}{i+j-1}
$$
对n=10,11,...,15恒成立。
(a) 取$x=
        \begin{pmatrix}
         1  \\
         ...\\
         1
    \end{pmatrix}\in \mathbb{R}^{n}$，令$b_n=H_nx$.再用Gauss消去法和Cholesky分解方法来求解$H_ny=b_n$，看看误差有多大.
(b) 使用正则化方法改善(a)中的结果.
(c) 用共轭梯度法和GMRES方法求解$H_ny=b_n$，并与前面的直接方法作比较.

## 文件结构

1. 主程序：hilbert.m

求解+绘图（可绘出MSE随矩阵阶数（病态程度）的变化图）

2. 求解程序

高斯消元法：gauss.m

Cholesky分解法：cholesky.m

吉洪诺夫正则化：tikhonov.m, tikhonov_gauss.m, tikhonov_chol.m

共轭梯度法：cg.m

广义最小残差法：GMRES.m

3. 报告(.pdf)

4. 实验结果(result.xlsx)



---

本仓库开源仅作为科学与工程计算学习使用，禁止直接抄袭！