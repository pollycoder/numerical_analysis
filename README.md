# Numerical Analysis - Code Material Repository
## The Very Beginning
The repositiry is for numerical analysis learning, containing the source code for all the algorithms would be learned in this course. To make it easier to use, here's the construction of the files:
1. ${ALGORITHM_NAME}.m: the implement for each alogorithm. They would be sealed into a function. For more information, go into each directory and read the README file within.
2. example.mlx: Live script for experiments. Details will be introduced in the code comments.
You can also create your own file to do experiments. 

## Experiment List
Detailed information is provided in the README under each experimental directory. Read them carefully to help you think when doing the experiments.

### Experiment 1 Linear Equations Solving

### Experiment 2 Non-linear Equations Solving

### Experiment 3 Eigenvalue Calculation

### Experiment 4 Interpolation

### Experiment 5 Function Approximation

### Experiment 6 Numerical Integration

### Experiment 7 ODE Numerical Solution

## Acknowledgement
Thanks to Professor Zhongyi Huang from Department of Mathematical Sciences, Tsinghua University, our lecturer for Engineering and Scientific Computing Course. His course with large capacity provided us with many practical algorithms and deeper understanding about its usage, and the
most importantly, pros and cons, which helped us to decide which algorithm to use in real situations.


## 一点彩蛋：开发本库的初衷
受限于纸质的考试，许多本科生在学习数值分析的时候常常大把时间投进了理论（其实更多的是投进了背公式hhh），加上chatgpt的出现，上机作业带来的实际训练少之又少。等到真正需要的时候才发现自己半天写不出一行代码，出现不好的现象的时候也不知道怎样解释。

把算法搬上计算机，至少对于工科生来说才是这门课最最基本的地方。而且因为计算机的思维远比人简单，当算法变成代码的时候，其实这个算法就已经被剖析（至少记忆）得非常清楚了，而且这样这门课才能算是真的可以学以致用。

但是debug的时间大家是有目共睹的。学生们学期内的时间都很宝贵，以考试为先是正常的，所以我希望这个库可以帮助更多的学习者从计算机的角度来理解里面的各种算法，即使他们没有时间自己来做计算机的实验，也可以至少读一读、跑一跑代码，看一看真实情境下算法的表现和理论上有什么异同。

很多程序员都写过类似的博客，我在学习的时候也曾经参考过他们的代码，首先要感谢他们为开源社区做出的贡献。但是，他们的代码通常有以下几点问题：
1. 混杂在博文里，完整的算法被拆成了小块，读者通常看了前面忘后面
2. 和主程序混在一起，甚至不封装，读者往往要先费力气找哪些地方才是算法
3. 注释写的比较乱
4. 碍于时间问题，博文可能不完整，经常有没填的坑，体系化欠佳

所以，我的开源库主要就是要解决上面这些问题，给需要的学习者提供一个体系化的、模块解耦清晰的代码资源。喜欢的可以持续关注，或者给个star表示对我的鼓励~

