# Gram-Schmidt Orthogonalization

## Overview

Gram-Schmidt orthogonalization is an algorithm that takes in a basis $$\left\{b_i\right\}_{i=1}^n$$ as an input and returns a basis $$\left\{b_i^*\right\}_{i=1}^n$$where all vectors are orthogonal, i.e. at right angles. This new basis is defined as 

$$
b_i^*=b_i-\sum_{j=1}^{i-1}\mu_{i,j}b_j^*\quad\mu_{i,j}=\frac{\langle b_i,b_j^*\rangle}{\langle b_j^*,b_j^*\rangle}
$$

where $$\mu_{i,j}$$is the **Gram-Schmidt coefficients**.

One can immediately check that this new basis is **orthogonal**, meaning

$$
\langle b_i^*,b_j^*\rangle=\delta_{i,j}=\begin{cases}0&i\neq j\\1&i=j\end{cases}
$$

Let $$\mathcal B$$be the matrix where the $$i$$th row is given by $$b_i$$and$$\mathcal B^*$$be the matrix where the $$i$$th row is given by $$b_i^*$$, then the Gram-Schmidt orthogonalization gives us $$\mathcal B=\mu\mathcal B^*$$where $$\mu_{i,i}=1,\mu_{j,i}=0$$and $$\mu_{i,j}$$is the Gram-Schmidt coefficient. As an example, consider the basis of a subspace of $$\mathbb R^4$$:

$$
\begin{matrix}
b_1 &= & (&-1&-2&3&1&)\\
b_2 &= & (&-6&-4&5&1&)\\
b_3 &= & (&5&5&1&-3&)
\end{matrix}
$$

Instead of doing the Gram-Schmidt orthogonalization by hand, we can get sage to do it for us:

```text
B = Matrix([
[-1, -2, 3, 1],
[-6, -4, 5, 1],
[5, 5, 1, -3]])

B.gram_schmidt()
```

This outputs two matrices, $$\mathcal B^*$$and $$\mu$$:

```text
(
[-1 -2  3  1]  [ 1  0  0]
[-4  0 -1 -1]  [ 2  1  0]
[ 0  3  3 -3], [-1 -1  1]
)
```

One can quickly verify that $$\mathcal B=\mu\mathcal B^*$$ and that the rows of $$\mathcal B^*$$are orthogonal to each other.

A useful result is that

$$
\det\left(\mathcal B\mathcal B^T\right)=\det\left(\mathcal B^*\mathcal B^{*T}\right)=\prod_i||b_i^*||
$$

Intuitively, this tells us that the more orthogonal a set of basis for a lattice is, the shorter it is as the volume must be constant.

## Exercises

1\) Verify that the example is indeed correct.

2\) Show that $$\langle b_i^*,b_j^*\rangle=\delta_{i,j}$$.

3\) Show that $$\mu\mu^T=1$$and $$\mathcal B^*\mathcal B^{*T}$$ is a diagonal matrix whose entries are $$||b_i^*||$$. Conclude that $$\det\left(\mathcal B\mathcal B^T\right)=\det\left(\mathcal B^*\mathcal B^{*T}\right)=\prod_i||b_i^*||$$.  

4\*\) Given the Iwasawa decomposition $$\mathcal B=LDO$$where $$L$$is a lower diagonal matrix with $$1$$on its diagonal, $$D$$is a diagonal matrix and $$O$$an orthogonal matrix, meaning $$OO^T=1$$, show that $$\mathcal B^*=DO$$and $$\mu=L$$. Furthermore, prove that such a decomposition is unique.

