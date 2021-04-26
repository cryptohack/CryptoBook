---
description: A summary we plan to cover
---

# TODO

## Overview

Creating this chapter as a simple check list for topics that I think should be covered. I'm going to split topics between "background", which should cover general mathematics and "attacks" which should be split between protocols.

Please add to this list freely and we can work through it however we can

### Background

#### General

Probably can have a better title...

* Groups, Rings, Fields, etc.
* Congruences
* GCD, LCM
* Euclid's algorithm
* Morphisms et al. 
* Frobenius endomorphism

#### Number Theory

Mainly thinking things like

* Prime decomposition and distribution
* Euler's theorem
* Factoring
* Legrange / Jacobi symbol

#### Group Theory

Mainly thinking things like:

* Abelian groups and their relationship to key-exchange
* Lagrange's theorem and small subgroup attacks

#### Elliptic Curves

* Weierstrass
* Montgomery
* Edwards
* Counting points \(Schoof's algorithm\)
* Complex multiplication
  * [Good reference, thanks Joachim](https://crypto.stanford.edu/pbc/thesis.pdf)

**Generating Elliptic Curves**

* [Generating Anomalous curves](http://www.monnerat.info/publications/anomalous.pdf)
* Generating curves of prime order
* Generating supersingular curves [Wikipedia](https://en.wikipedia.org/wiki/Supersingular_elliptic_curve#Examples)
* [Generating non-supersinular curves of low embedding degree](https://eprint.iacr.org/2004/058.pdf)
* Generating curves of arbitary order \(hard\)
  * [Thesis on the topic](https://www.math.leidenuniv.nl/scripties/Broker.pdf)
  * Sage implementation [ChiCube's script](https://gist.github.com/ChiCubed/0977601c9ce88eda03b9d2576231192e)

#### Hyperellipic curves

* Generalisation of elliptic curves
* Recovering a group structure using the Jacobian
* Example: genus one curves, jacobian is isomorphic to the set of points
* Mumford representation of divisors
* Computing the order of the Jacobian
  * [For characteristic 2^n: Example 56](https://www.math.uwaterloo.ca/~ajmeneze/publications/hyperelliptic.pdf)

### Attacks

#### Elliptic Curves

* Why Elliptic: show conic sections are weak
* Smart's attack
* Pairing attacks 
* Singular curves 
* Weil Descent Attack [https://eprint.iacr.org/2004/240.pdf](https://eprint.iacr.org/2004/240.pdf)

