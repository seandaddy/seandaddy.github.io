---
publishDate: 2025-03-17T00:00:00Z
title: "Sample Variance"
excerpt: "Why do we divide by n-1 when calculating the sample standard deviation?"
category: "Economics"
tags: ["economics"]
---

Why do we divide by n-1 when calculating the sample standard deviation?

For a shorter proof, here are a few things we need to know:
$x_{1}, x_{2},x_{3}, \cdots, x_{n}$ are independent observations from a population with mean $\mu$ and variance $\sigma^{2}$.
$E[x_{i}]=\mu, V(x_{i})=\sigma^2.$
$E[x_{i}^2]=\sigma^{2}+\mu^{2}.$
$V(X)=E[X^{2}]-E[X]^{2}$
$E \left[ \bar{X}^{2} \right] =\mu^{2} + \frac{\sigma^{2}}{n}$

The sample variance is defined as follows:
$$S^{2}=\frac{1}{n-1}\sum_{i=1}^{n}(x_{i}-\bar{X})^2,$$
where $\bar{X}$ is the sample mean.

On the right hand side of equation,

$$
\sum_{i=1}^{n}(x_{i}-\bar{X})^{2}= x_{1}^{2} + x_{2}^{2} + x_{3}^{2} + \cdots + x_{n-1}^{2} + x_{n}^{2} -2 \bar{X}(x_{1} + x_{2} + x_{3} + \cdots + x_{n-1} + x_{n}) + n \bar{X}^{2} .
$$

If we take the expectation value on the right hand side,

$$
\begin{align}
E \left[ \sum_{i=1}^{n}(x_{i}-\bar{X})^{2} \right] =&E\left[ x_{1}^{2} \right] + E\left[ x_{2}^{2} \right] + E\left[ x_{3}^{2} \right] + \cdots + E\left[ x_{n}^{2} \right]  -2 E \left[ \bar{X}\cdot n\bar{X} \right] + nE \left[ \bar{X}^{2} \right]\\
= & E\left[ x_{1}^{2} \right] + E\left[ x_{2}^{2} \right] + E\left[ x_{3}^{2} \right] + \cdots + E\left[ x_{n}^{2} \right] - n E \left[ \bar{X}^{2} \right] \\ \\
= & n(\mu^{2}+ \sigma^{2}) - n(\mu^{2} + \frac{\sigma^{2}}{n}) \\  \\
= & (n-1)\sigma^{2}.
\end{align}
$$

$$
\therefore \sigma^{2} =  \frac{1}{n-1}E \left[ \sum_{i=1}^{n}(x_{i}-\bar{X})^{2} \right] = E[S^{2}].
$$
