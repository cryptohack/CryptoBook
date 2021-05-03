# LLL reduced

## Definition

Let $$\delta\in\left(\frac14,1\right)$$. A basis$$\left\{b_i\right\}_{i=1}^d$$is $$\delta$$- **LLL-reduced** if it is size reduced and satisfy the Lovász condition, i.e.

$$
\delta\left\lVert b_i^*\right\rVert^2\leq\left\lVert b_{i+1}^*+\mu_{i+1,i}b_i^*\right\rVert^2
$$

This notion of reduction is most useful to use for fast algorithms as such a basis can be found in polynomial time \(see [LLL reduction](../lll-reduction/lll-reduced-basis.md)\).

## Bounds

$$
\begin{align*}
\left\lVert b_1\right\rVert&\leq\left(\frac4{4\delta-1}\right)^{\frac{d-1}4}\text{vol}(L)^\frac1d\\
\left\lVert b_i\right\rVert&\leq\left(\frac4{4\delta-1}\right)^{\frac{d-1}2}\lambda_i(L)\\
\prod_{i=1}^d\left\lVert b_i\right\rVert&\leq\left(\frac4{4\delta-1}\right)^{\frac{d(d-1)}4}\text{vol}(L)
\end{align*}
$$

