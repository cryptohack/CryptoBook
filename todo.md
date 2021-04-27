---
description: A summary we plan to cover
---

# Book Plan

## Philosophy

The aim of CryptoBook is to have a consolidated space for all of the mathematics required to properly learn and enjoy cryptography. The focus of any topic should be to introduce a reader to a subject in a way that is fun, engaging and with an attempt to frame it as an applied resource.

The second focus should be to cleanly implement the various topics using SageMath, so that there is a clear resource for a new reader to gain insight on how SageMath might be used to create the objects needed.

{% hint style="success" %}
Write about what you love and this book will be a success. 
{% endhint %}

{% hint style="info" %}
Descriptions of attacks against crypto systems are strongly encouraged, however full SageMath implementations should not be included, as this has the potential for destroying CryptoHack challenges, or making all attacks known by so many people that CTFs become a total nightmare!! 
{% endhint %}

## Proposed topics

This list is **not complete** so please add to it as you see fit.

### Mathematical Background

#### Fundamentals

* Groups, Rings, Fields, etc.
* Congruences
* GCD, LCM
* Euclid's algorithm
* Modular Arithmetic
* Morphisms et al. 
* Frobenius endomorphism

#### Number Theory

Mainly thinking things like

* Prime decomposition and distribution
* Primality testing
* Euler's theorem
* Factoring
* Legendre / Jacobi symbol

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
  * [Good reference, thanks Joachim](https://crypto.stanford.edu/pbc/thesis.pdf)\*\*\*\*
* Isogenies

**Generating Elliptic Curves**

* [Generating Anomalous curves](http://www.monnerat.info/publications/anomalous.pdf)
* Generating curves of prime order
* Generating supersingular curves [Wikipedia](https://en.wikipedia.org/wiki/Supersingular_elliptic_curve#Examples)
* [Generating non-supersinular curves of low embedding degree](https://eprint.iacr.org/2004/058.pdf)
* Generating curves of arbitary order \(hard\)
  * [Thesis on the topic](https://www.math.leidenuniv.nl/scripties/Broker.pdf)
  * Sage implementation [ChiCube's script](https://gist.github.com/ChiCubed/0977601c9ce88eda03b9d2576231192e)

#### Hyperelliptic curves

* Generalization of elliptic curves
* Recovering a group structure using the Jacobian
* Example: genus one curves, jacobian is isomorphic to the set of points
* Mumford representation of divisors
* Computing the order of the Jacobian
  * [For characteristic 2^n: Example 56](https://www.math.uwaterloo.ca/~ajmeneze/publications/hyperelliptic.pdf)
  * Hyper Metroid example

### Asymmetric Cryptography

#### RSA

* Textbook protocol
* Padding
  * Bleichenbacher's Attack
  * OAEP
* Coppersmith
  * Håstad's Attack
  * Franklin-Reiter Attack
* Wiener's Attack
* RSA Digital Signature Scheme
* RSA with Chinese Remainder Theorem \(CRT\)
  * [Fault Attack on RSA-CRT](https://eprint.iacr.org/2002/073.pdf)
  * [Bellcore Attack \(Low Voltage Attack\)](https://eprint.iacr.org/2012/553.pdf)

#### Paillier Cryptosystem

* Textbook protocol

#### ElGamal Encryption System

* Textbook protocol
* ElGamal Digital Signature Scheme

#### Diffie-Hellman

* Textbook protocol
* Strong primes, and why

#### Elliptic Curve Cryptography

* ECDSA
* EdDSA

#### Isogeny Based Cryptography

* SIDH
* SIKE
* BIKE

### Symmetric Cryptography

**Block Ciphers**

* AES

**Stream Ciphers**

* Affine
* RC4



