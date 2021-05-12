# Proof of correctness

We now consider $$c^d = m^{ed} = m$$necessary for the successful description of an RSA ciphertext. The core of this result is due to [Euler's theorem](https://en.wikipedia.org/wiki/Euler%27s_theorem) which states

$$
a^{\phi(n)} \equiv 1 \mod n
$$

for all coprime integers $$(a,n)$$ and $$\phi(n)$$ is [Euler's totient function](https://en.wikipedia.org/wiki/Euler%27s_totient_function).

{% hint style="info" %}
As a reminder, we say two integers are coprime if they share no non-trivial factors. This is the same statement that $$\gcd(a,n)=1$$.
{% endhint %}

From the definition of the protocol, we have that

$$
ed \equiv 1 \mod \phi(n), \;\; \Rightarrow \;\; ed = 1 + k\phi(n)
$$

for some $$k \in \mathbb{Z}$$. Combining this with Euler's theorem, we see that we recover $$m$$from the ciphertext

$$
\begin{align}
    c^d  &\equiv (m^e)^d &&\mod n \\
     &\equiv m^{ed} &&\mod n \\
     &\equiv m^{k\phi + 1} &&\mod n \\
     &\equiv m^{k\phi} m &&\mod n \\
     &\equiv (m^\phi)^km &&\mod n \\
     &\equiv 1^km &&\mod n \\
     &\equiv m &&\mod n \\
\end{align}
$$

When the requirement $$\gcd(m, n) = 1$$does not hold, we can instead look at the equivalences modulo $$p$$and $$q$$respectively. Clearly, when $$\gcd(m, n) = n,$$we have that $$c \equiv m \equiv 0 \mod n$$and our correctness still holds. Now, consider the case $$m = k\cdot p,$$where we have that $$c \equiv m \equiv 0 \mod p$$and $$c^d \equiv (m^e)^d \pmod q.$$Since we have already excluded the case that $$\gcd(m, q) = q,$$we can conclude that $$\gcd(m, q) = 1,$$as $$q$$is prime. This means that $$m^{\ell\phi(q)} \equiv 1 \mod q$$and by the multiplicative properties of the $$\phi$$function, we determine that $$m^{\ell_n\phi(n)} = m^{\ell\phi(q)} \equiv 1 \mod q.$$We conclude by invoking the Chinese Remainder theorem with



$$
\begin{align*}
m &\equiv 0 &&\mod p \\
m &\equiv 1^\ell m &&\mod q\\
\end{align*}
$$

 that $$m^{e\cdot d} \equiv m \mod n.$$The case for $$m = k\cdot q$$follows in a parallel manner.

