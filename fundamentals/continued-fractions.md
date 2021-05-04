# Continued Fractions

## Continued Fractions

Continued fractions are a way of representing a number as a sum of an integer and a fraction.

Mathematically, a continued fraction is a representation

$$
a_{0} + \frac{b_{0}}{
a_{1} + \frac{b_{1}}{
a_{2} + \frac{b_{2}}{
\ddots
}}}
$$

$$a_{i}, b_{i}$$are complex numbers. The continued fraction with $$b_{i} = 1\  \forall i$$ is called a simple continued fraction and continued fractions with finite number of $$a_{i}$$ are called finite continued fractions.

Consider example rational numbers,



$$
\frac{17}{11} = 1 + \frac{6}{11} \\[10pt]
\frac{11}{6} = 1 + \frac{5}{6} \\[10pt]
\frac{6}{5} = 1 + \frac{1}{5} \\[10pt]
\frac{5}{1} = 5 + 0
$$

the continued fractions could be written as

$$
\frac{5}{1} =5 \\[10pt]
\frac{6}{5} = 1 + \frac{1}{5} \\[10pt]
\frac{11}{6} = 1 + \frac{5}{6} = 1 + \frac{1}{\frac{6}{5}} = 1 + \frac{1}{1 + \frac{1}{5}} \\[10pt]
\frac{17}{11} = 1 + \frac{6}{11} = 1 + \frac{1}{\frac{11}{6}} = 1 + \frac{1}{1 + \frac{1}{1 + \frac{1}{5}}}
$$

## Notation

$$
a_{0} + \frac{1}{
a_{1} + \frac{1}{
a_{2} + \frac{1}{
\ddots
}}}
$$

A simple continued fraction is represented as a list of coefficients\($$a_{i}$$\) i.e 

$$
x = [a_{0};\ a_{1},\ a_{2},\ a_{3},\ a_{4},\ a_{5},\ a_{6},\ \ldots]
$$

for the above example 

$$
\frac{17}{11} = [1;\ 1,\ 1,\ 5]\ \ ,\frac{11}{6} = [1;\ 1,\ 5]\ \ ,\frac{6}{5} = [1; 5]\ \ ,\frac{5}{1} = [5;]
$$

## Computation of simple continued fractions

Given a number $$x$$, the coefficients\($$a_{i}$$\) in its continued fraction representation  can be calculated recursively using

$$
x_{0} = x \\[4pt]
a_{i} = \lfloor x_{i} \rfloor \\[4pt]
x_{i+1} = \frac{1}{x_{i} - a_{i}}
$$

The above notation might not be obvious. Observing the structure of continued fraction with few coefficients will make them more evident:

$$
x_{0} = a_{0} + \frac{1}{a_{1} + \frac{1}{a_{2}}},\ \ \ 
x_{1} = a_{1} + \frac{1}{a_{2}}, \ \ \ 
x_{2} = a_{2} \\[10pt]
x_{i} = a_{i} + \frac{1}{x_{i+1}} \\[10pt]
x_{i+1} = \frac{1}{x_{i} - a_{i}}
$$

SageMath provides functions `continued_fraction` and `continued_fraction_list` to work with continued fractions. Below is presented a simple implementation of `continued_fractions`.

```python
def continued_fraction_list(xi):
    ai = floor(xi)
    if xi == ai: # last coefficient
        return [ai]
    return [ai] + continued_fraction_list(1/(x - ai))
```

## Convergents of continued fraction

The $$k^{th}$$convergent of a continued fraction$$x = [a_{0}; a_{1},\ a_{2},\ a_{3},\ a_{4},\ldots] $$is the numerical value or approximation calculated using the first$$k - 1$$coefficients of the continued fraction. The first$$k$$convergents are

$$
\frac{a_{0}}{1},\ \ \ 
a_{0} + \frac{1}{a_{1}}, \ \ \ 
a_{0} + \frac{1}{a_{1} + \frac{1}{a_{2}}}, \ \ldots,\ 
a_{0} + \frac{1}{a_{1} + \frac{\ddots} {a_{k-2} + \frac{1}{a_{k-1}}}}
$$

One of the immediate applications of the convergents is that they give rational approximations given the continued fraction of a number. This allows finding rational approximations to irrational numbers. 

Convergents of continued fractions can be calculated in sage

```python
sage: cf = continued_fraction(17/11)
sage: convergents = cf.convergents()
sage: cf
[1; 1, 1, 5]
sage: convergents
[1, 2, 3/2, 17/11]
```

Continued fractions have many other applications. One such applicable in cryptology is based on **Legendre's theorem in diophantine approximations**.

**Theorem:** if$$\mid x - \frac{a}{b} \mid < \frac{1}{b^{2}}$$, then$$\frac{a}{b}$$is a convergent of$$x$$.

Wiener's attack on the RSA cryptosystem works by proving that under certain conditions, an equation of the form$$\mid x - \frac{a}{b} \mid$$could be derived where$$x$$is entirely made up of public information and$$\frac{a}{b}$$is made up of private information. Under assumed conditions, the inequality$$\mid x - \frac{a}{b} \mid < \frac{1}{b^{2}}$$is statisfied, and the value$$\frac{a}{b}$$\(private information\) is calculated from convergents of$$x$$\(public information\), consequently  breaking the RSA cryptosystem.

