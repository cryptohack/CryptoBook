---
description: >-
  Tutorial for application with RSA. We are going to use openSSL, openSSH and
  pycryptodome for key generation, key extraction and some implementation with
  python
---

# RSA application

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



#### OpenSSH:

