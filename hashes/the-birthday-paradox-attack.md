# The Birthday paradox / attack

Author: Zademn, ireland  
Reviewed by: 

**Prerequisites**

* Probability theory \(for the main idea\)
* Hashes \(an application\)

**Motivation**

* Breaking a hash function \(insert story\)

## The birthday paradox

{% hint style="warning" %}
\*insert story / introduction about why it's called a paradox + use\*
{% endhint %}

### Birthday version

**Question 1**

> What is the probability that 1 person has the same birthday as you?

_Solution_

* Let $$A$$ be the event that someone has the same birthday as you and $$\bar{A}$$ be the complementary event
  * The events are mutually exclusive =&gt; $$Pr(A) = 1 - Pr(\bar{A})$$
* Let $$E_i$$ be the events that person $$i$$ does not have your birthday

Then

* $$Pr(A) = 1 - Pr(\bar{A}) = 1 - \prod_{i=1}^n Pr(E_i) = 1 - \left( \dfrac {364} {365}\right)^n$$

{% hint style="success" %}
Reminder: $$Pr(A, B) = Pr(A) \cdot Pr(B)$$if $$A, B$$are independent events
{% endhint %}

**Question 2**

> What is the probability that 2 out of $$n$$ people in a room share the same birthday?

* **Suppose the birthdays are distributed independently and uniformly**

_Solution_

* Let $$A$$ be the event that 2 people have the same birthday, let $$\bar{A}$$ be the complementary event \(no 2 people have the same birthday\)
* Event 1 = Person 1 is born =&gt; $$Pr(E_1) = \dfrac {365} {365}$$
* Event 2 = Person 2 is born on a different day than Person 1 =&gt; $$Pr(E_2) = \dfrac {364} {365}$$  

  $$\vdots$$

* Event n = Person n is born on a different day than Person   $$1,...,n-1 \Rightarrow$$ $$\Rightarrow Pr(E_n) = \dfrac {365-(n-1)} {365}$$

$$Pr(\bar{A}) = Pr(E1) \cdot Pr(E_2) \cdot \dots \cdot Pr(E_n) = \dfrac {365} {365} \cdot \dfrac {364} {365} \cdot \dots \cdot \dfrac {365-(n-1)} {365} = \left( \dfrac {1} {365} \right) ^{n} \cdot \dfrac {365!} {(365-n)!} = \prod_{i=1}^{n-1} \left(1 - \dfrac i {365}\right)$$



#### **General case**

**Question 1**

* Instead of $$365$$ days we have $$d \Rightarrow \boxed{1 - \left( \dfrac {d-1} {d}\right)^n}$$

**Question 2**

* Instead of $$365$$ days we have $$d \Rightarrow \boxed{1 - \prod_{i=1}^{n-1} \left(1 - \dfrac i {d}\right)}$$

**Code examples**

```python
def my_birthday(n, d):
    return 1 - pow((d-1)/d , n)

def same_birthday(n, d):
    p = 1
    for i in range(1, n): #1 -> n-1
        p*=(1-i/d)
    return 1 - p

print(same_birthday(23, 365), same_birthday(32, 365), same_birthday(100, 365))
# (0.5072972343239854, 0.7533475278503207, 0.9999996927510721)
```

####  An useful approximation

From the Taylor approximation we know $$e^x = 1 + x + \dfrac {x^2} {2!} + \dots => e_x\approx 1 + x$$ for $$x \ll 1$$

Apply for each event  $$\Rightarrow x = -\dfrac a d \Rightarrow  e^{ -a /d} \approx 1- \dfrac a d \Rightarrow  Pr(A) = 1 - \prod_{i=1}^{n-1}e^{-i/d} = 1-e^{-n(n-1) /{2d}} \approx 1-\boxed{e^{-{n^2} / {2d}}}$$

If we want to solve for $$n$$ knowing $$Pr(A)$$ we take the $$\ln$$ =&gt; $$\boxed{n \approx \sqrt{2d \ln \left(\dfrac 1 {1-Pr(A)}\right)}}$$

```python
def approx_same_birthday(n, d):
    return 1 - pow(e, -pow(n, 2) / (2*d)).n()
    
print(approx_same_birthday(23, 365)) 
print(approx_same_birthday(32, 365))
print(approx_same_birthday(100, 365))

# 0.515509538061517
# 0.754077719532824
# 0.999998876014983
```

### Finding a collision

* Let $$H:\mathcal{M} \longrightarrow \mathcal{T}$$ be a hash function with $$|\mathcal{M}| >> |T|$$
* Let's denote $$N = |\mathcal{T}|$$

**Algorithm** 

1. Choose $$s \approx \sqrt{N}$$ random distinct messages in $$\mathcal{M}$$ 

2. Compute $$t_i = H(m_i)$$ for $$1\leq i \leq \sqrt{N}$$   

3. Look for $$(t_i = t_j) \to$$  If not found go to step 1

**Example:** 

Consider the following hash function: 

```python
import hashlib
import random
from Crypto.Util.number import long_to_bytes, bytes_to_long

def small_hash(m, hash_bits):
    '''
    Arguments
        m: bytes -- input
        hash_bits: int -- number of bits
    Returns:
        {bytes} - hash of the message of dimension `hash_bits`
        '''
    t = hashlib.sha256(m).hexdigest() # the hash in bytes
    t = bin(int(t, 16))[2:2+hash_bits] # get the first `hash_bits` bits
    t = int(t, 2) # transform it back to int
    return long_to_bytes(t) # return hash digest
```

We make the following function to find the hashes:

```python

def small_hash_colision(M_bits, T_bits):
    '''
    Arguments
        M_bits: int -- dimension of the message space
        T_bits: int -- dimension of the hash space
    Returns:
        {(bytes, bytes, bytes)} -- message1, message2, hash
        or
        {(b'', b'', b'')} -- if no collision found
    '''
    N = 1<<T_bits 
    print('Hash size: ', N)
    # This is `s`
    num_samples = 1 * isqrt(N)
    num_samples += num_samples//5 + 1 # num_samples = 1.2 * isqrt(N) + 1
    print(f'Making a list of {num_samples} hashes')
    print(f'Probability of finding a collision is {same_birthday(num_samples, N)}')
    
    m_list = []
    t_list = []
    
    # Make a list of hashes
    for i in range(num_samples):
        m = random.getrandbits(M_bits) # Get random message
        #m = random.randint(0, M_bits-1) 
        m = long_to_bytes(m)
        
        t = small_hash(m, T_bits) # Hash it
        if m not in m_list:
            m_list.append(m)
            t_list.append(t)
            
    # Check for collisionn
    for i in range(len(t_list)):
        for j in range(i+1, len(t_list)):
            if t_list[i] == t_list[j]:
                print('Collision found!')
                return m_list[i], m_list[j], t_list[i]
    else:
        print('Collision not found :(')
        return b"", b"", b""
```

We use it as follows:

```python
M_bits = 30
T_bits = 20

m1, m2, t = small_hash_colision(M_bits, T_bits)
print(m1, m2, t)
print(small_hash(m1, bit_range) == small_hash(m2, bit_range))

# Hash size:  1048576
# Making a list of 1229 hashes
# Probability of finding a collision is 0.513213460854798
# Collision found!
# b'\x12\xd2\xe9\x9d' b';c\x0f\x85' b'\x0b|\xce'
# True

```

## Eliminating Storage Requirements with Pollard's Rho

While the above algorithm works to find a hash collision in time $$O(\sqrt N )$$, it also requires storing $$O(\sqrt N )$$hash values. As such, it represents a classic time-space tradeoff over the naive approach, which involves randomly selecting pairs of inputs until they hash to the same value. While the naive approach does not require any additional storage, it does have runtime $$O(N )$$.

However, there is a better approach combining the best of both worlds: constant storage requirements and $$O(\sqrt N)$$runtime. This approach is based on Pollard's Rho algorithm, which is better-known for its application to solving discrete logarithms. The core insight behind the algorithm is that by the Birthday Paradox, we expect to encounter a hash collision after trying $$O(\sqrt N)$$random inputs. However, it is possible to detect whether a collision has occured without needing to store all of the inputs and hashes if the inputs are chosen in a clever way.

This is done by choosing the next input based on the hash of the previous input, according to the following sequence:

$$
x_0 =  g(seed) \\
x_1 = g(H(x_0)) \\
x_2 = g(H(x_1)) \\
\dots \\
x_{n+1} = g(H(x_n)) \\
$$

Where $$H:\mathcal{M} \longrightarrow \mathcal{T}$$ is our hash function and $$g: \mathcal{T} \longrightarrow \mathcal{M} $$ is a "sufficiently random" function which takes a hash value and produces a new. We define the composition of the functions to be$$f = H \circ g : \mathcal{T} \longrightarrow \mathcal{T} $$. 

```python
# TODO:
# have the two hash functions used in this chapter be the same

from Crypto.Hash import SHA256
from Crypto.Util.number import bytes_to_long, long_to_bytes

from tqdm.autonotebook import tqdm

# bits in hash output
n = 30

# H
def my_hash(x):
    x = bytes(x, 'ascii')
    h = SHA256.new()
    h.update(x)
    y = h.digest()
    y = bytes_to_long(y)
    y = y % (1<<n)
    y = int(y)
    return y

# g
def get_message(r):
    x = "Crypto{" + str(r) + "}"
    return x

# f
def f(r):
    return my_hash(get_message(r))

```

By the Birthday Paradox, we expect that the sequence will have a collision \(where $$x_i = x_j$$ for two distinct values $$i,j$$\) after $$O(\sqrt N)$$values. But once this occurs, then the sequence will begin to cycle, because $$x_{i+1} = g(H(x_i)) = g(H(x_j)) = x_{j+1}$$.

Therefore, we can detect that a collision has occurred by using standard cycle-detection algorithms, such as [Floyd's tortoise and hare](https://en.wikipedia.org/wiki/Cycle_detection#Floyd's_tortoise_and_hare)!

And finally, we can locate the first place in the sequence where the collision occurred, which will let us determine what the colliding inputs to the hash function are. This is done by determining how many iterations apart the colliding inputs are, and then stepping together one iteration at a time until the collision occurs.

For Floyd's tortoise and hare, this is done by noting that when we found our collision after $$n$$ iterations, we were comparing $$H(x_{n}) = H(x_{2 n})$$. And because the sequence is cyclic, if the first colliding input is $$x_i$$, then it collides with$$H(x_{i}) = H(x_{i+n})$$. So we define the new sequence $$y_i = x_{n+i}$$, and step through the $$x_i$$ and $$y_i$$ sequences together until we find our collision!

This is implemented in the following code snippet.

```python
"""
initialization

This routine will find a hash collision in sqrt time with constant space.
"""

seed = 0

x0 = get_message(seed)
x = x0
y = f(x)

"""
detect collision
using Floyd / tortoise and hare cycle finding algorithm

expected number of iterations is ~ sqrt(pi/2) * 2^(n/2),
we run for up to 4 * 2^(n/2) iterations
"""
for i in tqdm(range(4 << (n//2))):
        
    if f(x) == f(y):
        break
        
    x = f(x)
    
    y = f(y)
    y = f(y)
    

"""
locate collision
"""
x = x0
y = f(y)


for j in tqdm(range(i)):
    if f(x) == f(y):
        break
    
    x = f(x)
    
    y = f(y)
    

m1 = get_message(x)
m2 = get_message(y)

assert my_hash(m1) == f(x)
assert my_hash(m2) == f(y)

print("[+] seeds for messages: {}, {}".format(x, y))
print("[+] messages: {}, {}".format(m1, m2))
print("[+] collided hashes of messages: {}, {}".format(my_hash(m1), my_hash(m2)))


# 31%    40391/131072 [00:03<00:08, 10666.20it/s]
# 30%    12032/40391 [00:00<00:02, 13112.15it/s]
# 
# [+] seeds for messages: 404842900, 254017312
# [+] messages: Crypto{404842900}, Crypto{254017312}
# [+] collided hashes of messages: 1022927209, 1022927209
```

Finally, there is a third algorithm for finding hash collisions in $$O(\sqrt N)$$time, namely the [van Oorschot-Wiener algorithm](https://people.scs.carleton.ca/~paulv/papers/JoC97.pdf) based on Distinguished Points. While it does have additional storage requirements over Pollard's Rho, the main advantage of this algorithm is that it parallelizes extremely well, achieving $$O(\frac{\sqrt N}{m})$$runtime when run on $$m$$ processors.

## Resources

* [https://en.wikipedia.org/wiki/Birthday\_problem](https://en.wikipedia.org/wiki/Birthday_problem) - wiki entry
* [https://en.wikipedia.org/wiki/Birthday\_attack](https://en.wikipedia.org/wiki/Birthday_attack) - wiki entry
* [https://www.youtube.com/watch?v=ofTb57aZHZs](https://www.youtube.com/watch?v=ofTb57aZHZs) - vsauce2 video
* [van Oorschot-Wiener Parallel Collision Search with Cryptanalytic Applications](https://people.scs.carleton.ca/~paulv/papers/JoC97.pdf)
* [http://www.cs.umd.edu/~jkatz/imc/hash-erratum.pdf](http://www.cs.umd.edu/~jkatz/imc/hash-erratum.pdf)
* [https://crypto.stackexchange.com/questions/3295/how-does-a-birthday-attack-on-a-hashing-algorithm-work?rq=1](https://crypto.stackexchange.com/questions/3295/how-does-a-birthday-attack-on-a-hashing-algorithm-work?rq=1)

