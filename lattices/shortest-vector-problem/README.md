# Lattice reduction

## Overview

Having introduced the LLL reduction, we now provide a more general notions of a reduced basis for a lattice as well as provide bounds for the basis vectors. The key idea behind introducing these definitions is that once we know some basis vector is \[\]-reduced, we can bound the sizes of the basis, which is important when algorithms require short vectors in a lattice. For fast algorithms, LLL-reduction is typically the most important notion as it can be computed quickly. Two main definitions appear often when discussing lattice reductions, which we will provide here.

## Definitions

A basis$$\left\{b_i\right\}_{i=1}^d$$is **size-reduced** if $$\left|\mu_{i,j}\right|\leq\frac12$$. Intuitively this captures the idea that a reduced basis being "almost orthogonal".

Let $$L$$be a lattice, $$1\leq i\leq\dim L=d$$, we define the $$i^\text{th}$$**successive minima**$$\lambda_i(L)$$ as

$$
\lambda_i(L)=\min\left(\max_{1\leq j\leq i}\left(\left\lVert v_j\right\rVert\right):v_j\in L\text{ are linearly independent}\right)
$$

Intuitively, $$\lambda_i(L)$$is the length of the "$$i^\text{th}$$ shortest lattice vector". This intuition is illustrated by the definition of $$\lambda_1$$:

$$
\lambda_1(L)=\min\left(\left\lVert v\right\rVert:v\in L\right)
$$

However this is not precise as if $$v$$is the shortest lattice vector, then $$-v$$is also the shortest lattice vector.

Unfortunately, a basis$$b_i$$for $$L$$where $$\lambda_i(L)=\left\lVert b_i\right\rVert$$for dimensions $$5$$ and above. This tells us that we can't actually define "the most reduced basis" in contrast to the 2D case \(see [Lagrange's algorithm](../lll-reduction/gaussian-reduction.md)\) and we would need some other definition to convey this intuition.

An alternate definition of$$\lambda_i(L)$$that will be helpful is the radius of the smallest ball centered at the origin such that the ball contains at least$$i$$linearly independent vectors in$$L$$.

## Exercises

1\) Show that both definitions of $$\lambda_i$$ are equivalent

2\) Consider the lattice $$L=\begin{pmatrix}2&0&0&0&0\\0&2&0&0&0\\0&0&2&0&0\\0&0&0&2&0\\1&1&1&1&1\end{pmatrix}$$. Show that the successive minima are all$$2$$but no basis$$b_i$$can satisfy $$\left\lVert b_i\right\rVert=\lambda_i$$.



