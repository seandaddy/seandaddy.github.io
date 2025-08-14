---
layout: post
title: Comparative Statics
---

Comparative statics is an analytical method used in economics to determine how a change in one exogenous variable affects the equilibrium values of endogenous variables in a model. Essentially, it's about comparing two different static equilibrium states—one before the change and one after—without considering the transition process. This approach is fundamental to understanding how economic systems respond to external shocks or policy changes.

---

### Profit Maximization with a Tax

Let's illustrate comparative statics using the classic example of a firm maximizing its profit. The firm's profit ($\pi$) is the difference between its total revenue ($R(x)$) and its total cost ($C(x)$), where x is the quantity produced. Now, let's introduce a **specific tax** ($t$) per unit of output. The tax is an external factor, or an exogenous variable, that the firm cannot control. The firm's new profit function is:

$\pi(x,t)=R(x)−C(x)−tx$

To find the profit-maximizing level of output, we take the first-order condition (FOC) by differentiating the profit function with respect to x and setting it to zero:

$\frac{d\pi}{dx}​=R'(x)−C'(x)−t=0$

This gives us the familiar condition that **marginal revenue** ($R'(x)$) must equal **marginal cost** ($C'(x)$) plus the tax:

$R'(x)=C'(x)+t$

This equation defines the optimal output level, x∗(t), as a function of the tax rate t. To ensure this is a maximum, we check the second-order condition (SOC):

$\frac{d^2\pi}{dx^2}​=R''(x)−C''(x)<0$

This condition implies that the marginal revenue curve must be flatter than the marginal cost curve at the optimal point.

---

### Applying Comparative Statics

Our goal is to understand how the profit-maximizing output $x^∗$ changes when the tax rate t changes. This is what comparative statics is all about. We need to find the sign of $\frac{dx^*}{dt}$​.

To do this, we implicitly differentiate our FOC with respect to $t$. The FOC is an identity that holds for all values of $t$ at the optimal output level, so we can write it as:

$R'(x^∗(t))−C'(x^∗(t))−t=0$

Differentiating this with respect to t using the chain rule gives us:

$R''(x^∗(t))\frac{dx^*}{dt}​−C''(x^∗(t))\frac{dx^*}{dt}−1=0$

Now, we can solve for $\frac{dx^*}{dt}$​:

$[R''(x^∗(t))−C''(x^∗(t))]\frac{dx^*}{dt}​=1$

$\frac{dx^{*}}{dt}​=\frac{1}{R''(x^∗(t))−C''(x^∗(t))}$

From our second-order condition, we know that the denominator, $R''(x)−C''(x)$, is negative. Therefore, the entire expression is negative:

$\frac{dx^*}{dt}​<0$

This is the key result from our comparative statics analysis. It tells us that as the tax rate ($t$) increases, the profit-maximizing level of output ($x^∗$) decreases. The firm responds to the new tax by reducing its production to a new, lower equilibrium level. This result is a fundamental prediction of microeconomic theory and provides a clear example of how comparative statics can be used to derive testable hypotheses about economic behavior.
