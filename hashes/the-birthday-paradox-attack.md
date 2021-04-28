# The Birthday paradox / attack

Author: Zademn  
Reviewed by: 

**Prerequisites**

* Probability theory \(for the main idea\)
* Hashes \(an application\)

**Motivation**

* Breaking a hash function \(insert story\)

## The birthday paradox

### Birthday version

* [https://www.youtube.com/watch?v=ofTb57aZHZs](https://www.youtube.com/watch?v=ofTb57aZHZs)

**Question 1**

> What is the probability that 1 person has the same birthday as you?

_Solution_

* Let $$A$$ be the event that someone has the same birthday as you and $$\bar{A}$$ be the complementary event
  * The events are mutually exclusive =&gt; $$Pr(A) = 1 - Pr(\bar{A})$$
* Let $$E_i$$ be the events that person $$i$$ does not have your birthday

Then

* $$Pr(A) = 1 - Pr(\bar{A}) = 1 - \prod_{i=1}^n Pr(E_i) = 1 - \left( \dfrac {364} {365}\right)^n$$
* Reminder $$Pr(A, B) = Pr(A) \cdot Pr(B)$$if $$A, B$$are independent events

**Question 2**

> What is the probability that 2 out of $$n$$ people in a room share the same birthday?

* **Suppose the birthdays are distributed independently and uniformly**

_Solution_

* Let $$A$$ be the event that 2 people have the same birthday, let $$\bar{A}$$ be the complementary event \(no 2 people have the same birthday\)
* Event 1 = Person 1 is born =&gt; $$Pr(E_1) = \dfrac {365} {365}$$
* Event 2 = Person 2 is born on a different day than Person 1 =&gt; $$Pr(E_2) = \dfrac {364} {365}$$  

  $$\vdots$$

* Event n = Person n is born on a different day than Person   $$1,...,n-1 \Rightarrow$$ $$\Rightarrow Pr(E_n) = \dfrac {365-(n-1)} {365}$$

$$Pr(\bar{A}) = Pr(E1) \cdot Pr(E_2) \cdot \dots \cdot Pr(E_n) = \dfrac {365} {365} \cdot \dfrac {364} {365} \cdot \dots \cdot \dfrac {365-(n-1)} {365} = \left( \dfrac {1} {365} \right) ^{n} \cdot \dfrac {365!} {(365-n)!} = \prod{i=1}^{n-1} \left(1 - \dfrac i {365}\right)$$



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

From the taylor approximation we know $$e^x = 1 + x + \dfrac {x^2} {2!} + \dots => e_x\approx 1 + x$$ for $$x \ll 1$$

Apply for each event  $$\Rightarrow x = -a/d => e^{\frac {-a} d} \approx 1- \dfrac a d => Pr(A) = 1 - \prod_{i=1}^{n-1}e^{-i/d} = 1-e^{-\frac {n(n-1)} {2d}} \approx 1-\boxed{e^{-\frac {n^2} {2d}}}$$

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
    t = bin(int(t,16))[2:2+hash_bits] # get the first `hash_bits` bits
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

## Resources

* [https://en.wikipedia.org/wiki/Birthday\_problem](https://en.wikipedia.org/wiki/Birthday_problem)
* [https://en.wikipedia.org/wiki/Birthday\_attack](https://en.wikipedia.org/wiki/Birthday_attack)

