---
description: 'Author: chuck_bartowski'
---

# The One Time Pad

### Introduction

The One Time Pad \(OTP\) is a well known example of encryption schemes that provide "perfect secrecy". Informally, this means that observing a ciphertext does no give any information to the eavesdropper. A proof of this fact will be provided later. **Crucially we will assume that the sender and the receiver have both access to a common source of random bits.** 

### XOR as a One-Time Pad

XOR\(addition modulo 2\) can be used as an encryption scheme as follows: The message space is $$\mathcal M \subseteq \{0, 1\}^n$$\(i.e.: length n bit strings\), the key space is $$\mathcal K = \{0, 1\}$$ and the ciphertext space is also $$\{0,1\}$$

* Encryption: $$\text{Enc}(m,k) = m \oplus k$$
* Decryption:$$\text{Dec}(c,k) = c \oplus k$$

{% hint style="success" %}
The correctness of the schemes is easily verifiable. If the encryption produces $$c = m \oplus k$$, then the decryption produces $$m' = c \oplus k = m \oplus k \oplus k = m$$.
{% endhint %}

{% hint style="info" %}
In the Python snippet below with use to `os` module to generate random bits. 
{% endhint %}

```python
import os

def xor(a,b):
    res = bytes([x^y for (x,y) in zip(a,b)])
    return res
    
message = b"YELLOW SUBMARINE"
key = os.urandom(len(message))
ciphertext = xor(message, key)
recovered = xor(ciphertext, key)
print(f"Message: {message}\nKey: {key}\nCiphertext: {ciphertext}\nrecovered: {recovered}")
# A possible ouput might be as below
# Message: b'YELLOW SUBMARINE'
# Key: b'\x8e<3\xc9\x8d\xbaD\x16Zb\x1b\xbb\xb3\x0c@<'
# Ciphertext: b'\xd7y\x7f\x85\xc2\xeddE\x0f V\xfa\xe1E\x0ey'
# recovered: b'YELLOW SUBMARINE'
```

As seen above the receiver with access to the same key can recover the message. 

### Generalized One-Time Pad

Although XOR is commonly used for the OTP, OTP can be made out of more general objects. If fact We can define an OTP if the message and the keys are objects from a set with a group like structure. \(see GroupTheorySection \#TODO\)

