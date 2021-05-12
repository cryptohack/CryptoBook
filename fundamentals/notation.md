# Mathematical Notation

## Introduction

Throughout CryptoBook, discussions are made more concise by using various mathematical symbols. For some of you, all of these will feel familiar, while for others, it will feel new and confusing. This chapter is devoted to helping new readers gain insight into the notation used.

{% hint style="info" %}
If you're reading a page and something is new to you, come here and add the symbol, someone else who understands it can explain its meaning
{% endhint %}

## Mathematical Objects

### Special Sets

* $$\mathbb{C}$$: denotes the set of complex numbers
* $$\mathbb{R}$$: denotes the set of real numbers
* $$\mathbb{Z}$$: denotes the set of integers
* $$\mathbb{Q}$$: denotes the set of rational numbers
* $$\mathbb{N}$$: denotes the set of natural numbers \(non-negative integers\)
* $$\mathbb{Z}/n\mathbb Z$$: denotes the set of integers mod $$n$$

```python
"""
We can call each of these sets with Sage using the 
following commands. Comments are the result of the
input.
"""
CC
# Complex Field with 53 bits of precision
RR
# Real Field with 53 bits of precision
ZZ
# Integer Ring
QQ
# Rational Field
NN
# Non negative integer semiring
Zmod(11) # or `Integers(11)` or `IntegerModRing(11)` 
# Ring of integers modulo 11
```

* We refer to unit groups by $$R^\times$$ or $$R^*$$. Example: $$(\mathbb Z/n \mathbb Z)^\times$$
* We refer to finite fields with $$q$$ elements by $$\mathbb{F}_q$$
* We refer to a general field by $$k$$
* We refer to the algebraic closure of this field by $$\bar{k}$$

```python
"""
Example of defining a field and then its 
algebraic closure
"""
GF(3)
# Finite Field of size 3 , where GF stands for Galois Field 
GF(3).algebraic_closure()
# Algebraic closure of Finite Field of size 3
```

```python
"""
If you want to find which field an element belongs to you can use the 
`.parent()` function
"""

x = 7
print(x.parent())
# Integer Ring

y = 3.5
print(y.parent())
# Real Field with 53 bits of precision
```

```python
"""
If you want to "lift" an element from a quotient ring R/I to the ring R
use the `.lift()` function
"""
R = ZZ
RI = Zmod(11)
x =  RI(5)

print(x.parent())
# Ring of integers modulo 11

y = x.lift()
print(y.parent())
# Integer Ring

print(y in R)
# True
```

### Relation operators

* $$\in$$means is an element of \(belongs to\)

### Logical Notation

* $$\forall$$means for all
* $$\exists$$means there exists. $$\exists!$$ means uniquely exists

### Operators

* $$Pr(A)$$ means the probability of an event $$A$$to happen. Sometimes denoted as $$Pr[A]$$or as $$P(A)$$ 



