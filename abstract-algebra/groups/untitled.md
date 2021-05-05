# Discrete Log Problem

## Discrete log problem

Given any group$$G$$and elements$$a,b$$such that $$a^n=b$$, the problem of solving for$$n$$is known as the disctete log problem \(DLP\). In sage, this can be done for general groups by calling `discrete_log`

```python
sage: G = DihedralGroup(99)
sage: g = G.random_element()
sage: discrete_log(g^9,g) # note that if the order of g is less than 9 we would get 9 mod g.order()
9
```

## Discrete log over $$\left(\mathbb Z/n\mathbb Z\right)^*$$

Typically, one considers the discrete log problem in $$\left(\mathbb Z/n\mathbb Z\right)^*$$, i.e. the multiplicative group of integers$$\text{mod }n$$. Explicitly, the problem asks for$$x$$given $$a^x=b\pmod n$$. This can be done by calling `b.log(a)` in sage:

```python
sage: R = Integers(99)
sage: a = R(4)
sage: b = a^9
sage: b.log(a)
9
```

This section is devoted to helping the reader understand which functions are called when for this specific instance of DLP.

When$$n$$is composite and not a prime power, `discrete_log()` will be used, which uses generic algorithms to solve DLP \(e.g. Pohlig-Hellman and baby-step giant-step\).

When $$n=p$$is a prime, Pari `znlog` will be used, which uses a linear sieve index calculus method, suitable for $$p < 10^{50} \sim 2 ^{166}$$.

When $$n = p^k$$, SageMath will fall back on the generic implementation `discrete_log()`which can be slow. However, Pari `znlog` can handle this as well, again using the linear sieve index calculus method. To call this within SageMath we can use either of the following \(the first option being a tiny bit faster than the second\)

```python
x = int(pari(f"znlog({int(b)},Mod({int(a)},{int(n)}))"))
x = gp.znlog(b, gp.Mod(a, n))
```

#### Example

Given a small prime, we can compare the Pari method with the Sage defaults

```python
p = getPrime(36)
n = p^2
K = Zmod(n)
a = K.multiplicative_generator()
b = a^123456789

time int(pari(f"znlog({int(b)},Mod({int(a)},{int(n)}))")) 
# CPU times: user 879 µs, sys: 22 µs, total: 901 µs
# Wall time: 904 µs
# 123456789

time b.log(a)
# CPU times: user 458 ms, sys: 17 ms, total: 475 ms
# Wall time: 478 ms
# 123456789

time discrete_log(b,a)
# CPU times: user 512 ms, sys: 24.5 ms, total: 537 ms
# Wall time: 541 ms
# 123456789
```

We can also solve this problem with even larger primes in a very short time

```python
p = getPrime(100)
n = p^2
K = Zmod(n)
a = K.multiplicative_generator()
b = a^123456789

time int(pari(f"znlog({int(b)},Mod({int(a)},{int(n)}))")) 
# CPU times: user 8.08 s, sys: 82.2 ms, total: 8.16 s
# Wall time: 8.22 s
# 123456789
```

## Discrete log over $$E(k)$$

// elliptic curve discrete log functions

