# LLL reduction

## Overview

There are a few issues that one may encounter when attempting to generalize Lagrange's algorithm to higher dimensions. Most importantly, one needs to figure what is the proper way to swap the vectors around and when to terminate, ideally in in polynomial time. A rough sketch of how the algorithm should look like is

```text
def LLL(B):
    m = B.nrows()
    i = 1
    while i<m:
        size_reduce(B)
        if swap_condition(B):
            i += 1
        else:
            B[i],B[i-1] = B[i-1],B[i]
            i = max(i-1,1)
    return B

```

There are two things we need to figure out, in what order should we reduce the basis elements by and how should we know when to swap. Ideally, we also want the basis to be ordered in a way such that the smallest basis vectors comes first. Intuitively, it would also be better to reduce a vector by the larger vectors first before reducing by the smaller vectors, a very vague analogy to filling up a jar with big stones first before putting in the sand. This leads us to the following size reduction algorithm:

```text
def size_reduce(B):
    i = 1
    m = B.nrows()
    while i<m:
        Bs,M = B.gram_schmidt()
        for j in reversed(range(i)):
            B[i] -= round(M[i,j])*B[j]
            Bs,M = B.gram_schmidt()
    return B

```

Note that we can improve this by optimizing the Gram Schmidt computation as this algorithm does not modify $$\mathcal B^*$$at all. With this optimization, this algorithm has a time complexity of $$O\left(m^5\log^2B\right)$$where $$B$$is a bound for the norms of $$b_i$$.

Next, we need to figure a swapping condition. Naively, we want

$$
||b_i||\leq||b_{i+1}||
$$

for all $$i$$. However, such a condition does not guarantee termination in polynomial time. As short basis vectors should be almost orthogonal, we may also want to incorperate this notion. Concretely, we want $$\left|\mu_{i,j}\right|$$to be somewhat small for all pairs of $$i,j$$, i.e. we may want something like

$$
|\mu_{i,j}|\leq c
$$

However, since $$\mu_{i,j}=\frac{\langle b_i,b_j^*\rangle}{\langle b_j^*,b_j^*\rangle}$$, this condition is easily satisfied for a sufficiently long $$b_j^*$$, which is not what we want. The key idea is to merge these two in some way and was first noticed by Lovász - named the **Lovász condition**:

$$
\delta||b_i^*||^2\leq||b_{i+1}^*+\mu_{i+1,i}b_i^*||^2\quad\delta\in\left(\frac14,1\right)
$$

It turns out that using this condition, the algorithm above terminates in polynomial time! More specifically, it has a time complexity of $$O\left(m^5n\log^3B\right)$$where we have $$m$$basis vectors as a subset of $$\mathbb R^n$$and $$B$$is a bound for the largest norm of $$b_i$$. $$\frac14<\delta$$ ensures that the lattice vectors are ordered roughly by size and $$\delta<1$$ensures the algorithm terminates.



