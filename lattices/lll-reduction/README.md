# LLL reduction

## Introduction

In this section, we hope to bring some intuitive understanding to the LLL algorithm and how it works. The LLL algorithm is a lattice reduction algorithm, meaning it takes in a basis for some lattice and hopefully returns another basis for the same lattice with shorter basis vectors. Before introducing LLL reduction, we'll introduce 2 key algorithms that LLL is built from, Gram-Schmidt orthogonalization and Gaussian Reduction. We give a brief overview on why these are used to build LLL.

As the volume of a lattice is fixed, and is given by the determinant of the basis vectors, whenever our basis vectors gets shorter, they must, in some intuitive sense, become more orthogonal to each other in order for the determinant to remain the same. Hence, Gram-Schmidt orthogonalization is used as an approximation to the shortest basis vector. However, the vectors that we get are in general not in the lattice, hence we only use this as a rough idea of what the shortest vectors would be like.

Lagrange's algorithm can be thought as the GCD algorithm for 2 numbers generalized to lattices. This iteratively reduces the length of each vector by subtracting some amount of one from another until we can't do it anymore. Such an algorithm actually gives the shortest possible vectors in 2 dimensions! Unfortunately, this algorithm may not terminate for higher dimensions, even in 3 dimensions. Hence, it needs to be modified a bit to allow the algorithm to halt.

