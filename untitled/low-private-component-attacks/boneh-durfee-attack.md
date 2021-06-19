# Boneh-Durfee Attack

### What is Boneh-Durfee Attack

Boneh-Durfee attack is an extension of Wiener's attack. That is, it also attacks on low private component $$d$$with a further relaxed condition. If $$d$$satisfies:

$$
d < N^{0.292}
$$

Then we can use Boneh-Durfee attack to retrive $$d$$

this, using a graphical directed point of view, can be seen as:

$$
\{E, n\} \xrightarrow[d < N^{0.292}]{P} \{d\}
$$

Consider $$d < N^{i}$$for first, see that

$$
1=ed + \frac{k \phi(N)}{2}\\
$$

As stated above, the RSA's totient function can be espressed as:

$$
\phi(N) = (p-1)(q-1) = N-q-p+1
$$

continuing with the equation, we see that

$$
1 = ed + k(\frac{N+1}{2}-\frac{p+q}{2}  )
$$

and if we decide to consider   $$x = \frac{N+1}{2} $$and $$y = \frac{p+q}{2} $$, we will have:

$$
1 = ed + k(x+y)
$$

At this point, finding $$d$$is equivalent to find the 2 small solutions $$x$$and $$y$$to the congruence

$$
f(x,y) \equiv	k(x+y) \equiv	1  \space (mod \space e) \\

k(x + y) \equiv 1 (\space mod \space e)
$$

now let $$s = -\frac{p+q}{2}$$and $$A = \frac{N+1}{2}$$this will preserve the scomposed $$\phi(N) $$subtraction

$$
k(A+s) \equiv 1 (\space mod \space e)
$$

consider $$e=N^{\alpha}$$\(with any $$\alpha$$\), we deduct that $$\alpha$$must be really closed to $$1$$because $$e$$is in the same order of the length of $$N$$\(so $$e=N^{\sim	1^{-}}$$\), we will get

$$
| s | < 2\sqrt{N} = \\

\frac{p+q}{2} < 2\sqrt{N} =2e^{\frac{1}{2\alpha}} \sim \sqrt{e} \\

|k| < \frac{2ed}{\phi{(N)}} \leq\frac{3ed}{N}< 3e^{1+\frac{\alpha+1}{\alpha}} < e^{i}
$$

```text

```

### Sage Implementation

{% embed url="https://github.com/mimoo/RSA-and-LLL-attacks/blob/master/boneh\_durfee.sage" caption="Boneh-Durfee attack Sage implementation" %}

