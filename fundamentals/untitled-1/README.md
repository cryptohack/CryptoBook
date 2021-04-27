---
description: 'Author: Zademn'
---

# Division and Greatest common divisor

## Division

Let $$\mathbb{Z} = \{\dots , -1, 0, 1, 2, 3 \dots \}$$be the set denoting the integers

**Definition - Divisibility**

> For $$a, b, \in \mathbb{Z} $$we say that $$a$$divides $$b$$if there is some $$k \in \mathbb{Z}$$such that $$a \cdot k = b$$
>
> _Notation:_ $$a | b$$

**Properties**

* $$a | a, \ 1 | a \text{ and } a | 0$$
* $$a | b$$ and $$ a | c $$ implies $$a | (b + c)$$
* $$a | b$$ and $$ b | c $$ implies $$ a | c$$

**Definition - Division with remainder**

> Let $$a, b \in \mathbb{Z}$$with $$b≥1$$,
>
> There exists **unique** $$q, r \in \mathbb{Z}$$such that $$\boxed{a = bq + r}$$and $$0 \leq r < b$$
>
> $$q $$ is called the **quotient** and $$r$$ the **remainder**

## Greatest common divisor

**Definition**

> Let $$a, b \in \mathbb{Z}$$ be 2 integers. The **greatest common divisor** is the largest integer $$d \in \mathbb{Z}$$such that $$d | a$$and $$d | b$$\*\*\*\*
>
> _Notation:_ $$\gcd(a, b) = d$$\_\_

**Examples:**

```python
from Crypto.Util.number import GCD
print(GCD(18, 12)) # -> 6
print(gcd(18, 12)) # -> 6 - SageMath has gcd
```



