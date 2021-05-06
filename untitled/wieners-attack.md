# Wiener's Attack

Wiener's attack is an attack on RSA that uses continued fractions to find the private exponent $$d$$ when it's small \(less than $$\frac{1}{3}\sqrt[4]{n}$$, where $$n$$ is the modulus\). We know that when we pick the public exponent $$e$$ to be a small number and calcute its inverse $$d \equiv \frac{1}{e} (\mod \phi(n))$$

### Wiener's theorem

Wiener's attack is based on the following theorem:

Let $$n = pq$$, with $$q < p < 2q$$. Let $$d < \frac{1}{3}\sqrt[4]{n}$$. Given $$n$$ and $$e$$ with $$ed \equiv 1 (\mod \phi(n))$$, the attacker can efficiently recover $$d$$.

### Some observations on RSA

In order to better understand Wiener's Attack, it may be useful to take note of certain properties of RSA:

We may start by noting that the congruence $$ed \equiv 1 (\mod \phi(n))$$ can be written as the equality $$ed = k\phi(n)+1$$ for some value $$k$$, we may additionally note that $$\phi(n) = (p-1)(q-1) = pq - p - q + 1$$, since both $$p$$ and $$q$$ are much shorter than $$pq = n$$, we can say that $$\phi(n) \approx n$$.

Dividing the former equation by $$d\phi(n)$$ gives us $$\frac{e}{\phi(n)} = \frac{k+1}{d}$$, and using the latter approximation, we can write this as $$\frac{e}{n} \approx \frac{k}{d}$$. Notice how the left-hand side of this equation is composed entirely of public information, this will become important later.

It is possible to quickly factor $$n$$ by knowing $$n$$ and $$\phi(n)$$. Consider the quadratic polynomial $$(x-q)(x-p)$$, this polynomial will have the roots $$p$$ and $$q$$. Expanding it gives us $$x^2 - (p + q)x + pq$$, and substituting for the variables we know we can write this as $$x^2 - (n - \phi(n) + 1)x + n$$. Applying the quadratic formula gives us $$p$$ and $$q$$: $$p \wedge q = \frac{-b \pm \sqrt{b^2-4ac}}{2a}$$, where $$a = 1$$, $$b = n - \phi(n) + 1$$, and $$c = n$$.

Wiener's attack works by expanding $$\frac{e}{n}$$ to a continued fraction and iterating through the terms to check various approximations of $$\frac{k}{d}$$. In order to make this checking process more efficient, we can make a few observations \(this part is optional\):

* Since $$\phi(n)$$ is even, and $$e$$ and $$d$$ are both by definition coprime to $$\phi(n)$$, we know that $$d$$ is odd.
* Given the above equations and the values of $$e$$, $$n$$, $$d$$, and $$k$$, we can solve for $$phi(n)$$ with the equation $$phi(n) = \frac{ed-1}{k}$$, thus we know that $$ed-1$$ has to be divisible by $$k$$.
* If our $$\phi(n)$$ is correct, the polynomial $$x^2 - (n - \phi(n) + 1)x + n$$ will have roots $$p$$ and $$q$$, which we can verify by checking if $$pq = n$$.

### The Attack

Suppose we have the public key $$(n, e)$$, this attack will determine $$d$$

1. Convert the fraction $$\frac{e}{n}$$ into a continued fraction $$[a_0;a_1,a_2, \ldots , a_{k-2},a_{k-1}, a_k]$$
2. Iterate over each convergent in the continued fraction: $$\frac{a_{0}}{1},a_{0} + \frac{1}{a_{1}},a_{0} + \frac{1}{a_{1} + \frac{1}{a_{2}}}, \ \ldots, a_{0} + \frac{1}{a_{1} + \frac{\ddots} {a_{k-2} + \frac{1}{a_{k-1}}}},$$
3. Check if the convergent is $$\frac{k}{d}$$ by doing the following:
   * Set the numerator to be $$k$$ and denomenator to be $$d$$
   * Check if $$d$$ is odd, if not, move on to the next convergent
   * Check if $$ed \equiv 1 (\mod k)$$, if not, move on to the next convergent
   * Set $$\phi(n) = \frac{ed-1}{k}$$ and find the roots of the polynomial $$x^2 - (n - \phi(n) + 1)x + n$$
   * If the roots of the polynomial are integers, then we've found $$d$$. \(If not, move on to the next convergent\)
4. If all convergents have been tried, and none of them work, then the given RSA parameters are not vulnerable to Wiener's attack.

Here's a sage implementation to play around with:

```python
from Crypto.Util.number import long_to_bytes

def wiener(e, n):
    # Convert e/n into a continued fraction
    cf = continued_fraction(e/n)
    convergents = cf.convergents()
    for kd in convergents:
        k = kd.numerator()
        d = kd.denominator()
        # Check if k and d meet the requirements
        if k == 0 or d%2 == 0 or e*d % k != 1:
            continue
        phi = (e*d - 1)/k
        # Create the polynomial
        x = PolynomialRing(RationalField(), 'x').gen()
        f = x^2 - (n-phi+1)*x + n
        roots = f.roots()
        # Check if polynomial as two roots
        if len(roots) != 2:
            continue
        # Check if roots of the polynomial are p and q
        p,q = int(roots[0][0]), int(roots[1][0])
        if p*q == n:
            return d
    return None
# Test to see if our attack works
if __name__ == '__main__':
    n = 6727075990400738687345725133831068548505159909089226909308151105405617384093373931141833301653602476784414065504536979164089581789354173719785815972324079
    e = 4805054278857670490961232238450763248932257077920876363791536503861155274352289134505009741863918247921515546177391127175463544741368225721957798416107743
    c = 5928120944877154092488159606792758283490469364444892167942345801713373962617628757053412232636219967675256510422984948872954949616521392542703915478027634
    d = wiener(e,n)
    assert not d is None, "Wiener's attack failed :("
    print(long_to_bytes(int(pow(c,d,n))).decode())
```

//TODO: Proof of Wiener's theorem

