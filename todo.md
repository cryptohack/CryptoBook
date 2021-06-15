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
Descriptions of attacks against cryptosystems are strongly encouraged, however full SageMath implementations should not be included, as this has the potential for destroying CryptoHack challenges, or making all attacks known by so many people that CTFs become a total nightmare!! 
{% endhint %}

## Proposed topics

This list is **not complete** so please add to it as you see fit.

### Mathematical Background

#### Fundamentals

* Congruences
* GCD, LCM
  * Bézout's Theorem
  * Gauss' Lemma and its ten thousand corollaries
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

#### Abstract Algebra

Mainly thinking things like:

* Groups, Rings, Fields, etc.
* Abelian groups and their relationship to key-exchange
* Lagrange's theorem and small subgroup attacks

#### Elliptic Curves

* Weierstrass
* Montgomery
* Edwards
* Counting points \(Schoof's algorithm\)
* Complex multiplication
  * [Good reference, thanks Joachim](https://crypto.stanford.edu/pbc/thesis.pdf)\*\*\*\*

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

### Security background

* Basic Concepts 
  * Confidentiality, Integrity etc
  * Encryption, Key generation
* Attacker goals + Attack games
* Defining Security - Perfect security, semantic security
* Proofs of security + Security Reductions

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
* RSA's Integer fattorization Attacks
* * Fermat Factoring Attack
  * Quadratic Sieve Attack
  * Number Fielde Sieve Attack
* RSA Digital Signature Scheme
* Timing Attacks on RSA
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

### Symmetric Cryptography

#### One Time Pad

* XOR and its properties
* XOR as One Time Pad
* Generalized One Time Pad 

**Block Ciphers**

* AES

**Stream Ciphers**

* Affine
* RC4

### **Hashes**

* Introduction
* Trapdoor Functions
* MD family
* SHA family
* BLAKE Hash family
* // TODO: Insert Attacks

### Isogeny Based Cryptography

* Isogenies
* Isogeny graphs
* Torsion poins
* SIDH
* SIKE
* BIKE

### Cryptographic Protocols

#### Zero-knowledge proofs

* Schnorr proof of knowledge for dlog
* Core definitions
* Proof of equality of dlog
* Proof of knowledge of a group homomorphism preimage

#### Formal Verification of Security Protocols

* Definition of Formal Verification
* Uses of Formal Verification
* Handshake protocols, flawed protocols
* The external threat: Man-In-The-Middle attacks
* Attacking the \(flawed\) Needham-Shroeder public key exchange protocol 



#### Usefull Resources \( Books, articles ..\) // based on my material

* Cryptanalytic Attacks on RSA \(Yan, Springer, 2008\)
* Algorithmic Cryptanalysis \(Antoine Joux, CRC Press, 2009\)
* Algebraic Cryptanalysis \(Brad, Springer, 2009\)
* RC4 stream Cipher and its variants \(H. Rosen, CRC Press, 2013\)
* Formal Models and Techniques for Analyzing Security Protocols \(Cortier, IOS Press, 2011\)
* Algebraic Shift Register Sequences \(Goresky && Klapper, Cambridge Press,  2012\)
* The Modelling and Analysis of Security Protocols \(Schneider, Pearson, 2000\)
* Secure Transaction Protocol Analysis \(Zhang && Chen, Springer, 2008\)

