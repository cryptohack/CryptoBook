# Fermat & Euler's Theorem

## Introduction

These theorems are very important! If you don't know them yet, read this. If you do, good for you I guess...

## Fermat's Little Theorem

Before diving in theory right away, and because I like this number, let us consider the different powers of the integers modulo 7.

| Power | 0 | 1 | 2 | 3 | 4 | 5 | 6 |
| :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: |
| 1 | 0 | 1 | 2 | 3 | 4 | 5 | 6 |
| 2 | 0 | 1 | 4 | 2 | 2 | 4 | 1 |
| 3 | 0 | 1 | 1 | 6 | 1 | 6 | 6 |
| 4 | 0 | 1 | 2 | 4 | 4 | 2 | 1 |
| 5 | 0 | 1 | 4 | 5 | 2 | 3 | 6 |
| 6 | 0 | 1 | 1 | 1 | 1 | 1 | 1 |

On the last row, there is a clear pattern emerging, what's going on??? Let's try again modulo 5 &gt;:\)

| Power | 0 | 1 | 2 | 3 | 4 |
| :---: | :---: | :---: | :---: | :---: | :---: |
| 1 | 0 | 1 | 2 | 3 | 4 |
| 2 | 0 | 1 | 4 | 4 | 1 |
| 3 | 0 | 1 | 3 | 2 | 4 |
| 4 | 0 | 1 | 1 | 1 | 1 |

Huh... again? But how? Fermat has the answer!

```python
p, itworks = 1, True
for _ in range(100):
    p = next_prime(p)
    Fp = GF(p) # Finite Field of size p
    itworks &= all(Fp(x)^(p-1) == 1 for x in range(1,p))

print(itworks)
# True
```

**Fermat's Little Theorem:** Let$$p$$a prime.$$\forall a\in\mathbb Z, a^p\equiv a~[p]$$

> When$$a\neq 0$$, this is equivalent to what we observed:$$\forall a\in\mathbb Z^*, a^{p-1}\equiv 1~[n]$$. There are several proofs of Fermat's Little Theorem, but perhaps the fastest is to see it as a consequence of the Euler's Theorem which generalizes it. Still, let's look a bit at some applications of this before moving on.

A first funny thing is the following:$$\forall a\in\mathbb Z, a\cdot a^{p-2}\equiv a^{p-1}\equiv 1~[p]$$. When$$p>2$$, this means we have found a non-trivial integer that when multiplied to$$a$$yields 1. That is, we have found the inverse of$$a$$, wow. Since the inverse is unique modulo$$p$$, we can always invert non-zero integers by doing this. From a human point of view, this is really easier than using the extended euclidean algorithm.

{% hint style="info" %}
TODO: Euler's Theorem
{% endhint %}



