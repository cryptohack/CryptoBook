---
description: 'Author: Chuck_bartwoski'
---

# Encryption

## Introduction

A typical application of cryptography is secure communication. Informally a secure communication channel is one that provides both **confidentiality** and **Integrity** of the messages. In this section we investigate confidentiality, therefore we may assume that integrity is already guaranteed by some other means. \(see section on integrity...\#TODO\)

We assume that two parties that want to communicate share a secret key $$k$$. Prior to sending a message, the sender encrypts the message with the secret key, this produces a ciphertext that is then sent.  The receiver uses the same key to decrypt the message and recover the message.

{% hint style="info" %}
Intuitively: A secure encryption scheme will prevent an eavesdropper to learn the content of the message since the ciphertext is unintelligible. The security requirement will be formalized later.
{% endhint %}

## Formal definition

We introduce some notation first: We will use $$\mathcal M$$ to denote the set of al possible message, $$\mathcal K$$ is the set of all possible keys and $$\mathcal C$$ is the set of ciphertexts. 

A symmetric encryption scheme $$\mathcal E$$is a tuple of efficiently computable functions $$(\text{KGen, Enc, Dec})$$.:

* $$\text{KGen}: \diamond \xrightarrow $ \mathcal K$$ Selects a key at random from the key space.
* $$\text{Enc}: \mathcal M \times \mathcal K \mapsto \mathcal C$$. Encrypts the message $$m$$ with the key $$k$$ into a ciphertext $$c = \text{Enc}(m, k)$$. Sometimes written as $$c = \text{Enc}_k(m)$$
* $$\text{Dec}: \mathcal C \times \mathcal K \mapsto \mathcal M \times \{ \bot\}$$. Decrypts the ciphertexts $$c$$ with the key $$k$$ into the message $$m$$ or returns an error \($$\bot$$\). $$m = \text{Dec}(c, k)$$. Sometimes written as $$m = \text{Dec}_k(c)$$

{% hint style="warning" %}
For$$\mathcal E$$ to be useful we need that $$\text{Dec}(\text{Enc}(m,k), k) = m; \forall m,k$$. This is also called **correctness.** 

After all what's the point of confidentially sending a nice Christmas card to your grand children if they wont ****be able to read its content
{% endhint %}

**TODO: security notions and examples**

