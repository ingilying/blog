---
title: 函数的凹凸性
published: 2025-12-01
description: 关于函数凹凸性的定义和定理
tags: [Notes, Math]
category: Math
draft: false
---

# 函数的凹凸性
在数学分析中，函数的凹凸性描述了函数图像的形状特征。一个函数可以是凸函数、凹函数，或者在某些区间内既不是凸也不是凹。

## 定义

- **凸函数**：$f(x)$ 在区间 $I$ 上连续，存在$f''(x)$,且对于$\forall x_1, x_2 \in I$ ，有：
  $$
  f(\frac{x_1 + x_2}{2}) \geq \frac{f(x_1) + f(x_2)}{2}
  $$
  函数图像在该区间上向上弯曲。

- **凹函数**：$f(x)$ 在区间 $I$ 上连续，存在$f''(x)$,且对于$\forall x_1, x_2 \in I$ ，有：
  $$
  f(\frac{x_1 + x_2}{2}) \leq \frac{f(x_1) + f(x_2)}{2}
  $$
  函数图像在该区间上向下弯曲。

## 判定定理
1. 如果$f''(x) < 0$，则$f(x)$在该区间上是凸函数。
2. 如果$f''(x) > 0$，则$f(x)$在该区间上是凹函数。

## 证明
1. 如果$f''(x) < 0$，则$f(x)$在该区间上是凸函数。
证明:
设$x_1, x_2 \in I$, $x_1 < x_2$, $x_0 = \frac{x_1 + x_2}{2}$ 根据泰勒展开式，有：
$$
\begin{aligned}
f(x) = f(x_0) + f'(x_0) \cdot f(x-x_0) + f''(\cos)  \\
\because x_1 \ne x_2
\therefore f(x_0) = f(x_)
\end{aligned}
$$  
