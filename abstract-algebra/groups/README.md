# Groups

## Introduction

Modern cryptography is based on the assumption that some **problems** are hard \(unfeasable to solve\). Since the we do not have infinite computational power and storage we usually work with finite messages, keys and ciphertexts and we say they lay in some finite **sets** $$\mathcal{M}, \mathcal{K}$$ and $$\mathcal{C}$$.

Furthermore, to get a ciphertext we usually perform some **operations** with the message and the key.

{% hint style="success" %}
For example in AES128 $$\mathcal{K} = \mathcal{M} = \mathcal{C} = \{0, 1\}^{128}$$since the input, output and keyspace are 128 bits. We also have the encryption and decryption operations

$$Enc: \mathcal{K} \times \mathcal{M} \to \mathcal{C} \\  Dec: \mathcal{K} \times \mathcal{C} \to \mathcal{M}$$
{% endhint %}

The study of **sets**, and different types of **operations** on them is the target of _abstract algebra_. 

In this chapter we will learn the underlying building blocks of cryptosystems and some of the hard problems that the cryptosystems are based on.

## Definition

A set$$G$$with a binary operation $$\cdot:G\times G\to G$$is a **group** if the following requirements hold:

* **Closeness**: For all $$a, b \in G: \ $$ $$a\cdot b \in G$$ - Applying the operation keeps the element in the set
* **Associativity**: For all $$a, b, c \in G: $$ $$(a \cdot b) \cdot c=a\cdot (b\cdot c)$$
* **Identity**: There exists an element$$e\in G$$such that $$a\cdot e=e\cdot a=a$$for all $$a\in G$$
* **Inverse**: For all elements $$a\in G$$, there exists some $$b\in G$$such that $$b\cdot a=a\cdot b=e$$. We usually denote$$b$$as $$a^{-1}$$

For $$n\in\mathbb Z$$, $$a^n$$means $$\underbrace{a\cdot a\dots{}\cdot a}_{n\text{ times}}$$when $$n>0$$and $$\left(a^{-n}\right)^{-1}$$when $$n<0$$. For $$n=0$$, $$a^n=e$$.

If $$ab=ba$$, then $$\cdot$$is **commutative** and the group is called **abelian**. We often denote the group operation by $$+$$instead of $$\cdot$$and we typically use $$na$$instead of $$a^n$$.

**Examples of groups**

Integers modulo $$n$$ \(remainders\) under modular addition  $$= (\mathbb{Z} / n \mathbb{Z},  +)$$. 

$$\mathbb{Z} / n \mathbb{Z} = \{0, 1, ..., n -1\}$$

Let's look if the group axioms are satisfied

1. $$\checkmark$$ $$\forall a, b \in \mathbb{Z}/ n\mathbb{Z} \text{ let }  c \equiv a + b \bmod n$$. 

   Because of the modulo reduction $$c < n \Rightarrow c \in \mathbb{Z}/ n\mathbb{Z} $$ 

2. $$\checkmark$$Modular addition is associative
3. $$\checkmark $$$$0 + a \equiv a + 0 \equiv a \bmod n \Rightarrow 0$$ is the identity element
4. $$\checkmark$$$$\forall a \in \mathbb{Z}/ n\mathbb{Z} $$we take $$n - a \bmod n$$to be the inverse of $$a$$. We check that

    $$a + n - a \equiv n \equiv 0 \bmod n$$

   $$n - a + a \equiv n \equiv 0 \bmod n$$

Therefore we can conclude that the integers mod $$n$$ with the modular adition form a group.

```python
Z5 = Zmod(5) # Techni
print(Z5.list())
# [0, 1, 2, 3, 4]

print(Z5.addition_table(names = 'elements'))
# +  0 1 2 3 4
#  +----------
# 0| 0 1 2 3 4
# 1| 1 2 3 4 0
# 2| 2 3 4 0 1
# 3| 3 4 0 1 2
# 4| 4 0 1 2 3

a, b = Z5(14), Z5(3)
print(a, b)
# 4 3
print(a + b)
# 2
print(a + 0)
# 4
print(a + (5 - a))
# 0

```

**Example of non-groups**

$$(\mathbb{Q}, \cdot)$$ is not a group because we can find the element $$0$$ that doesn't have an inverse for the identity $$1$$

$$(\mathbb{Z}, \cdot)$$is not a group because we can find elements that don't have an inverse for the identity $$1$$

**Exercise**

Is $$(\mathbb{Z} / n \mathbb{Z} \smallsetminus \{0\}, \cdot)$$a group? If yes why? If not, are there values for $$n$$that make it a group?

#### Proprieties

1. The identity of a group is **unique**
2. The inverse of every element is **unique**
3. $$\forall$$ $$a \in G, \left(a^{-1} \right) ^{-1} = g$$. The inverse of the inverse of the element is the element itself
4. $$\forall a, b \in G$$ we have $$(ab)^{-1} = b^{-1}a^{-1}$$

   _Proof:_ $$(ab)(b^{−1}a^{−1}) =a(bb^{−1})a^{−1}=aa^{−1}= e.$$\_\_

```python
n = 11
Zn = Zmod(n)
a, b = Zn(5), Zn(7)
print(n - (a + b))
# 10
print((n - a) + (n - b))
# 10
```

## Examples

// subgroups, quotient groups

// cyclic groups

