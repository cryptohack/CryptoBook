---
description: 'When you want to recover N given some (plaintext, ciphertext) pairings'
---

# Recovering the Modulus

## Scenario

Consider the case that that you know a set of \(plaintext, ciphertext\) pairings - this may be that you are provided them, or that you have access to some functionality that returns ciphertexts for provided plaintexts. If you do not know the modulus, but know the exponent used \(note: this may be prone to a brute-force regardless\), then given these pairings you can recover the modulus used.

## What we know

Let the following be known:

* plaintext && ciphertext pairings:

$$
(M_i,C_i) \text{ for } i \in [1,\infty]
$$

* public exponent `e` \(e.g. 65537 = 0x10001\)

## Process

The idea behind this attack is effectively finding common factors between pairings. Recall that, under general RSA encryption, we have:

$$
C = M^{e} \text{ } (mod\text{ }N)
$$

and recall what modular arithmetic tells us about the relation between these terms, namely that:

$$
a \equiv b\text{ }(mod\text{ } N)\\
a = b + kN \text{ for some } k \in \mathbb{Z}
$$

This, rearranged, tells us that

$$
a - b \equiv 0\text{ } (mod \text{ } N)\\
a - b = kN
$$

What this means for our known pairings is that, given we know $$m, c$$ and $$e$$, we can form the relationship:

$$
C_i - M_i^e \equiv 0\text{ } (mod \text{ } N)\\
C_i - M_i^e = k_iN
$$

Thus we can calculate for the value $$kN$$, though don't know either value individually - we want to somehow derive $$N$$.

Observe that any two pairings will equate to a value, both with $$N$$ as a factor. We can take the gcd of these two values, and it is probable that the resulting value will be our $$N$$ value, such that:

$$
N = gcd(C_1 - M_1^e, C_2 - M_2^e)
$$

However, this is only true for the case that

$$
gcd(k_1, k_2) = 1
$$

i.e., both $$k_1$$and $$k_2$$are coprime. In the case that they are not, i.e. $$gcd(k_1, k_2) \ne 1$$, we have that

$$
aN = gcd(C_1 - M_1^e, C_2 - M_2^e) \text{ s.t. } 1 \ne a \in \mathbb{Z}
$$

In such a case, we don't have sufficient information to completely recover the modulus, and require more plaintext-ciphertext pairs to be successful. In general, the more pairings you have, the more confident you can be the value you calculate is $$N$$. More specifically:

$$
Pr(a \ne1) \rightarrow 0 \text{ as } k\rightarrow \infty
$$

Thus:

$$
N = gcd(C_1 - M_1^e, C_2 - M_2^e, ..., C_k - M_k^e)
$$

## Practical Notes

* In reality, you're likely to only need two or three \(plaintext, ciphertext\) pairings \(in the context of ctf challenges and exercises\), and as such computations can be manual if needed, but shouldn't be too complex
* As it's likely you'll be dealing with large numbers, overflows and precision errors may arise in code - using libraries like gmpy provide support for integers of \(theoretically\) infinite size, and some nice accompanying features too \(like inbuilt gcd and efficient modular exponentiation\)
* These two statements are mathematically equivalent, but one is easier to implement in code:

$$
gcd(a, b, c, d, ...) = gcd(a, gcd(b, gcd(c, gcd(d, ...)))
$$

## Code Example

```text
import gmpy2

"""
@param pairings
    list: [(pt1, ct1), (pt2, ct2), ..., (ptk, ctk)]
@param e
    int : encryption exponent
@return
    int : recovered N
"""
def recover_n(pairings, e):
    pt1, ct1 = pairings[0]
    N = ct1 - pow(pt1, e)
    
    # loop through and find common divisors
    for pt,ct in pairings:
        val = gmpy2.mpz(ct - pow(pt, e))
        N = gmpy2.gcd(val, N)
    
    return N
    
```

