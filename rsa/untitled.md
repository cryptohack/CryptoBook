# Overview

Here's a some code demonstrating RSA encryption and decryption:

```python
import Crypto.Util.number as cun


def generate_keys():
    e = 0x10001
    while True:
        p = cun.getPrime(512)
        q = cun.getPrime(512)
        phi = (p - 1) * (q - 1)
        d = cun.inverse(e, phi)
        if d != -1:
            break

    n = p * q
    public_key = (n, e)
    private_key = (n, d)
    return public_key, private_key


def encrypt(plaintext: int, public_key) -> int:
    n, e = public_key
    return pow(plaintext, e, n)


def decrypt(ciphertext: int, private_key) -> int:
    n, d = private_key
    return pow(ciphertext, d, n)


message = cun.bytes_to_long(b"super_secret_message")
public_key, private_key = generate_keys()
ciphertext = encrypt(message, public_key)
plaintext = decrypt(ciphertext, private_key)
assert plaintext == message
```

To summarize:

* We pick two primes $$p$$ and $$q$$
* Using $$p$$ and $$q$$, we calculate Euler's totient $$\phi$$
* We compute the private exponent $$d \equiv e^{-1} \mod \phi$$ and check that it exists
* Public key: $$n, e$$
* Private key: $$n, d$$
* We can encrypt a plaintext $$m$$ and receive a ciphertext $$c \equiv m^e \mod n$$
* We can decrypt a ciphertext $$c$$ with $$m \equiv c^d \mod n$$

## Proof of Correctness

We now consider $$c^d = m^{ed} = m$$necessary for the successful decrption of an RSA ciphertext. The core of this is due to Euler's theorem which states

$$
a^{\phi(n)} \equiv 1 \mod n
$$

for all coprime integers $$(a,n)$$.

{% hint style="info" %}
As a reminder, we say two integers are coprime if they share no non-trivial common factors. This is the same statement that $$\gcd(a,n)=1$$.
{% endhint %}

From the defintion of the protocol, we have that

$$
ed \equiv 1 \mod \phi(n), \;\; \Rightarrow \;\; ed = 1 + k\phi(n)
$$

for some $$k \in \mathbb{Z}$$. Combining this with Euler's theorem, we see that we recover $$m$$from the cipher text

$$
\begin{align}
    c^d  &\equiv (m^e)^d &&\mod n \\
    m &\equiv m^{ed} &&\mod n \\
    m &\equiv m^{k\phi + 1} &&\mod n \\
    m &\equiv m^{k\phi} m &&\mod n \\
    m &\equiv (m^\phi)^km &&\mod n \\
    m &\equiv 1^km &&\mod n \\
    m &\equiv m &&\mod n \\
\end{align}
$$

