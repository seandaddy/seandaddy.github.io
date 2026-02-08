---
layout: post
title: Logistic Regression
output: github_document
---

## Odds ratio

An odds ratio is a measure of relationship between a certain factor A
and a second factor B in a population. Specifically, it shows you how
the presence of factor A has an effect on the presence of factor B. It
is also used to figure out whether a particular exposure is a risk
factor for a particular outcome, and to compare the various risk factors
for that outcome.

## Logistic Regression

The logistic regression has a formula as follows:

$ log \frac{p}{1-p} = X \beta. $

So you need to transformation to get the estimated odds ratio by taking
an exponential function to the coefficients.

## Example 1

The data comes from “Radelet, M. L. Racial Characteristics and the
Imposition of the Death Penalty. American Sociological Review, v46 n6
p918-27 Dec 1981”

``` r
death=read.csv("data/death_penalty.csv")
def=xtabs(count ~defendant+death, data=death)
chisq.test(def)
```

    ##
    ##  Pearson's Chi-squared test with Yates' continuity correction
    ##
    ## data:  def
    ## X-squared = 0.086343, df = 1, p-value = 0.7689

``` r
vic=xtabs(count ~victim+death, data=death)
chisq.test(vic)
```

    ##
    ##  Pearson's Chi-squared test with Yates' continuity correction
    ##
    ## data:  vic
    ## X-squared = 4.7678, df = 1, p-value = 0.029

We can see the results above, the dependent's race does't have a significant impact on death sentence but the victim's race does.

``` r
out1=glm(death~victim*defendant,weights=count,family=binomial,data=death)
summary(out1)
```

    ##
    ## Call:
    ## glm(formula = death ~ victim * defendant, family = binomial,
    ##     data = death, weights = count)
    ##
    ## Deviance Residuals:
    ##       1        2        3        4        5        6        7        8  
    ##  8.8751  -5.9584   6.1964  -4.4673   0.0000  -0.0009   5.8409  -3.4123  
    ##
    ## Coefficients:
    ##                             Estimate Std. Error z value Pr(>|z|)    
    ## (Intercept)                  -2.7830     0.4207  -6.615 3.71e-11 ***
    ## victimWhite                   1.2296     0.5358   2.295   0.0217 *  
    ## defendantWhite              -14.2430  1006.6075  -0.014   0.9887    
    ## victimWhite:defendantWhite   13.8579  1006.6076   0.014   0.9890    
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ##
    ## (Dispersion parameter for binomial family taken to be 1)
    ##
    ##     Null deviance: 226.51  on 6  degrees of freedom
    ## Residual deviance: 218.38  on 3  degrees of freedom
    ## AIC: 226.38
    ##
    ## Number of Fisher Scoring iterations: 14

``` r
out2=glm(death~victim,weights=count,family=binomial,data=death)
summary(out2)
```

    ##
    ## Call:
    ## glm(formula = death ~ victim, family = binomial, data = death,
    ##     weights = count)
    ##
    ## Deviance Residuals:
    ##       1        2        3        4        5        6        7        8  
    ##  8.6407  -6.3146   6.5746  -3.9634   0.0000  -0.9955   5.9263  -3.2683  
    ##
    ## Coefficients:
    ##             Estimate Std. Error z value Pr(>|z|)    
    ## (Intercept)  -2.8717     0.4196  -6.843 7.75e-12 ***
    ## victimWhite   1.0579     0.4635   2.282   0.0225 *  
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ##
    ## (Dispersion parameter for binomial family taken to be 1)
    ##
    ##     Null deviance: 226.51  on 6  degrees of freedom
    ## Residual deviance: 220.26  on 5  degrees of freedom
    ## AIC: 224.26
    ##
    ## Number of Fisher Scoring iterations: 5

``` r
anova(out2,out1,test="Chisq")
```

    ## Analysis of Deviance Table
    ##
    ## Model 1: death ~ victim
    ## Model 2: death ~ victim * defendant
    ##   Resid. Df Resid. Dev Df Deviance Pr(>Chi)
    ## 1         5     220.26                     
    ## 2         3     218.38  2   1.8819   0.3903

ANOVA result shows us that we don't have any strong evidence to move the first model that contains dependent's race.

``` r
exp(coef(out2)["victimWhite"])
```

    ## victimWhite
    ##    2.880435

As a sum, we can conclude that if the victim is white, the rate of the death sentence is 2.88 times higher.

## Example 2

This is the data about the birth low birth weight.

``` r
library(MASS)
model=glm(low ~ lwt+factor(race)+smoke+ht+ui,data=birthwt, family=binomial)
summary(model)
```

    ##
    ## Call:
    ## glm(formula = low ~ lwt + factor(race) + smoke + ht + ui, family = binomial,
    ##     data = birthwt)
    ##
    ## Deviance Residuals:
    ##     Min       1Q   Median       3Q      Max  
    ## -1.7396  -0.8322  -0.5359   0.9873   2.1692  
    ##
    ## Coefficients:
    ##                Estimate Std. Error z value Pr(>|z|)   
    ## (Intercept)    0.056276   0.937853   0.060  0.95215   
    ## lwt           -0.016732   0.006803  -2.459  0.01392 *
    ## factor(race)2  1.324562   0.521464   2.540  0.01108 *
    ## factor(race)3  0.926197   0.430386   2.152  0.03140 *
    ## smoke          1.035831   0.392558   2.639  0.00832 **
    ## ht             1.871416   0.690902   2.709  0.00676 **
    ## ui             0.904974   0.447553   2.022  0.04317 *
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ##
    ## (Dispersion parameter for binomial family taken to be 1)
    ##
    ##     Null deviance: 234.67  on 188  degrees of freedom
    ## Residual deviance: 204.22  on 182  degrees of freedom
    ## AIC: 218.22
    ##
    ## Number of Fisher Scoring iterations: 4

``` r
exp(coef(model))
```

    ##   (Intercept)           lwt factor(race)2 factor(race)3         smoke
    ##     1.0578897     0.9834068     3.7605373     2.5248886     2.8174471
    ##            ht            ui
    ##     6.4974921     2.4718677

As the results suggest, Mother's weight has only negative impact on low birth rate. The black have 3.76 times, other races have 2.52 times, smoking mothers have 2.81 times, the mothers who have hypertension have 6.50 times and the ones who have uterine irritability have 2.47 times more odds to have low birth weight as their babies.
