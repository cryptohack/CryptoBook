---
description: 'Author: Zademn'
---

# Division and Greatest common divisor

## Introduction

Two of the skills a cryptographer must master are:

1. Knowing his way and being comfortable to work with numbers.
2. Understanding and manipulating abstract objects.

This chapter of f**undamentals** proposes to prepare you for understanding the basics of **number theory** and **abstract algebra** .We will start with the most basic concepts such as division and build up knowledge until you, _future cryptographer,_ are able to follow and understand the proofs and intricacies of the cryptosystems that make our everyday life secure.

We will provide examples and snippets of code and be sure to play with them. If math is not your strongest suit, we **highly** suggest to pause and ponder for each concept and take it slow.

For the math-savy people we cover advanced topics in specific chapters on the subjects of number theory and group theory.

_So what are we waiting for? Let's jump right in!_

## Division

Let $$\mathbb{Z} = \{\dots , -1, 0, 1, 2, 3 \dots \}$$be the set denoting the integers.

**Definition - Divisibility**

> For $$a, b, \in \mathbb{Z} $$we say that $$a$$divides $$b$$if there is some $$k \in \mathbb{Z}$$such that $$a \cdot k = b$$
>
> _Notation:_ $$a | b$$

**Example**

For $$a = 2, b = 6$$ we have $$2 | 6$$ because we can find  $$k = 3$$such that $$6 = 2 \cdot 3$$.

**Properties**

* $$a | a, \ 1 | a \text{ and } a | 0$$
* $$a | b$$ and $$ a | c $$ implies $$a | (bu + cv) \ \forall u, v, \in \mathbb{Z}$$
  * Example: Let $$b = 6, u = 5$$ and $$c = 9, v = 2 $$
  * $$3 | 6$$ and $$3 | 9 \Rightarrow 3 | (6 \cdot 5 + 9 \cdot 2) \iff 3 | 48$$ . We can find $$k = 16$$such that $$48 = 3 \cdot 16$$
* $$a | b$$ and $$ b | c $$ implies $$ a | c$$
* if $$a|b$$and $$b|a$$ then $$a = \pm b$$

\*\*\*\*

**Definition - Division with remainder**

> Let $$a, b \in \mathbb{Z}$$with $$b≥1$$,
>
> There exists **unique** $$q, r \in \mathbb{Z}$$such that $$\boxed{a = bq + r}$$and $$0 \leq r < b$$
>
> $$q $$ is called the **quotient** and $$r$$ the **remainder**

**Examples**: 

* To find $$q, r$$ python offers us the `divmod()` function that takes $$a, b$$as arguments

```python
q, r = divmod(6, 2)
print(q, r)
# 3 0 

q, r = divmod(13, 5)
print(q, r)
# 2 3 
# Note that 13 = 2 * 5 + 3
```

* If we want to find only the quotient $$q$$ we can use the `//` operator
* If we want to find the remainder $$r$$ we can use the modulo `%` operator

```python
q = 13 // 5
print(q)
# 2

r = 13 % 5
print(r)
# 3
```

**Exercises**:

1. Now it's _your_ turn! Play with the proprieties of the division in Python and see if they hold.

## Greatest common divisor

**Definition**

> Let $$a, b \in \mathbb{Z}$$ be 2 integers. The **greatest common divisor** is the largest integer $$d \in \mathbb{Z}$$such that $$d | a$$and $$d | b$$\*\*\*\*
>
> _Notation:_ $$\gcd(a, b) = d$$\_\_

**Examples:**

```python
# In python we can import math to get the GCD algo
import math
print(math.gcd(18, 12)) # -> 6
# Sage has it already!
print(gcd(18, 12)) # -> 6
```

**Remark:**

* for all other common divisors $$c$$ of $$a, b$$we have $$c | d$$

#### Things to think about

What can we say about numbers$$ a, b$$ with $$\gcd(a, b) = 1$$? How are their divisors?



