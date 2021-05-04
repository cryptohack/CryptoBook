# Resources and notations

## References/Resources

1. Nguyen, P. Q., & Vallée, B. \(Eds.\). \(2010\). The LLL Algorithm. Information Security and Cryptography. doi:10.1007/978-3-642-02295-1

       Massive survey, lots of detail if you're extremely interested\)

2. May, A. \(2003\). New RSA Vulnerabilities Using Lattice Reduction Methods. Universität Paderborn.

       Excellent exposition to LLL and coppersmith as well as showing some RSA attacks via LLL

3. Lenstra, A. K., Lenstra, H. W., & Lovász, L. \(1982\). Factoring polynomials with rational coefficients. Mathematische Annalen, 261\(4\), 515–534. doi:10.1007/bf01457454

       The original LLL paper, quite a nice read overall + proof that LLL works

4. Coppersmith, D. \(1996\). Finding a Small Root of a Univariate Modular Equation. Lecture Notes in Computer Science, 155–165. doi:10.1007/3-540-68339-9\_14
5. Coppersmith, D. \(1996\). Finding a Small Root of a Bivariate Integer Equation; Factoring with High Bits Known. Lecture Notes in Computer Science, 178–189. doi:10.1007/3-540-68339-9\_16 

       Both of these paper introduces the coppersmith algorithm as well as provide some examples

## Notation

* $$L$$ lattice
  * $$\dim(L)$$dimension of lattice
  * $$\text{vol}(L)$$volume of lattice
* $$b_i$$ a chosen basis for $$L$$
  * $$\mathcal B$$ matrix whose $$i$$th row vectors is $$b_i$$
* $$b_i^*$$ Gram-Schmidt orthogonalization of $$b_i$$\(without normalization\)
  * $$\mathcal B^*$$matrix whose $$i$$th row vectors is $$b_i^*$$
* $$\mu_{i,j}=\frac{\langle b_i,b_j^*\rangle}{\langle b_j^*,b_j^*\rangle}$$ Gram-Schmidt coefficients
* $$\lambda_i(L)$$ the $$i$$th successive minima of $$L$$

