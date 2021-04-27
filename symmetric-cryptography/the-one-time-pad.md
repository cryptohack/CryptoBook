---
description: 'Author: chuck_bartowski'
---

# The One Time Pad

{% hint style="warning" %}
Note and question: Ideally we should have a separate section on encryption schemes and their formalism\(Kgen, Enc, Dec...\) then we can refactor out this text from here. 
{% endhint %}

### Introduction

A typical application of cryptography is secure communication. Informally a secure communication channel is one that provides both **confidentiality** and **Integrity** of the messages. In this section we investigate confidentiality, therefore we may assume that integrity is already guaranteed by some other means. \(see section on integrity...\#TODO\)

### Encryption

A sender typically "encrypts" a message, this produces a ciphertext that is then sent. A secure encryption scheme will prevent an eavesdropper to learn the content of the message since the ciphertext is unintelligible. 

### The One-Time Pad

The One Time Pad \(OTP\) is a well example of encryption schemes that provide "perfect secrecy". Informally, this means that observing a ciphertext does no give any information to the eavesdropper. A proof of this fact will be provided later. **Crucially we will assume that the sender and the receiver have both access to a common source of random bits.** 

### XOR as a One-Time Pad

XOR\(addition modulo 2\) can be used as an encryption scheme as follows: 

* The message to be sent $m$ is represented as a bitstring
* The sender generates a random key $k$ that is a bitstring of the same length as $m$
* The ciphertext is $c = m \oplus k$  

{% hint style="info" %}
In Python snippet with use to `os` module to generate random bits. Although messages, keys and ciphertext are byte arrays; they are still bit strings
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

