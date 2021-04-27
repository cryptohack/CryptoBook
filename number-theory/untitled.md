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
* $$a | b$$ and $$ a | c $$ imples $$a | (b + c)$$
* $$a | b$$ and $$ b | c $$ imples $$ a | c$$

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
```

### Ideals \(optional\)

**Definition - Ideal of** $$\mathbb{Z}$$\*\*\*\*

$$ I \subseteq \mathbb{Z}$$is an ideal $$\iff \forall \ a, b \in I \text{ and} , z\ \in \mathbb{Z}$$we have 

$$a + b \in I \text{ and } az \in I$$

**Example**: $$a\mathbb{Z} = \{az \ : \ z \in \mathbb{Z} \} \to 2\mathbb{Z}, 3\mathbb{Z}, 4\mathbb{Z}, \dots$$  - multiples of $$a$$

**Remarks**: 

1. $$\forall a, b \in \mathbb{Z}$$we have $$b \in a\mathbb{Z} \iff a | b$$
2. $$I_1 + I_2 = \{a_1 + a_2 \ : \ a_1 \in I_1 , a_2 \in I_2\}$$ is an ideal

**Example**: Consider $$18\mathbb{Z} + 12\mathbb{Z}$$. This ideal contains $$6 = 18 \cdot 1 + 12 \cdot (-1) \Rightarrow 18\mathbb{Z} + 12\mathbb{Z} = 6\mathbb{Z}$$

**Greatest common divisor**

> Let $$a, b \in \mathbb{Z}$$ be 2 integers. If $$d = \gcd(a, b) \Rightarrow a\mathbb{Z} + b\mathbb{Z} = d\mathbb{Z}$$

