# Euclidean Algorithm

## Introduction

Although we have functions that can compute our $$\gcd$$easily it's important enough that we need to give and study an algorithm for it: **the euclidean algorithm.** 

It's extended version will help us calculate **modular inverses** which we will define a bit later. 

## Euclidean Algorithm

**Important Remark**

> If $$a = b \cdot q + r$$and $$d = \gcd(a, b)$$ then $$d | r$$. Therefore $$\gcd(a, b) = \gcd(b, r)$$

### Algorithm 

We write the following:

$$ a = q_0 \cdot b + r_0 \\  b = q_1 \cdot r_0 + r_1 \\  r_0 = q_2 \cdot r_1 + r_2 \\  \vdots \\ r_{n-2} = r_ {n-1} \cdot q_{n - 1} + r_n \\ r_n = 0$$ 

Or iteratively $$r_{k-2} = q_k \cdot r_{k-1} + r_k$$ until we find a $$0$$. Then we stop

Now here's the trick: 

$$
\gcd(a, b) = gcd(b, r_0) = gcd(r_0, r_1) = \dots = \gcd(r_{n-2}, r_{n-1}) = r_{n-1}
$$

If $$d = \gcd(a, b)$$ then $$d$$ divides $$r_0, r_1, ... r_n$$

{% hint style="success" %}
Pause and ponder. Make you you understand why that works.
{% endhint %}

**Example:** 

Calculate $$\gcd(24, 15)$$\*\*\*\*

$$24 = 1 \cdot 15 + 9 \\ 15 = 1 \cdot 9 + 6 \\ 9 = 1 \cdot 6 + 3 \\ 6 = 2 \cdot 3 + 0 \Rightarrow 3 = \gcd(24, 15) $$

```python
def my_gcd(a, b):
    # If a < b swap them
    if a < b: 
        a, b = b, a
    # If we encounter 0 return a
    if b == 0: 
        return a
    else:
        r = a % b
        return my_gcd(b, r)

print(my_gcd(24, 15))
# 3
```

## Extended Euclidean Algorithm

**Example**

\*\*\*\*

