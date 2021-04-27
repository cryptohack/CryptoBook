# Diffie-Hellman

## Overview

Let's say Alice and Bob want to exchange a secret over an insecure channel. In other words, anyone can read the messages they send, but the goal is to ensure that only Alice and Bob can calculate the secret key.

**Diffie-Hellman key exchange** provides a solution to this seemingly impossible task. Since code may be easier to understand than a detailed explanation, I'll provide it first:

```python
import Crypto.Util.number as cun
import Crypto.Random.random as crr


class DiffieHellman:
    def __init__(self, p: int):
        self.p = p
        self.g = 5
        self.private_key = crr.getrandbits(128)

    def public_key(self) -> int:
        return pow(self.g, self.private_key, self.p)

    def shared_key(self, other_public_key: int) -> int:
        return pow(other_public_key, self.private_key, self.p)


p = cun.getPrime(512)
alice = DiffieHellman(p)
bob = DiffieHellman(p)

shared_key = bob.shared_key(alice.public_key())
assert shared_key == alice.shared_key(bob.public_key())
```

Here's a brief explanation of the code:

* We choose a prime $$p$$ 
* Alice picks a private key $$a$$
* Bob picks a private key $$b$$ 
* Alice's public key is $$g^a$$ 
* Bob's public key is $$g^b$$ 
* Their shared key is $$g^{ab} = (g^a)^b = (g^b)^a$$ 

So anybody observing the messages sent between Alice and Bob would see $$p, g, g^a, g^b$$, but they wouldn't be able to calculate the shared key $$g^{ab}$$.

This is because given $$g$$ and $$g^a$$, it should be infeasible to calculate $$a$$. If this sounds familiar, that's because it's the [Discrete Log Problem](untitled.md).

