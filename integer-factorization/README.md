# Integer Factorization

### Overview

Given a composite integer $$n$$, can it be decomposed as a product of smaller integers \(hopefully as a unique product of prime factors\)?

As easy as it may sound, integer factorization in polynomial time on a classical computer stands one of the unsolved problems in computation for centuries!

Lets start dumb, all we need to do is check all the numbers $$1 < p < n$$ such that $$p|n$$or programmatically `n%p==0`  

```python
def factors(n):
    divisors = []
    for p in range(1,n):
        if n%p==0:
            divisors.append(p)
    return divisors
```

Seems like its an $$O(n)$$algorithm! whats all the deal about?  
By polynomial time, we mean polynomial time in $$b$$when $$n$$is a b-bit number, so what we looking at is actually a $$O(2^b)$$which is actually exponential \(which everyone hates\)

Now taking a better look at it, one would realize that a factor of $$n$$can't be bigger than $$\sqrt{n}$$  
Other observation would be, if we already checked a number \(say 2\) to not be a divisor, we dont need to check any multiple of that number since it would not be a factor.





