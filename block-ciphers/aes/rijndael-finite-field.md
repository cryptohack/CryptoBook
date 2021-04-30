# Rijndael Finite Field

{% hint style="info" %}
A first time reader might skip this section and go directly to the description of the round transformations, then come back later \(it is mostly useful to understand the construction of the operation `MC` and `SB`\).
{% endhint %}

Each byte in AES is viewed as an element of a binary finite field of $256$ elements, where it can always be represented as a polynomial of degree at most 7 with coefficients in $$\mathbf{F}_2$$. The construction of the finite field is made as the quotient ring $$\mathbf{F}_2[x]/f(x)$$, where$$f$$is an irreducible polynomial of degree 8 in $$\mathbf F_2[x]$$ so the ring becomes a field.

For AES, the choice for $$f$$is

$$
f(x) = x^8 + x^4 + x^3 + x + 1.
$$

We can check with SageMath that it is irreducible:  


```python
F2 = GF(2)
K.<x> = F2[]
f = x^8 + x^4 + x^3 + x + 1
f.is_irreducible()
# True
```

## Matching Bytes as Finite Field Elements

A byte $$b$$ is composed of 8 bits $$(b_7, \ldots, b_0)_2$$ and is matched to a polynomial as

$$
b_7x^7 + b_7 x^6 + \cdots + b_1 x + b_0.
$$

For instance, take the byte `3a` whose binary decomposition is $$(0, 0, 1, 1, 1, 0, 1, 0)_2$$ and becomes the polynomial

$$
0\cdot x^7 + 0\cdot x^6 + 1\cdot x^5 + 1\cdot x^4 + 1\cdot x^3 + 0\cdot x^2 + 1\cdot x + 0 = x^5 + x^4 + x^3 + x.
$$

## Polynomial Reduction

Polynomials of degree 8 or more can always be reduced, using the fact that in the finite field, we have $$f(x) = 0$$ , so we have the relation

$$
x^8 = x^4 + x^3 + x + 1
$$

> Why not $$x^8 = - x^4 - x^3 - x - 1$$? In fact, that's also true, but the coefficient are in $$\mathbf F_2$$ so the additive inverse$$-1$$ of $$1$$ is itself.

In SageMath, this reduction can be produced in one of the following methods.

Method 1: Remainder of an Euclidean division by $$f$$ 

```python
(x^8 + x^6 + x^4 + 1) % f
# x^6 + x^3 + x
```

**Method 2**: Image in the quotient ring $$\mathbf{F}_2[x]/f(x)$$

```python
R = K.quotient(f)
R(x^8 + x^6 + x^4 + 1)
# xbar^6 + xbar^3 + xbar
```

**Method 3**: Using the Finite Field class of SageMath directly.

```python
F.<x> = GF(2^8, modulus=x^8 + x^4 + x^3 + x + 1)
x^8 + x^6 + x^4 + 1
# x^6 + x^3 + x
```

On this page we use this last method. Also, this helper converts an element of the finite field to an hexadecimal representation of a byte, and could be useful in the examples:

```python
def F_to_hex(a):
    L = a.polynomial().list()
    return sum(ZZ(L[i])*2^i for i in range(len(L))).hex()

b = x^4 + x^3 + x + 1
F_to_hex(b)
# '1b'
```

## Addition

The addition of two polynomials is done by adding the coefficients corresponding of each monomial:

$$
\sum_{i=0}^7 a_ix^i + \sum_{i=0}^7 b_ix^i = \sum_{i=0}^7(a_i + b_i)x^i.
$$

And as the addition of the coefficients is in $$\mathbf{F}_2$$ , it corresponds to the bitwise `xor` operation on the byte.

## Multiplication

Multiplication of two polynomials is more complex \(one example would be the [Karatsuba algorithm](https://en.wikipedia.org/wiki/Karatsuba_algorithm), more efficient than the naive algorithm\). For an implementation of AES, it is possible to only use the multiplication by $$x$$, whose byte representation is `02`.

Let $$b_7x^7 + \cdots + b_1x + b_0$$ an element and we consider the multiplication by $$x$$ :

$$
x\times (b_7x^7 + \cdots + b_1x + b_0) = b_7x^8 + b_6x^7 + \cdots b_1 x^2 + b_0x.
$$

All coefficients are shifted to a monomial one degree higher. Then, there are two cases:

* If $$b_7$$ is $$0$$ , then we have a polynomial of degree at most 7 and we are done;
* If $$b_7$$ is $$1$$ , we can replace$$x^8$$by $$x^4 + x^3 + x + 1$$ during the reduction phase:

$$
\begin{align*}
x\times (x^7 + b_6x^6 + \cdots + b_1x + b_0) & = x^8 + b_6x^7 + \cdots b_1 x^2 + b_0x \\
& = (x^4 + x^3 + x + 1) + b_6x^7 + \cdots + b_1x^2 + b_0x
\end{align*}
$$

This can be used to implement a very efficient multiplication by $$x$$ with the byte representation:

1. A bitwise shiftleft operation: `(b <<  1) & 0xff`;
2. Followed by a conditional addition with `1b` if the top bit of $$b$$ is $$1$$.

Here an example in SageMath \(we use the finite field construction of method 3\):

```python
b = x^7 + x^5 + x^4 + x^2 + 1
F_to_hex(b)
# 'b5'
(2*0xb5 & 0xff) ^^ 0x1b).hex() == F_to_hex(x*b)    # the xor in Sage is "^^"
# True
```



