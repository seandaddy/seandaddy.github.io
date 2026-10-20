---
publishDate: 2026-10-20T12:00:00Z
title: '학급 규모에 대한 고찰'
excerpt: '고정된 교육예산 아래에서 교사 수를 늘릴 것인가, 교사의 질을 높일 것인가? 학급 규모 논쟁을 경제학 모형으로 정리한다.'
category: 'Economics'
tags: ['Education', 'Economics of Education', 'Policy']
author: 'Sangyong'
---

## 경제학 관점에서의 핵심 주장

## 핵심 질문: Class Size vs. Teacher Quality

기본적인 경제학적 구조는 다음과 같다.

> **고정된 교육예산 → 교사 수를 늘릴 것인가, 교사의 질을 높일 것인가?**

교육예산을 B, 교사 수를 $N_T$, 교사 1인당 임금을 $w$라고 하면 매우 단순하게:

$$
B \approx N_{T} w + \text{other education spending}
$$

따라서 예산이 일정하다면,

$$
N_{T} \uparrow \quad \Longleftrightarrow \quad w \downarrow
$$
와 같은 trade-off가 발생할 수 있다.

즉, **학급 규모를 줄이기 위해 교사를 더 많이 채용하면**, 추가적인 교사의 평균적인 질이 낮아질 가능성이 있습니다.

반대로, 임금을 높이는 과정을 통해 높은 능력을 가진 사람을 교직으로 유인하면 교사의 **평균 생산성**(teacher productivity)을 높일 수 있다.

---

# 생산함수 관점에서 보면

학생의 교육성과를 다음과 같이 생각할 수 있다.

$$Y=f(S,Q,X)$$

where

- Y: 학생의 학업성과
- S: 학급 규모(class size)
- Q: 교사의 질(teacher quality)
- X: 학생 및 학교의 기타 특성

일반적인 가설은, $\frac{\partial Y}{\partial S}<0$, 즉, 학급이 작아지면 교사가 학생 개개인에게 더 많은 시간을 사용할 수 있으므로 성과가 증가할 것이라는 논리이다.

하지만 **교사의 반응**(endogenous response)을 추가적으로 고려해야 한다.
$$
Q=Q(N_T,w).
$$
교사 수를 크게 늘리면 교사의 질이 떨어진다는 사실에 기반한다.

$$
N_T\uparrow \Rightarrow Q\downarrow
$$

그러면 실제 효과는 단순히
$$\frac{\partial Y}{\partial S}<0$$
판단할 수 없으며, 학급 규모 감소의 직접효과와 교사 질 변화의 간접효과를 함께 고려해야 합니다.

---


# 식별전략과 인과추론

단순한 상관관계는
$$
ClassSize \leftrightarrow TestScore
$$
를 보여줄 뿐입니다.

하지만 우리가 알고 싶은 것은 $\frac{\partial TestScore}{\partial ClassSize}$라는 **인과효과(causal effect)**입니다.

문제는 작은 학급이 무작위로 결정되지 않는다는 것이다.

예를 들어,

- 부유한 지역 → 작은 학급 + 좋은 교사 + 좋은 학생
- 빈곤한 지역 → 큰 학급 + 상대적으로 열악한 환경

이라면 단순 OLS는
$TestScore_i = \beta ClassSize_i+\epsilon_i$,
에서 $\beta$를 인과효과로 해석할 수 없다.

---

# STAR 프로그램: Randomized Experiment

가장 중요한 연구중 하나는 **Tennessee STAR(Class Size Student/Teacher Achievement Ratio)** 프로그램이다.

핵심은 학생들을 작은 학급과 일반 학급에 **무작위로 배정**(random assignment)했기 때문에 이상적으로:

$$
E[\epsilon_i|Treatment_i]=0
$$
가 성립한다.

그러면

$$
Y_i=\alpha+\beta SmallClass_i+\epsilon_i
$$
에서 $\beta$를 작은 학급의 인과적 효과로 해석할 수 있다.

글에서 인용한 연구에 따르면:
- 대학 진학 확률: **+2.7 percentage points**
- 흑인 학생: 효과가 두 배 이상
- 가장 가난한 1/3의 학교: **+7.3 percentage points**
- 대학 학위 취득: **+1.6 percentage points**
등의 긍정적인 효과가 발견되었다.

경제학적으로 STAR 프로그램의 장점은 **내적 타당성**(internal validity)이 높다는 점이다.

즉,

> "작은 학급 → 학생 성과"

라는 인과관계를 추정하기에 좋은 연구설계로 평가할 수 있겠다.

---

# STAR의 중요한 문제: External Validity

그러나 중요한 비판도 존재한다. 특히, STAR는 **대규모 전국 정책이 아니라 pilot program**이었기 때문에 $ATE_{STAR} \neq ATE_{Nationwide}$일 가능성이 있다.

왜냐하면 정책을 전국적으로 확대하면 필요한 교사의 규모가 급격히 증가하기 때문이다. 소규모 실험에서는 교사들의 질은 유지되면서 그 공급이 충분했을 수 있지만, 전국적으로 학급 규모를 줄이면, 교사의 수요 증가가 교사의 질이 하락하는 현상을 피할 수 없게 된다.

따라서 **STAR의 내부 타당성은 높지만 외적 타당성**(external validity)은 별도의 문제가 된다.

---

# Angrist & Lavy: Maimonides' Rule

이 연구는 경제학적으로 훨씬 흥미로운 **quasi-experiment**이다.

이스라엘에서는 학급 규모를 40명으로 제한했다. 따라서 학생 수가 40을 넘어가면 학급을 나누어야 했다. 따라서 학생 수가 40명 경계선을 넘는 순간 학급 규모가 급격하게 감소합니다.

이를 이용하면 **Regression Discontinuity Design** (RDD)와 유사한 식별전략을 사용할 수 있습니다.

개념적으로:
$$
Y_i=\alpha+\tau SmallClass_i+f(Enrollment_i)+\epsilon_i
$$

$Enrollment_i=40$

왜 이 전략이 좋은가? 40명이라는 cutoff 근처에서는 39, 40, 41명 학교가 학생 구성이나 지역 특성 등에서 극적으로 다를 가능성이 낮다고 가정할 수 있다.

그런데 40명을 넘으면 정책 때문에 학급 수가 갑자기 증가한다. 따라서
$$
Enrollment \rightarrow ClassSize
$$
라는 외생적인 변동을 이용할 수 있다.

1999년 Angrist & Lavy 연구에서는 긍정적인 효과가 발견되었지만 이후 연구인 **Angrist, Lavy, Leder-Luis & Shany (2019)**, "Maimonides' Rule Redux"에서는 2002–2011 자료에서 학급 규모 효과가 사실상 **0**으로 나타났다.

즉,
$$
ATE \approx 0
$$

따라서 경제학적으로 상당히 중요한 질문이 생긴다.

> **왜 동일한 identification strategy를 사용했는데 시간이 지나면서 효과가 사라졌는가?**

글에서는 명확한 원인을 찾지 못했고, 초기 결과가 역사적 특이점일 가능성을 언급했다.

---

# Hoxby (2000)

Hoxby 역시 학급 최대 규모 규정을 이용했다. 핵심 결과는:
$$
\text{Class Size Effect} \approx 0.
$$
즉,
> 학급 규모를 법적으로 제한한다고 해서 반드시 학생 성과가 증가하는 것은 아니다.

라는 결과다.

이 연구는 STAR처럼 실험적 환경에서 나타난 효과가 실제 정책환경에서도 유지되는가?라는 질문에 중요한 비교 자료를 제공한다.

---

# Filges et al. (2018): Meta-analysis

이 연구는 개별 연구가 아니라 **기존 연구 전체를 종합**해 놓았다. 이것이 중요한 이유는 특정 연구 하나의 결과에 의존하지 않기 때문이다.

Filges et al.은 여러 연구를 종합하여 대략적으로:
### Reading

$$
Effect > 0,\ but \  Effect \approx small
$$

### Mathematics

$$
Effect < 0, \ but \  Statistically\ insignificant
$$

즉,

> **작은 학급의 평균적인 효과는 존재하더라도 매우 작다.**

는 것이 핵심이다.

---

# Florida: Scaling-up 문제

Chingos (2012)의 Florida 연구가 이 논리를 한 단계 더 발전시킨다. Florida는 주 전체에서 학급 규모 축소 정책을 시행했다.

이는 STAR와 달리:
$$
Pilot \rightarrow Statewide\ Policy.
$$

결과는:
$$
Effect \approx 0
$$

즉,

> 작은 규모에서 효과가 있었던 정책을 전국 또는 주 전체로 확대했을 때 효과가 사라질 수 있다.

라는 **scale-up problem**을 보여준다.

---

# California: Teacher Quality가 핵심

Jepsen & Rivkin (2009)은 California의 statewide class-size reduction을 분석했다. 이 연구는 작은 학급에서 **아주 작은 긍정적 효과**를 발견했지만, 중요한 조건을 하나 발견했다.

학급 규모를 줄이면서 $\text{Less experienced teachers}$와 $\text{Less certified teachers}$의 비중이 증가했다. 특히 경제적으로 불리하고 소수인종 학생이 많은 학교에서 이것이 작은 학급의 이점을 약화시켰다. 이 결과는 글의 핵심 논리와 정확히 연결된다. $ClassSize\downarrow$의 직접효과는 긍정적일 수 있지만, $TeacherQuality\downarrow$라는 일반균형적 효과가 발생하면 $Net\ Effect\downarrow$ 할 수 있다.

---

# 주요 연구 비교

|연구|국가/지역|방법|주요 식별전략|핵심 결과|
|---|---|---|---|---|
|**STAR**|Tennessee|RCT|Random assignment|작은 학급의 긍정적 효과|
|**Angrist & Lavy (1999)**|Israel|Quasi-experiment|Maimonides' Rule|긍정적 효과|
|**Hoxby (2000)**|U.S.|Quasi-experiment|Class-size rules|효과 약/0|
|**Angrist et al. (2019)**|Israel|Quasi-experiment|Maimonides' Rule Redux|최근 자료에서 효과 0|
|**Filges et al. (2018)**|여러 연구|Meta-analysis|여러 연구 종합|평균 효과 작음|
|**Chingos (2012)**|Florida|Statewide policy|Policy variation|거의 효과 없음|
|**Jepsen & Rivkin (2009)**|California|Statewide policy|Policy variation|작은 긍정적 효과 + 교사 질 문제|

이 표에서 중요한 것은 **연구 결과가 모두 동일하지 않다는 것**이다. 따라서 “작은 학급은 효과가 있다/없다”로 단순화하기보다는 **어떤 조건에서 효과가 발생하는가**를 보는 것이 경제학적으로 더 적절해 보인다.

---

# 가장 중요한 식별 문제: Partial Equilibrium vs. General Equilibrium

STAR와 같은 연구는 상당히 단순화하면:

ClassSize↓→StudentOutcome↑ClassSize\downarrow \rightarrow StudentOutcome\uparrow

를 측정합니다.

하지만 정책을 전체 시스템에 적용하면:

$ClassSize\downarrow \rightarrow TeacherDemand\uparrow \rightarrow$
$TeacherWage\uparrow \rightarrow TeacherQuality\downarrow \rightarrow StudentOutcome$

이라는 **general-equilibrium effect**가 나타난다.

즉, 작은 학급의 직접적인 생산성 효과만 측정해서는 정책 전체의 사회적 효과를 평가하기 어렵다.

---

# 정책의 핵심은 "교사를 몇 명 고용할 것인가"가 아니다

이 글의 경제학적 메시지를 조금 더 일반화하면:

> **교육정책의 목표함수는 교사의 수가 아니라 학생의 학습성과이다.**

따라서 정책변수는 $N_{teachers}$ 하나가 아니라, $(N_{teachers},\ TeacherQuality,\ TeacherWage,\ ClassSize)$
의 **joint optimization problem**으로 보는 것이 적절하다.

예를 들어 교육예산 BB가 주어졌다면:
$$\max_{N,Q,S} \quad StudentAchievement(N,Q,S)$$

subject to
$$B \geq Wage(Q)N + OtherCosts$$

와 같은 문제로 생각할 수 있다.

이 관점에서는 단순히

> "class size를 줄이자"

가 아니라,

> **"동일한 교육예산으로 학생의 기대 학업성과를 최대화하려면 자원을 어떻게 배분해야 하는가?"**

가 진짜 경제학적 질문이 되어야 한다.

---

# 정책적 함의

글에서 도출되는 정책적 함의는 크게 네 가지로 요약할 수 있다.

### (1) 학급 규모 축소 자체를 목표로 삼아서는 안 된다

$ClassSize\downarrow$가 정책목표가 아니라, $StudentOutcome\uparrow$가 최종 목표여야 한다.
### (2) 교사 공급의 질적 제약을 고려해야 한다

좋은 교사가 무한히 공급되지 않는다면:
$TeacherDemand\uparrow$가 반드시 $TeacherQuality = constant$를 의미하지 않는다. 오히려 $TeacherQuality\downarrow$가 발생할 수 있다.

### (3) 교사 임금과 인센티브도 중요한 정책변수다

교사 수를 늘리는 대신:
$TeacherWage\uparrow$를 통해 우수한 인력을 교직으로 유인하는 전략이 있을 수 있다. 이는 노동경제학적으로 **selection effect**를 발생시킬 수 있다. 즉, 높은 임금 → 더 높은 능력의 근로자가 교직을 선택할 가능성이다.

### (4) 특히 disadvantaged students에게 중요하다

이 글은 단순히 교육비를 줄이자는 주장이 아니다.
오히려:

> **저소득·취약계층 학생에게 더 많은 교육자원을 투입해야 한다.**

논쟁은 **얼마나 쓸 것인가**보다 **어떻게 쓸 것인가**에 가깝다.

---

# 요약

전체 논리를 그림처럼 압축하면 다음과 같다.

```
              Education Budget
                     │
          ┌──────────┴──────────┐
          ↓                     ↓
   More Teachers          Higher Teacher Pay
          │                     │
          ↓                     ↓
   Smaller Classes       Better Teacher Selection
          │                     │
          ↓                     ↓
   Direct Learning        Teacher Quality ↑
       Benefit                  │
          │                     │
          └──────────┬──────────┘
                     ↓
              Student Outcomes
```

그리고 중요한 **general-equilibrium channel**은:

```
Class-size reduction
        ↓
Teacher demand ↑
        ↓
 ┌──────┴───────┐
 ↓              ↓
Wages ↑      Teacher quality ↓
 ↓              ↓
Selection ↑     Benefit offset
```

따라서 최종 효과는 단순히

$$\boxed{\text{Smaller Classes} \Rightarrow \text{Better Education}}$$

가 아니라,

$$\boxed{ \text{Net Effect} = \text{Class-Size Benefit} + \text{Teacher-Quality Effect} + \text{General-Equilibrium Effects} }$$

로 이해해야 한다.

**특히 경제학 연구 관점에서는 이 마지막 식이 가장 중요하다.** STAR 같은 RCT가 보여주는 것은 작은 학급의 **국소적/단기적 인과효과**이고, statewide policy 연구가 제기하는 문제는 그 효과가 **교사 노동시장과 예산 제약을 고려한 대규모 정책에서도 유지되는가**이다. 이 차이가 **internal validity와 external validity, partial equilibrium과 general equilibrium의 차이**로 연결된다.