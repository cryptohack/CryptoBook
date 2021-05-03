# Modular Arithmetic

## Introduction

Thinking not over the integers as a whole but modulo some integer$$n$$instead can prove quite useful in a number of situation. This chapter attempts to introduce to you the basic concepts of working in such a context.

## Congruences

For the following chapter, we will assume$$n$$is a natural integer, and$$a$$and$$b$$are two integers. We say that$$a$$and$$b$$are _congruent_ modulo$$n$$when$$n\mid b-a$$, or equivalently when there is an integer$$k$$such that$$a=b+kn$$. We denote this by$$a\equiv b~ [n]$$or $$a \equiv b\mod n$$. I will use the first notation throughout this chapter.

> Remark: When$$b\neq0$$, we have$$a\equiv r~[b]$$, where$$r$$is the remainder in the euclidean division of$$a$$by$$b$$.

  
This relation has a number of useful properties:

* $$\forall c\in \mathbb Z, a\equiv b~[n] \implies ac \equiv bc ~ [n]$$
* $$\forall c \in \mathbb Z, a\equiv b~[n] \implies a+c\equiv b+c ~[n]$$
* $$\forall c \in \mathbb Z, a \equiv b ~[n] \text{ and } b\equiv c~[n]\implies a\equiv c ~[n]$$
* $$\forall m \in \mathbb N, a\equiv b~[n] \implies a^m\equiv b^m ~[n]$$

Seeing as addition and multiplication are well defined, the integers modulo$$n$$form a ring, which we note$$\mathbb Z/n\mathbb Z$$. In sage, you can construct such ring with either of the following

```python
Zn = Zmod(5)
Zn = Integers(5)
Zn = IntegerModRing(5)
# Ring of integers modulo 5
Zn(7)
# 2
Zn(8) == Zn(13)
# True
```

Powering modulo$$n$$is relatively fast, thanks to the [double-and-square](https://en.wikipedia.org/wiki/Exponentiation_by_squaring) algorithm, so we needn't worry about it taking too much time when working with high powers

```python
pow(2, 564654533, 7) # Output result as member of Z/7Z
# 4
power_mod(987654321, 987654321, 7) # Output result as simple integer
# 6
Zmod(7)(84564685)^(2^100) # ^ stands for powering in sage. To get XOR, use ^^.
# 5
```

## Modular Inverse

Since we can multiply, a question arises: can we divide? The answer is yes, under certain conditions. Dividing by an integer$$c$$is the same as multiplying by its inverse; that is we want to find another integer$$d$$such that$$cd\equiv 1~[n]$$. Since$$cd\equiv 1~[n]\iff\exists k\in\mathbb Z, cd = 1 + kn$$, it is clear from [Bézout's theorem](https://en.wikipedia.org/wiki/B%C3%A9zout%27s_theorem) that such an inverse exists if and only if$$\gcd(c, n) = 1$$. Therefore, the _units_ modulo$$n$$are the integers coprime to$$n$$, lying in a set we call the unit group modulo$$n$$: $$\left(\mathbb Z/n\mathbb Z\right)^\times$$

```python
Zn = Zmod(10)
Zn(7).is_unit()
# True
Zn(8).is_unit()
# False
3 == inverse_mod(7, 10) == 1/Zn(7) == pow(7,-1,10) # The latter is a python built-in
# True
Zn(3)/7
# 9
Zn(3)/8
# ZeroDivisionError: inverse of Mod(8, 10) does not exist
Zn.unit_group()
# Multiplicative Abelian group isomorphic to C4 (C4 being the cyclic group of order 4)
```

Finding the modular inverse of a number is an easy task, thanks to the [extended euclidean algorithm](https://en.wikipedia.org/wiki/Extended_Euclidean_algorithm) \(that outputs solutions in$$d$$and$$k$$to the equation$$cd-kn=1$$from above\).

```python
xgcd(7, 10) # find (gcd(a, b), u, v) in au + bv = gcd(a, b)
# (1, 3, -2) <-- (gcd(7, 10), d, -k)
```

