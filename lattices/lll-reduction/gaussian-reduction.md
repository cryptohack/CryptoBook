# Lagrange's algorithm

Lagrange's algorithm, often incorrectly called Gaussian reduction, is the 2D analouge to the Euclidean algorithm and is used for lattice reduction. Intuitively, lattice reduction is the idea of finding a new basis that consists of shorter vectors. Before going into Lagrange's algorithm, we first recap the Euclidean algorithm:

```text
def euclid(m,n):
    while n!=0:
        q = round(m/n)
        m -= q*n
        if abs(n) > abs(m):
            m, n = n, m
    return abs(m)
```

The algorithm primarily consists of two steps, a reduction step where the size of $$m$$is brought down by a multiple of $$n$$and a swopping step that ensures $$m$$is always the largest number. We can adapt this idea for lattices:

```text
def lagrange(b1,b2):
    mu = 1
    while mu != 0:
        mu = round((b1*b2) / (b1*b1))
        b2 -= mu*b1
        if b1*b1 > b2*b2:
            b1, b2 = b2, b1
    return b1, b2
```

Here $$\mu$$is actually the Gram-Schmidt coefficient $$\mu_{2,1}$$and it turns out that this algorithm will always find the shortest possible basis! Using the basis

$$
\begin{matrix}
b_1&=&(-1.8,1.2)\\
b_2&=&(-3.6,2.3)
\end{matrix}
$$

the Lagrange reduction looks like

![](../../.gitbook/assets/lagrange1%20%281%29.svg)

![](../../.gitbook/assets/lagrange2.svg)

![](../../.gitbook/assets/lagrange3.svg)

and here we see it clearly gives the shortest vectors.

