# Discrete Log Problem

### Using SageMath to Solve the Discrete Log Problem

Given the ring \(or field\) $$\mathbb{K}$$ values $$a,b \in \mathbb{K}$$which are related by

$$
a^x = b \pmod n
$$

we can attempt to compute the value $$x$$using SageMath by calling `b.log(a)`. 

Depending on the group we consider, SageMath will call different functions internally. This section is devoted to helping the reader understand which functions are called when. We focus here on when we work in the group $$F_n^{\star}$$ for some integer $$n$$. For solving the discrete log problem for points on an elliptic curve, see **\(Missing Resource\).**

When $$n$$ is composite and not a prime power, `discrete_log()` will be used, which uses generic algorithms to solve DLP \(eg. pohlig-hellman and baby-step giant-step\).

When $$n=p$$is a prime, Pari `znlog` will be used, which uses a linear sieve index calculus method, suitable for $$p < 10^{50} \sim 2 ^{166}$$.

When $$n = p^k$$, SageMath will fall back on the generic implementation `discrete_log()`which can be slow. However, Pari `znlog` can handle, again using the linear sieve index calculus method. To call this within SageMath we can use

```python
x = int(pari(f"znlog({int(b)},Mod({int(a)},{int(n)}))"))  
```

#### Example

When we pick a small prime, we can compare the Pari method with the SageDefault

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

However, picking a large prime, we find we can solve this problem even with larger primes in a very short time

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

