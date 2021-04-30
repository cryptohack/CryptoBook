# Round Transformations

## Add Round Key

Round keys are derived from the master key and are all composed of 16 bytes. Let $$K_i$$ the $$i$$-th round key.

We simply `xor` byte by byte the state by the bytes of the round key in the according position.

{% hint style="warning" %}
I will add a picture later, it's not done yet.
{% endhint %}

Its inverse is itself: if we xor again, we get back the original value.

{% hint style="success" %}
This step is important, otherwise there would be no encryption at all!
{% endhint %}

## Mix Columns

This operation mixes each column of the state independently from each other: each byte of the column is replaced by a combination of the four bytes of the column. Let $$(a_0, a_1, a_2, a_3)$$ the quadruplet of elements of a column, the operation `MC` is done by multiplying with a matrix $$M$$\(given in byte representation\):

$$
\begin{bmatrix}
\texttt{2} & \texttt{3} & \texttt{1} & \texttt{1} \\
\texttt{1} & \texttt{2} & \texttt{3} & \texttt{1} \\
\texttt{1} & \texttt{1} & \texttt{2} & \texttt{3} \\
\texttt{3} & \texttt{1} & \texttt{1} & \texttt{2} \\
\end{bmatrix}
\cdot
\begin{bmatrix}
a_0 \\ a_1 \\ a_2 \\ a_3
\end{bmatrix} =
\begin{bmatrix}
\texttt{2} \cdot a_0 + \texttt{3} \cdot a_1 + \texttt{1} \cdot a_2 + \texttt{1} \cdot a_3 \\
\texttt{1} \cdot a_0 + \texttt{2} \cdot a_1 + \texttt{3} \cdot a_2 + \texttt{1} \cdot a_3 \\
\texttt{1} \cdot a_0 + \texttt{1} \cdot a_1 + \texttt{2} \cdot a_2 + \texttt{3} \cdot a_3 \\
\texttt{3} \cdot a_0 + \texttt{1} \cdot a_1 + \texttt{1} \cdot a_2 + \texttt{2} \cdot a_3
\end{bmatrix}
$$

{% hint style="success" %}
Thanks to `MC`, each byte has an impact on the whole column of a state. A modification of one byte affects the whole column.
{% endhint %}

Thanks to `MC`, each byte has an impact on the whole column of a state. A modification of one byte affects the whole column.

This matrix is circulant: each row is the same as the one above but is shifted by one column. So we can construct it in one line of SageMath:

```python
# we construct the matrix
M = Matrix.circulant([x, x + 1, 1, 1])
M
# [    x x + 1     1     1]
# [    1     x x + 1     1]
# [    1     1     x x + 1]
# [x + 1     1     1     x]

# We multiply a column
col1 = vector([F.random_element() for i in range(4)])
col1
# (x^6 + x + 1, x^7 + x^4 + x^2, x^6 + x^4 + x^3 + x^2, x^7 + x^6 + x^4 + x^3 + x^2)
col2 = M*col1
col2
# (x^7 + x^5 + 1, x^6 + x^3, x^4, x^7 + x^5 + x^3 + x^2 + x)
```

### Inverse of Mix Column

It is needed to reverse `MC` for the decryption process. Fortunately, there exists a matrix $$N$$ such that $$M\times N = N \times M = \textrm{Id}$$, the identity matrix.

```python
N = M^-1
N
# [x^3 + x^2 + x   x^3 + x + 1 x^3 + x^2 + 1       x^3 + 1]
# [      x^3 + 1 x^3 + x^2 + x   x^3 + x + 1 x^3 + x^2 + 1]
# [x^3 + x^2 + 1       x^3 + 1 x^3 + x^2 + x   x^3 + x + 1]
# [  x^3 + x + 1 x^3 + x^2 + 1       x^3 + 1 x^3 + x^2 + x]

# hexadecimal representation
for row in N:
    print([F_to_hex(a) for a in row])
# ['e', 'b', 'd', '9']
# ['9', 'e', 'b', 'd']
# ['d', '9', 'e', 'b']
# ['b', 'd', '9', 'e']

col3 = N*col2
col3 == col1
# True
```

{% hint style="info" %}
We remark that the coefficient of the matrix are less friendly for `invMC` than `MC`. The latter is more efficient to implement, so decryption is a bit slower.  
It is also possible to rewrite `invMC` using `MC` preceded by preprocessing.
{% endhint %}

## Shift Rows

This operation shifts the rows of the state in the following manner:

![](../../.gitbook/assets/figures-figure1.svg)

{% hint style="info" %}
Take a few seconds to reflect on the importance of this operation. What would happen if no shifting were present?  
In the `MC` operation we see that a byte has an effect on the whole column, but not the bytes of the row.  
The`SR` operation makes sure that this property also propagates to the whole state.
{% endhint %}

## Substitution Box

The precedent operations shuffle the plaintext in such a way that any modification of a byte has an impact to the whole state after several rounds. Though, this is not enough as those operations are _linear_: it means that the ciphertext could be expressed as linear equations from the plaintext and the master key. From a known couple plaintext/ciphertext it would be easy to solve the system and find the key.

The substitution box is the operation that breaks the linearity: each byte of the state is replaced by another following the table below.

{% hint style="warning" %}
Need a table here, obviously.
{% endhint %}

Let `sbox` the name of this table, then for any bytes `b1` and `b2`, we have

$$
\texttt{sbox}(\texttt{b1} \oplus \texttt{b2}) \neq \texttt{sbox}(\texttt{b1}) \oplus \texttt{sbox}(\texttt{b2})
$$

which is the desired property.

The construction of the `sbox` table is done in two steps in the finite field:

1. An element $$a$$ is replaced by $$b = a^{-1}$$ \($$0$$ has no inverse and is mapped to $$0$$\);
2. An affine transformation on the coefficients of $$a$$:

$$
\begin{bmatrix}
   1 & 1 & 1 & 1 & 1 & 0 & 0 & 0 \\
   0 & 1 & 1 & 1 & 1 & 1 & 0 & 0 \\
   0 & 0 & 1 & 1 & 1 & 1 & 1 & 0 \\
   0 & 0 & 0 & 1 & 1 & 1 & 1 & 1 \\
   1 & 0 & 0 & 0 & 1 & 1 & 1 & 1 \\
   1 & 1 & 0 & 0 & 0 & 1 & 1 & 1 \\
   1 & 1 & 1 & 0 & 0 & 0 & 1 & 1 \\
   1 & 1 & 1 & 1 & 0 & 0 & 0 & 1
   \end{bmatrix}
   \cdot
   \begin{bmatrix}
   b_7 \\ b_6 \\ b_5 \\ b_4 \\ b_3 \\ b_2 \\ b_1 \\ b_0
   \end{bmatrix}
   +
   \begin{bmatrix}
   0 \\ 1 \\ 1 \\ 0 \\ 0 \\ 0 \\ 1 \\ 1
   \end{bmatrix}
$$



