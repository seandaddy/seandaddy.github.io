---
publishDate: 2026-10-20T12:00:00Z
title: 'Shephard’s Lemma and Roy’s Identity'
excerpt: 'Two ways to understand consumer demand: utility maximization and expenditure minimization, and how Shephard’s Lemma and Roy’s Identity connect them.'
category: 'Economics'
tags: ['Microeconomics', 'Consumer Theory', 'Duality']
author: 'Sangyong'
---

## 1. The big picture: Two ways to understand consumer demand

Imagine a student deciding how much coffee and how many sandwiches to buy on campus. An economist wants to predict how the student responds when coffee becomes more expensive.

There are two complementary approaches.

Approach A: Utility maximization

The student has a fixed budget and chooses the best affordable combination of coffee and sandwiches.
 $$\max_{x_1,x_2} U(x_1,x_2)\quad\text{s.t.}\quad p_1x_1+p_2x_2\leq m$$

Result: the Marshallian (ordinary) demand function.

Approach B: Expenditure minimization

The student wants to reach a particular satisfaction level and chooses the least expensive combination of coffee and sandwiches that achieves it.

$$\min_{x_1,x_2} p_1x_1+p_2x_2\quad\text{s.t.}\quad U(x_1,x_2)\geq\bar U$$

Result: the Hicksian (compensated) demand function.

The two identities recover demand from two different functions:

- Shephard’s lemma: Differentiate the expenditure function to obtain Hicksian demand.
- Roy’s identity: Differentiate the indirect utility function to obtain Marshallian demand.

This is useful because economists can often derive or estimate these aggregate functions more easily than solving for every individual demand function directly.

## 2. The essential concepts students need to know

Before introducing the two identities, define four functions clearly.

| Function                           | Definition                                                                   | Economic question                                         |
| ---------------------------------- | ---------------------------------------------------------------------------- | --------------------------------------------------------- |
| Marshallian demand $x_i(p,m)$      | Quantity chosen to maximize utility at prices $p$ and income $m$         | What will I buy with my budget?                           |
| Hicksian demand $h_i(p,\bar u)$    | Quantity chosen to minimize spending while achieving target utility $\bar u$ | What is the cheapest way to maintain my satisfaction?     |
| Indirect utility $v(p,m)$          | Maximum utility attainable at prices $p$ and income $m$                  | How well off can I be with my budget?                     |
| Expenditure function $e(p,\bar u)$ | Minimum spending required to achieve utility $\bar u$ at prices $p$        | How much money do I need to reach my target satisfaction? |

These functions are dual representations of the same underlying consumer preferences.

A useful classroom analogy is planning a vacation:

- Marshallian demand asks what vacation you choose given your budget.
- Indirect utility measures the best vacation experience attainable with that budget.
- Hicksian demand asks how to obtain a specified level of vacation enjoyment at minimum cost.
- The expenditure function tells you the minimum budget needed to achieve that experience.

With these concepts in place, we can introduce each identity.

## 3. Shephard’s lemma: How much does a price increase raise the cost of living?

### 3.1 Formal definition

Shephard’s lemma states that, under appropriate regularity conditions, the partial derivative of the expenditure function with respect to the price of good $i$ equals the Hicksian demand for that good:

$$\boxed{ h_i(p,\bar u)= \frac{\partial e(p,\bar u)}{\partial p_i} }$$

Here:

- $e(p,\bar u)$ is the minimum expenditure needed to reach target utility $\bar u$.
- $p_i$ is the price of good $i$.
- $h_i(p,\bar u)$ is the compensated quantity demanded of good $i$.

The key intuition is that the marginal increase in the minimum cost of achieving a given standard of living equals the amount of the good consumed in the cost-minimizing bundle.

### 3.2 A real-life example: A student's cost of living

Suppose a student consumes two goods:

- Coffee, $x$
- Sandwiches, $y$

The student's preferences are represented by the utility function

$$ U(x,y)=\sqrt{xy}. $$

Suppose the student wants to maintain a target utility level $\bar u$. The student can change the consumption mix when prices change, but must remain on the same indifference curve.

For this utility function, the expenditure function is

$$ e(p_x,p_y,\bar u) =2\bar u\sqrt{p_xp_y}. $$

Applying Shephard’s lemma gives the compensated demand for coffee:

$$ \begin{aligned} h_x(p_x,p_y,\bar u) &=\frac{\partial e}{\partial p_x}\\ &=\boxed{\bar u\sqrt{\frac{p_y}{p_x}}}. \end{aligned} $$

Notice that we have obtained a demand function by differentiating the expenditure function. We did not need to solve the cost-minimization problem again.

### 3.3 Numerical example for the classroom

Suppose:

- Coffee costs $p_x=\$4$ per unit.
- A sandwich costs $p_y=\$8$ per unit.
- The student initially buys 5 units of coffee and 2.5 units of sandwiches.

The initial utility level is

$$ \bar u=\sqrt{5(2.5)}=\sqrt{12.5}. $$

The student's initial expenditure is

$$ e=2\sqrt{12.5}\sqrt{4(8)}=\$40. $$

Now suppose the price of coffee rises from $4 to $8. What happens if the student wants to maintain the original utility level?

Using Shephard’s lemma, the new compensated coffee demand is

$$ \begin{aligned} h_x &=\sqrt{12.5}\sqrt{\frac{8}{8}}\\ &=\sqrt{12.5}\\ &\approx 3.54. \end{aligned} $$

> *What students should notice*
> 
> Before price increase
> 5 units
> Coffee consumption

> After price increase
> 3.54 units
> Compensated coffee demand

The student buys less coffee and adjusts the consumption mix to maintain the same utility level. The minimum expenditure needed to maintain that utility rises from \$40 to approximately \$56.57.

Interpretation: The student needs an additional $16.57 to maintain the original standard of living after the coffee price increase.

The expenditure function at the new prices is

$$ e(8,8,\sqrt{12.5}) =2\sqrt{12.5}\sqrt{64} \approx \$56.57. $$

This is a useful illustration of how economists measure the cost of a price increase while holding the consumer's welfare constant.

### 3.4 Why does the derivative give demand?

The intuition comes from a small price change. If the price of coffee rises by a small amount $\Delta p_x$, the approximate increase in the minimum expenditure needed to maintain utility is

$$ \Delta e\approx h_x\,\Delta p_x. $$

If the student needs 5 units of coffee in the cost-minimizing bundle, then a $0.10 increase in the coffee price raises the minimum cost by approximately

$$ \Delta e\approx 5(0.10)=\$0.50. $$

The derivative measures this marginal cost, holding the target utility fixed.

### 3.5 Real-world applications



1. Measuring inflation and cost-of-living changes
![Supermarket food prices surge with pasta up by 50 per cent in last year, ONS data shows | The Independent](https://images.openai.com/static-rsc-4/Kb1ggGr64CbU331RkJXRAg5musaiWKDzSecfr1l_IgXzxqlbu68izlBYmCzWs0Gpdyj-jZwwkRDzdKZ7AxLunWSPMIt1b_2zeBTSi0p7G0NVSVaZst26HzPnqzOD1xiOZPLlfNuq6NN89zQ2S9wFGg1SKY14iTKtFRLjwihLRXw?purpose=inline)
An economist can ask how much additional income a household needs to preserve its standard of living when food, housing, or transportation prices rise.

2. Evaluating a public transportation fare increase
![Tot sobre “la demanda a les xarxes de Metro i Bus” en el TMB Day | GenTMB](https://images.openai.com/static-rsc-4/73DZ1uww2h7dRLn6CruNaPdDFGLWdYitXU8qv7BBsl0pP4LZltaU0LHS6uDWgrhs0M_HUbG2iDcL7J2DXCqMo-SIv4MsJpumMTiz0mgdHsKB-WsZ4f01ZNFkQju_Jz59TrZ-vcuaHXGrqzKf-Ujnzzm--E8qtzdTr5wJ3qi65Es?purpose=inline)
If bus fares rise, Hicksian demand helps analyze how riders would adjust their travel choices while keeping their welfare at a specified level.

3. Evaluating energy-price shocks
![Woman near heater with smartphone and bills, energy crisis concept](https://images.openai.com/static-rsc-4/gtrnem-d__PNo8k_LWSwo56wLnxipQWCMTgzMqyjdJSZpSe1o0_XHuPWpngZaEW40JaLcSjfTiyN77PLoA7-67bD0j2ix0wMV9WpNGuuT6VTPY635RLI0khXmq0zf55Ftt0ibBMjGbtLoQo2iOlv67jxgxmYx50SmMDhNM0O_N74B-I4e8HU0qeEz2jMix7o?purpose=inline)
Economists can calculate the extra expenditure households would require to maintain a given welfare level when electricity or heating prices rise.

## 4. Roy’s identity: Recovering consumer demand from indirect utility

### 4.1 Formal definition

Roy’s identity states that Marshallian demand for good $i$ can be recovered from the indirect utility function:

$$ \boxed{ x_i(p,m)= -\frac{\dfrac{\partial v(p,m)}{\partial p_i}} {\dfrac{\partial v(p,m)}{\partial m}} } $$

where:

- $v(p,m)$ is the maximum attainable utility at prices $p$ and income $m$.
- $\partial v/\partial p_i$ measures how maximum utility changes with the price of good $i$, holding income fixed.
- $\partial v/\partial m$ measures how maximum utility changes with income, holding prices fixed.
- $x_i(p,m)$ is Marshallian demand.

The negative sign appears because an increase in a good's price generally reduces attainable utility, whereas an increase in income generally raises it.

### 4.2 A real-life example: A student with a fixed food budget

Return to the same student who consumes coffee and sandwiches:

$$ U(x,y)=\sqrt{xy}. $$

Now suppose the student has a fixed food budget of $m$ dollars and chooses the bundle that maximizes utility.

The utility-maximization problem is

$$ \max_{x,y}\sqrt{xy} \quad\text{subject to}\quad p_xx+p_yy\leq m. $$

Solving this standard Cobb–Douglas problem gives the indirect utility function

$$ \boxed{ v(p_x,p_y,m)= \frac{m}{2\sqrt{p_xp_y}} }. $$

This function tells us the highest utility the student can attain for any combination of prices and income.

Differentiate with respect to the coffee price:

$$ \frac{\partial v}{\partial p_x} =-\frac{m}{4p_x^{3/2}p_y^{1/2}}. $$

Differentiate with respect to income:

$$ \frac{\partial v}{\partial m} =\frac{1}{2\sqrt{p_xp_y}}. $$

Apply Roy’s identity:

$$ \begin{aligned} x(p_x,p_y,m) &=-\frac{\partial v/\partial p_x} {\partial v/\partial m}\$$5pt] &=\boxed{\frac{m}{2p_x}}. \end{aligned} $$

We have recovered the ordinary demand function for coffee directly from indirect utility.

### 4.3 Numerical example: What happens when coffee becomes more expensive?

Assume the student has $40 to spend, and coffee initially costs $4.

Roy’s identity implies that the student buys

$$ x=\frac{40}{2(4)}=5 $$

units of coffee.

Now the coffee price doubles to $8, but the student's budget remains $40.

$$ x=\frac{40}{2(8)}=2.5. $$

> *Ordinary demand response*
> 
> Coffee at \$4
> 5 units
> Budget: \$40

> Coffee at \$8
> 2.5 units
> Budget: \$40

The student cannot afford to maintain the original utility level. Coffee consumption falls by half because its price doubles while income stays fixed.

### 4.4 The economic meaning of Roy’s identity

Roy’s identity compares two marginal effects measured in utility units:

- The utility loss associated with a higher coffee price.
- The utility gain associated with an additional dollar of income.

Their ratio tells us how many units of coffee the consumer would demand at the optimum.

For the student, the price of coffee changes the utility attainable with the budget. Roy’s identity translates that utility effect back into a quantity demanded.

### 4.5 Real-world applications

1. Predicting shopping behavior
![Rising grocery costs push Americans to rethink how they shop](https://images.openai.com/static-rsc-4/t_SmTsXomeBTpGAUyrw1KiLNLMBTnRAgOszA5XhLXDbQy21e0ujfVOTqUHUl0_iW_uTIv8PTH2NIey2NH7GHmNTGMqFi-7TfU_nxQ9CVakLigviCZ1vNZYgqCZUwdUf9AWGwobWF3hqRJ5GShRcqoPTsbg4ZI61dWu6qb-nfw8E?purpose=inline)
If an economist has an estimated indirect utility function, Roy’s identity can recover predicted demand for groceries or other consumer goods.

2. Studying gasoline taxes
![Trump impulsa etanol para combatir alza en precios de combustibles.](https://images.openai.com/static-rsc-4/rTkSsuyaSu-O8homVwx_kzlWNgce8RRb7E4SME_1z_WYWOShD3xxT3CNzriRiVem4v9rUECzuPkJ1pnT683ATbC8XdjkVDQZQ1zfFT8dA2Saz-Ds9EasKunBj_Yyx48NsUAuKj5cFYrBxbWfCpn4kRM94FTHMDqsiTBDsFKE3O8?purpose=inline)
An economist can use a model of attainable utility to derive demand responses to fuel prices while accounting for consumers' income.

3. Evaluating income-support policies
![woman, top view, calculates household expenses, managing the family budget and bills on a table](https://images.openai.com/static-rsc-4/ymdO_Jj2jZSV4Hr2IxCH45dPeJxQWeK_QgIYzHRQVmerg7qSjx6vyEPEvuJVww_O-CCcQdyFSOKaoitm92TlBJ-aX5dSkzZmlZ9ww5RPGEvDXJZFQBwHMEfDCzCNbAZUIOmfW1kvskcpjZvB2OA1SUrBfm7qTwaRPOj1NgnMS7D0i2HVL-lwOnPYdCsAvbud?purpose=inline)
Indirect utility models help economists study how cash transfers or price changes affect household welfare and consumption choices.

## 5. The key difference: Shephard’s lemma versus Roy’s identity

This comparison is probably the most important slide in the lecture.

|Feature|Shephard’s lemma|Roy’s identity|
|---|---|---|
|Starting function|Expenditure $e(p,\bar u)$|Indirect utility $v(p,m)$|
|Consumer's problem|Minimize expenditure|Maximize utility|
|Demand recovered|Hicksian demand $h_i$|Marshallian demand $x_i$|
|Mathematical operation|One partial derivative|Ratio of two partial derivatives, with a minus sign|
|What is held fixed?|Utility|Income|
|Main economic question|What is the marginal cost of maintaining welfare?|What quantity does the consumer choose with a given budget?|

### Why are the two demands different?

Return to the coffee example. Coffee doubles in price, from $4 to $8.

### Compare the two predictions

__Roy's identity — fixed income__
2.50 units
The student still has only \$40 and accepts a lower utility level.

__Shephard's lemma — fixed utility__
3.54 units
The student adjusts consumption to preserve the original utility level and receives whatever additional budget is needed.

The difference is not a contradiction. The two identities answer different economic questions.

- Marshallian demand includes both substitution and income effects of the price change.
- Hicksian demand isolates the substitution response by compensating the consumer to keep utility constant.

For this example, Hicksian demand is higher than Marshallian demand at the new coffee price because the compensated student has enough additional money to maintain the original utility level.

## 6. A deeper connection: The envelope theorem

For students who have studied constrained optimization, you can explain why these identities work without requiring them to memorize the formulas.

### Shephard’s lemma

Consider the expenditure-minimization problem:

$$ e(p,\bar u)= \min_x\{p\cdot x: U(x)\geq\bar u\}. $$

Let $h(p,\bar u)$ be the optimal consumption bundle. By the envelope theorem, when the price $p_i$ changes, the derivative of the minimized expenditure with respect to that price is the optimal quantity of good $i$:

$$ \frac{\partial e}{\partial p_i}=h_i(p,\bar u). $$

The envelope theorem lets us differentiate the optimized value function without differentiating the entire optimal choice function.

### Roy’s identity

For utility maximization, the indirect utility function is

$$
v(p,m)=\max_x\{U(x):p\cdot x\leq m\}.
$$

Let $$\lambda$$ be the marginal utility of income at the optimum. The envelope theorem gives

$$\frac{\partial v}{\partial p_i}=-\lambda x_i, \qquad \frac{\partial v}{\partial m}=\lambda.$$

Dividing these derivatives eliminates the marginal utility of income:
 $$-\frac{\partial v/\partial p_i} {\partial v/\partial m}=x_i.$$

This is Roy’s identity.
The teaching insight is that both identities are applications of the envelope theorem to different optimization problems.

## 7. A short classroom exercise

Use this as a five-minute discussion or an exit ticket.

Question 1

An economist wants to calculate how much additional money a household needs to maintain its current standard of living after rent increases. Which identity is most directly relevant?

Roy’s identity

Shephard’s lemma

The law of demand alone

Question 2

An economist has estimated an indirect utility function and wants to recover the consumer’s ordinary demand for gasoline. Which identity should be used?

Shephard’s lemma

Roy’s identity

The expenditure function alone

Check answers

## 8. Suggested lecture structure

For a 50–60 minute undergraduate class, I recommend this sequence:

1. 5 minutes — Motivation: Start with the coffee-and-sandwich example and ask how a price increase changes consumer behavior.
2. 10 minutes — Core definitions: Introduce Marshallian demand, Hicksian demand, indirect utility, and the expenditure function.
3. 15 minutes — Shephard’s lemma: Derive the result and discuss cost-of-living measurement.
4. 15 minutes — Roy’s identity: Derive the result and show how ordinary demand is recovered.
5. 10 minutes — Comparison and applications: Discuss compensated versus uncompensated demand, followed by the classroom exercise.

## 9. Final takeaway for students

The two identities reveal a powerful principle in consumer theory:

- Shephard’s lemma tells us how minimum expenditure responds to prices, revealing compensated demand.
- Roy’s identity tells us how maximum attainable utility responds to prices and income, revealing ordinary demand.

Both allow economists to recover behavioral information from optimized value functions rather than having to solve the original choice problem repeatedly.

The broader lesson is that optimization, duality, and the envelope theorem provide tools for translating economic theory into practical measures of consumer behavior and welfare.