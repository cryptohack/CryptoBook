---
description: >-
  What to do when the same message is encrypted twice with the same modulus but
  a different public key?
---

# Common Modulus Attack

Imagine we have Alice and Bob. Alice sends the **SAME** message to Bob more than once using the same public key. The internet being the internet, a problem may happen; a bit is flipped, and the public key changed while the modulus stayed the same.

## What we know

Let be the following:

* `m` the message in plaintext
* `e1` the public key of the first ciphertext
* `c1` the first ciphertext 
* `e2` the public key of the second ciphertext
* `c2` the second ciphertext
* `n` the modulus that is common to both ciphertexts

All of these but `m` are essentially given to us.

## Conditions of the attack

Because we are going to need to calculate inverses for this attack, we must first make sure that these inverses exist in the first place:

$$
gcd(e_1, e_2) = 1
\newline
gcd(c_2, n) = 1
$$

## The math behind the attack

We know that RSA goes as follows:

$$
c = m^e\ mod\ n
$$

From the conditions above we also know that $$e1 $$ and $$e2$$ are co-prime. Thus using Bezout's Theorem we can get:

$$
xe_1 +ye_2 = gcd(e_1, e_2) = 1
$$

Using this, we can derive the original message $$m $$ :

_NB: all the calculations are done mod_ $$n $$ 

$$
C_1^x * C_2^y = (m^{e_1})^x*(m^{e_2})^y
\newline
= m^{e_1x+e_2y}
\newline
= m^1 = m
$$

In general, Bezout's Theorem gives a pair of positive and negative numbers. We just need to adapt this equation a little to make it work for us. In this case, let's assume $$y$$  is the negative number:

$$
Let\ y = -a
\newline
C_2^y = C_2^{-a}
\newline
= (C_2^{-1})^a
\newline
= (C_2^{-1})^{-y}
$$

Now to truly recover the plaintext, we are actually doing:

$$
C_1^x \times (C_2^{-1})^{-y}\ mod\ n
$$



