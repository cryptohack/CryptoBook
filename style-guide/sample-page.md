---
description: A rough guideline to a page
---

# Sample Page

## Introduction

Give a description of the topic, and what you hope the reader will get from this. For example, this page will cover addition of the natural numbers. Talk about how this relates to something in cryptography, either through a protocol, or an attack. This can be a single sentence, or verbose.

## Laws of Addition

For all integers, the addition operation is

* Associative: $$a + (b + c) = (a + b) + c$$
* Commutative: $$a + b = b + a$$
* Distributive: $$a(b + c) = ab + ac$$
* Contains an identity element: $$a + 0 = 0 + a = a$$
* Has an inverse for every element: $$a + (-a) = (-a) + a = 0$$
* Closed: $$\forall    a, b \in \mathbb{Z}, a + b \in \mathbb{Z}$$

###  Interesting Identity

$$
(1 + 2 + 3 + \ldots + n)^2 = 1^3 + 2^3 + 3^3 + \ldots + n^3
$$

### Sage Example

```python
sage: 1 + (2 + 3) == (1 + 2) + 3
True
sage: 1 + 2 == 2 + 1
True
sage: 5*(7 + 11) == 5*7 + 5*11
True
sage: sum(i for i in range(1000))^2 == sum(i^3 for i in range(1000))
True
```

## Further Resources 

* Links to 
* Other interesting 
* Resources



### 

