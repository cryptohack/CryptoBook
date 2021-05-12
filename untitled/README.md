---
description: >-
  Will be introduced in this page the fundamentals of RSA, mathematical
  requirement and also some application with python and openSSL.
---

# RSA

{% hint style="warning" %}
This page is pretty long, probably could be split up

Edit: I haved deleted the last part, application with RSA, and i made a special part for this. Maybe we can do the same with the second part: Arithmetic for RSA.
{% endhint %}

### I- Introduction:

RSA is a [public-key cryptosystem](https://en.wikipedia.org/wiki/Public-key_cryptography) that is widely used in the world today to provide a secure transmission system to millions of communications, is one of the oldest such systems in existence.  The [acronym](https://en.wikipedia.org/wiki/Acronym) **RSA** comes from the surnames of [Ron Rivest](https://en.wikipedia.org/wiki/Ron_Rivest), [Adi Shamir](https://en.wikipedia.org/wiki/Adi_Shamir), and [Leonard Adleman](https://en.wikipedia.org/wiki/Leonard_Adleman), who publicly described the algorithm in 1977. An equivalent system was developed secretly, in 1973 at [GCHQ](https://en.wikipedia.org/wiki/Government_Communications_Headquarters) \(the British [signals intelligence](https://en.wikipedia.org/wiki/Signals_intelligence) agency\), by the English mathematician [Clifford Cocks](https://en.wikipedia.org/wiki/Clifford_Cocks). That system was [declassified](https://en.wikipedia.org/wiki/Classified_information) in 1997.

All public-key systems are based on the concept of [_trapdoor functions_](https://en.wikipedia.org/wiki/Trapdoor_function#:~:text=A%20trapdoor%20function%20is%20a,are%20widely%20used%20in%20cryptography.), functions that are simple to compute in one direction but computationally hard to reverse without knowledge of some special information called the _trapdoor_. In RSA, the trapdoor function is based on the [hardness of factoring integers](https://en.wikipedia.org/wiki/Integer_factorization). The function involves the use of a public key$$N $$to encrypt data, which is \(supposed to be\) encrypted in such a way that the function cannot be reversed without knowledge of the prime factorisation of$$N $$, something that should be kept private. Except in certain cases, there exists no efficient algorithm for factoring huge integers.

Further reading: [Shor's algorithm](https://en.wikipedia.org/wiki/Shor%27s_algorithm)

{% hint style="danger" %}
Formalize the introduction and include a discussion of the security based on the hardness of factoring integers.
{% endhint %}

### II- Arithmetic for RSA

Before starting to introducing you RSA, a few arithmetic notions need to be introduce to understand perfectly other steps.

### III- Key generation

* We pick two primes $$p$$ and $$q$$
* Using $$p$$ and $$q$$, we calculate modulus $$n = p*q$$ and its **Euler's totient** $$\phi(n) = (p-1)*(q-1)$$
* Now, choose the **public exponent** $$\mathbb{e}$$such as $$\mathbb{gcd(e, \phi(n)) = 1}$$
* By using the **Extended Euclidean algorithm**, we compute the invert $$\mathbb{d}$$ of $$\mathbb{e \mod n}$$ :$$d \equiv e^{-1} \mod \phi(n)$$ which is our **private exponent**.
* **Public key**: $$n, e$$
* **Private key**: $$n, d$$
* Now, chose a **message** $$\mathbb{m}$$that you convert into integers
* We can encrypt this **plaintext** $$m$$ and receive a **ciphertext** $$c \equiv m^e \mod n$$
* We can decrypt a **ciphertext** $$c$$ with $$m \equiv c^d \mod n$$

### IV- Signature 

A digital signature is a proof of the authenticity of a message, i.e. a proof that the message has not been tampered with. RSA allows us to sign messages by "encrypting" them using the private key, the result being a _signature_ that anyone can verify by "decrypting" it with the public key and comparing it to the  associated message. Any attempt to tamper with the message will result in it no longer matching the signature, and vice-versa. Futhermore, a signature can only be generated using the private key, making it a secure and efficient method of confirming the authenticity of messages. 

Say Alice wants to send a message to Bob, but does not want Mallory, who has established herself as a middleman, to make changes to the message or swap it out entirely. Fortunately, Bob knows Alice's public key, and since $$e$$ and $$d$$ are inverses such that $$ed \equiv 1\mod  \phi(n)$$, Alice can sign her message $$m$$ by "encrypting" it with the private key such that $$s \equiv m^d \mod n$$, where $$s$$ is the signature verifying that the message came from Alice. Alice can now send $$m$$ and $$s$$ to Bob, who is now able to check the authenticity of the message by checking if $$m \equiv s^e \mod n$$. If Mallory tries to change $$m$$, this congruence no longer holds, and since she does not have the private key, she is also unable to provide a maching $$s$$for her tampered message.

### V- Format



