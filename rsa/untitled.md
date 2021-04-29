---
description: >-
  Will be introduced in this page the fundamentals of RSA, mathematical
  requirement and also some application with python and openSSL.
---

# Introduction to RSA

### I- Introduction:

RSA is a [public-key cryptosystem](https://en.wikipedia.org/wiki/Public-key_cryptography) that is widely used in the world today to provide a secure transmission system to millions of communications, is one of the oldest such systems in existence.  The [acronym](https://en.wikipedia.org/wiki/Acronym) **RSA** comes from the surnames of [Ron Rivest](https://en.wikipedia.org/wiki/Ron_Rivest), [Adi Shamir](https://en.wikipedia.org/wiki/Adi_Shamir), and [Leonard Adleman](https://en.wikipedia.org/wiki/Leonard_Adleman), who publicly described the algorithm in 1977. An equivalent system was developed secretly, in 1973 at [GCHQ](https://en.wikipedia.org/wiki/Government_Communications_Headquarters) \(the British [signals intelligence](https://en.wikipedia.org/wiki/Signals_intelligence) agency\), by the English mathematician [Clifford Cocks](https://en.wikipedia.org/wiki/Clifford_Cocks). That system was [declassified](https://en.wikipedia.org/wiki/Classified_information) in 1997.

All public-key systems are based on the concept of [_trapdoor functions_](https://en.wikipedia.org/wiki/Trapdoor_function#:~:text=A%20trapdoor%20function%20is%20a,are%20widely%20used%20in%20cryptography.), functions that are simple to compute in one direction but computationally hard to reverse without knowledge of some special information called the _trapdoor_. In RSA, the trapdoor function is based on the [hardness of factoring integers](https://en.wikipedia.org/wiki/Integer_factorization). The function involves the use of a public key$$N $$to encrypt data, which is \(supposed to be\) encrypted in such a way that the function cannot be reversed without knowledge of the prime factorisation of$$N $$, something that should be kept private. Except in certain cases, there exists no efficient algorithm for factoring huge integers.

Further reading: [Shor's algorithm](https://en.wikipedia.org/wiki/Shor%27s_algorithm) 

{% hint style="danger" %}
Formalize the introduction and include a discussion of the security based on the hardness of factoring integers.
{% endhint %}

As far as the strength of RSA is concerned, its measured in key-size or, the modulus size. RSA is no longer considered secure, with the prime reason being that it is susceptible to brute-force attacks which are capable of extracting the private keys within a very short time interval.

### II- Arithmetic for RSA

Before starting to introducing you RSA, a few arithmetic notions need to be introduce to understand perfectly other steps.

### III- Key generation

* We pick two primes $$p$$ and $$q$$
* Using $$p$$ and $$q$$, we calculate modulus $$n = p*q$$ and it's **Euler's totient** $$\phi(n) = (p-1)*(q-1)$$
* Now, chose the **public exponent** $$\mathbb{e}$$such as $$\mathbb{gcd(e, \phi(n)) = 1}$$
* By using the **Extended Euclidean algorithm**, we compute the invert $$\mathbb{d}$$ of $$\mathbb{e \mod n}$$ :$$d \equiv e^{-1} \mod \phi(n)$$ which is our **private exponent**.
* **Public key**: $$n, e$$
* **Private key**: $$n, d$$
* Now, chose a **message** $$\mathbb{m}$$that you convert into integers
* We can encrypt this **plaintext** $$m$$ and receive a **ciphertext** $$c \equiv m^e \mod n$$
* We can decrypt a **ciphertext** $$c$$ with $$m \equiv c^d \mod n$$

### IV- Signature 

### V- Format

### VI- Application: pycryptodome and openSSL

#### Pycryptodome:

Pycryptodome is a python library about cryptography, see the documentation below: [https://www.pycryptodome.org/en/latest/](https://www.pycryptodome.org/en/latest/) There is an example of RSA key generation with pycryptodome:

```python
from Crypto.Util.number import getPrime, bytes_to_long


def generate_keys():
    e = 0x10001    #public exponent e, we generally use this one by default
    while True:
        p = getPrime(512)
        q = getPrime(512)
        phi = (p - 1) * (q - 1)    #Euler's totient 
        d = pow(e, -1, phi)    #Private exponent d
        if d != -1:
            break

    n = p * q
    public_key = (n, e)
    private_key = (n, d)
    return public_key, private_key


def encrypt(plaintext: int, public_key) -> int:
    n, e = public_key
    return pow(plaintext, e, n)    #plaintext ** e mod n


def decrypt(ciphertext: int, private_key) -> int:
    n, d = private_key
    return pow(ciphertext, d, n)   #ciphertext ** d mod n


message = bytes_to_long(b"super_secret_message")
public_key, private_key = generate_keys()
ciphertext = encrypt(message, public_key)
plaintext = decrypt(ciphertext, private_key)
```

#### OpenSSL:

OpenSSL is a robust, commercial-grade, and full-featured toolkit for the Transport Layer Security \(TLS\) and Secure Sockets Layer \(SSL\) protocols. It is also a general-purpose cryptography library

## Proof of Correctness

We now consider $$c^d = m^{ed} = m$$necessary for the successful description of an RSA ciphertext. The core of this result is due to [Euler's theorem](https://en.wikipedia.org/wiki/Euler%27s_theorem) which states

$$
a^{\phi(n)} \equiv 1 \mod n
$$

for all coprime integers $$(a,n)$$ and $$\phi(n)$$ is [Euler's totient function](https://en.wikipedia.org/wiki/Euler%27s_totient_function).

{% hint style="info" %}
As a reminder, we say two integers are coprime if they share no non-trivial factors. This is the same statement that $$\gcd(a,n)=1$$.
{% endhint %}

From the definition of the protocol, we have that

$$
ed \equiv 1 \mod \phi(n), \;\; \Rightarrow \;\; ed = 1 + k\phi(n)
$$

for some $$k \in \mathbb{Z}$$. Combining this with Euler's theorem, we see that we recover $$m$$from the ciphertext

$$
\begin{align}
    c^d  &\equiv (m^e)^d &&\mod n \\
     &\equiv m^{ed} &&\mod n \\
     &\equiv m^{k\phi + 1} &&\mod n \\
     &\equiv m^{k\phi} m &&\mod n \\
     &\equiv (m^\phi)^km &&\mod n \\
     &\equiv 1^km &&\mod n \\
     &\equiv m &&\mod n \\
\end{align}
$$

When the requirement $$\gcd(m, n) = 1$$does not hold, we can instead look at the equivalences modulo $$p$$and $$q$$respectively. Clearly, when $$\gcd(m, n) = n,$$we have that $$c \equiv m \equiv 0 \mod n$$and our correctness still holds. Now, consider the case $$m = k\cdot p,$$where we have that $$c \equiv m \equiv 0 \mod p$$and $$c^d \equiv (m^e)^d \pmod q.$$Since we have already excluded the case that $$\gcd(m, q) = q,$$we can conclude that $$\gcd(m, q) = 1,$$as $$q$$is prime. This means that $$m^{\ell\phi(q)} \equiv 1 \mod q$$and by the multiplicative properties of the $$\phi$$function, we determine that $$m^{\ell_n\phi(n)} = m^{\ell\phi(q)} \equiv 1 \mod q.$$We conclude by invoking the Chinese Remainder theorem with



$$
\begin{align*}
m &\equiv 0 &&\mod p \\
m &\equiv 1^\ell m &&\mod q\\
\end{align*}
$$

 that $$m^{e\cdot d} \equiv m \mod n.$$The case for $$m = k\cdot q$$follows in a parallel manner.



