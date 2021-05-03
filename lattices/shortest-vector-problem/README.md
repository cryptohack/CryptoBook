# Lattice reduction

## Overview

Having introduced the LLL reduction, we now provide a more general notions of a reduced basis for a lattice as well as provide bounds for the basis vectors. The key idea behind introducing these definitions is that once we know some basis vector is \[\]-reduced, we can bound the sizes of the basis, which is important when algorithms require short vectors in a lattice. For fast algorithms, LLL-reduction is typically the most important notion as it can be computed quickly. Two main definitions appear often when discussing lattice reductions, which we will provide here.

## Definitions

A basis$$\left\{b_i\right\}_{i=1}^d$$is **size-reduced** if $$\left|\mu_{i,j}\right|\leq\frac12$$. Intuitively this captures the idea that a reduced basis being "almost orthogonal".

Let $$L$$be a lattice, $$1\leq i\leq\dim L=d$$, we define the $$i^\text{th}$$**successive minima**$$\lambda_i(L)$$ as

$$
\lambda_i(L)=\min\left(\max_{1\leq j\leq i}\prod_i\left\lVert v_j\right\rVert:v_j\in L\text{ are linearly independent}\right)
$$

Intuitively, $$\lambda_i(L)$$is the length of the "$$i^\text{th}$$ shortest lattice vector". This intuition is illustrated by the definition of $$\lambda_1$$:

$$
\lambda_1(L)=\min\left(\left\lVert v\right\rVert:v\in L\right)
$$

However this is not precise as if $$v$$is the shortest lattice vector, then $$-v$$is also the shortest lattice vector.

Unfortunately, a basis$$b_i$$for $$L$$where $$\lambda_i(L)=\left\lVert b_i\right\rVert$$for dimensions $$5$$ and above. This tells us that we can't actually define "the most reduced basis" in contrast to the 2D case \(see [Lagrange's algorithm](../lll-reduction/gaussian-reduction.md)\) and we would need some other definition to convey this intuition.



