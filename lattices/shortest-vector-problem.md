# Reduced Basis

Since our basis is not unique, one can have plenty of possible basis vectors. Lattice reduction is the process of finding a new basis that has shorter vectors. For instance in the previous diagram, the green vectors are a set of long basis vectors while the red vectors is a reduced lattice. The most optimal lattice reduction gives the basis that consists of the shortest possible vectors, however this is in general extremely hard to do. First, we will define what it means to be a reduced basis. Before going into the different notions of a reduced basis, we first define a useful theoretical tool for constructing bounds, the Minkowski's successive minimas.

Let $$L$$be a lattice, $$1\leq i\leq\dim L=n$$, we define the $$i$$th successive minima$$\lambda_i(L)$$ as

$$
\lambda_i(L)=\min\left(\max_{1\leq j\leq i}||v_j||:v_j\in L\text{ are linearly independent}\right)
$$

Intuitively, $$\lambda_i(L)$$is the length of the "ith shortest lattice vector". However this is not precise as if $$v$$is the shortest lattice vector, then $$-v$$is also the shortest lattice vector. This intuition is illustrated by the definition of $$\lambda_1$$:

$$
\lambda_1(L)=\min\left(||v||:v\in L\right)
$$

Unfortunately, there may not exist a basis $$v_i$$for $$L$$such that $$\lambda_i(L)=||v_i||$$for dimensions $$5$$ and above. 

With this definition, we can start defining the various notions of reduced basis and provide some bounds.

The basis $$\left\{b_i\right\}_{i=1}^n$$ is **Minkowski-reduced** if $$b_i$$has minimum length among all vectors in $$L$$ linearly independent from$$\left\{b_j\right\}_{j=1}^{i-1}$$. Equivalently, $$b_i$$has minimum length among all vectors $$v$$such that $$\left\{b_1,\dots,b_{i-1},v\right\}$$can be extended to form a basis of $$L$$. Such a basis satisfies the following bound: 

$$
\lambda_i(L)^2\leq||b_i||\leq\min\left\{1,\left(\frac54\right)^{n-4}\right\}
$$

This is the strongest notion of reduced basis, however, we typically only use a slightly weaker notion as it is easier to construct computationally and is typically good enough, known as HKZ reduced. We first introduce a very weak notion of reduction that many other notions builds on:

A basis $$\left\{b_i\right\}_{i=1}^n$$is **size-reduced** if $$\left|\mu_{i,j}\right|\leq\frac12$$. Intuitively this captures the idea that a reduced basis is "almost orthogonal".

Let $$\pi_i$$as the projection to the orthogonal complement of $$\left\{b_j\right\}_{j=1}^{i-1}$$.Then the basis is **HKZ-reduced** if it is size-reduced and $$||b_i^*||=\lambda_1\left(\pi_i(L)\right)$$. We have the following bound:



$$
\frac4{i+3}\leq\left(\frac{||b_i||}{\lambda_i(L)}\right)^2\leq\frac{i+3}4
$$

Currently all these notions are the most intuitive ways to translate the idea of a reduced basis by taking some form of shortest vectors. Unfortunately, these are typically quite time-consuming to compute, hence we need even looser definitions of lattice reduction. The first example of which comes from the **LLL reduction.**

