# Interactive fun

Inspired by: [https://crypto.katestange.net/lattice-tools/](https://crypto.katestange.net/lattice-tools/)

**Lattice + LLL + Fundamental mesh plot**

```python
@interact
def draw_lattice(v1x = input_box(label = "v1 x =", default = 1),
                 v1y = input_box(label = "v1 y =", default = 0),
                 v2x = input_box(label = "v2 x =", default = 0),
                 v2y = input_box(label = "v2 y =", default = 1),
                 box = 5, search = 10,
                 plot_LLL = True,
                 plot_C = True,
                 plot_F = True):

    v1 = vector((v1x, v1y))
    v2 = vector((v2x, v2y))
    vecs = []
    # Generate vectors
    for i in range(-search,search):
        for j in range(-search,search):
            vecs.append(i*v1 + j*v2)
    # Plot stuff
    G = Graphics()
    for p1 in vecs:
        x1, y1 = p1
        if x1 > -box and x1 < box and y1 > -box and y1 < box:
            G += point(p1, color = 'green', size = 30)
            G += line([p1, p1 + v2], linestyle = '--', alpha = .20)
            G += line([p1, p1 + v1], linestyle = '--', alpha = .20)
    G+= arrow((0, 0), v1, color = 'red', arrowsize = 2)
    G+= arrow((0, 0), v2, color = 'red', arrowsize = 2)
    G+= text('v1', v1 + .2 * v1, color = 'red')
    G+= text('v2', v2 + .2 * v2, color = 'red')
    
    # LLL
    if plot_LLL:
        v1_, v2_ = matrix([v1, v2]).LLL()
        G+= arrow((0, 0), v1_, color = 'purple', arrowsize = 2)
        G+= arrow((0, 0), v2_, color = 'purple', arrowsize = 2)
        if plot_C:
            G += circle(center = (0, 0), radius = norm(v1_) if norm(v1_) > norm(v2_) else norm(v2_), alpha = .5, color = 'purple')
    # Fundamental mesh
    if plot_F:
        F = polygon([[0, 0], v1, v1 + v2, v2], color='red', alpha = .1)
        G += F
    G.show(axes = False, figsize = (7, 7))


```

![](../.gitbook/assets/image%20%287%29.png)

#### **Lattice + CVP**

```python
@interact
def draw_cvp(v1x = input_box(label = "v1 x =", default = 1),
             v1y = input_box(label = "v1 y =", default = 0),
             v2x = input_box(label = "v2 x =", default = 0),
             v2y = input_box(label = "v2 y =", default = 1),
             wx = input_box(label = "w x =", default = 1.8),
             wy = input_box(label = "w y =", default = 1.7),
             box = 5, search = 10):

    v1 = vector((v1x, v1y))
    v2 = vector((v2x, v2y))
    print(v1, v2)
    vecs = []
    # Generate vectors
    for i in range(-search,search):
        for j in range(-search,search):
            vecs.append(i*v1 + j*v2)
    # Plot stuff
    G = Graphics()
    for p1 in vecs:
        x1, y1 = p1
        if x1 > -box and x1 < box and y1 > -box and y1 < box:
            G += point(p1, color = 'green', size = 30)
            G += line([p1, p1 + v2], linestyle = '--', alpha = .20)
            G += line([p1, p1 + v1], linestyle = '--', alpha = .20)
    G+= arrow((0, 0), v1, color = 'red', arrowsize = 2)
    G+= arrow((0, 0), v2, color = 'red', arrowsize = 2)
    G+= text('v1', v1 + .2 * v1, color = 'red')
    G+= text('v2', v2 + .2 * v2, color = 'red')         
    
    # Cvp
    L = IntegerLattice(matrix([v1, v2]))
    w = vector((wx, wy))
    t = L.closest_vector(w)
    G += point(w, color = 'purple', size = 30)
    G+= text('w', w + .2 * v1, color = 'purple')         

    G += point(t, color = 'red', size = 30)
    G+= text('t', t + .2 * v1, color = 'red')         
    G+= circle(center = w, radius=norm(t - w), color = 'purple', alpha = .5)
    G.show(axes = False, figsize = (7, 7))
```

![](../.gitbook/assets/image%20%2810%29.png)

```python
@interact
def draw_dual(v1x = input_box(label = "v1 x =", default = 1),
                 v1y = input_box(label = "v1 y =", default = 0),
                 v2x = input_box(label = "v2 x =", default = 0),
                 v2y = input_box(label = "v2 y =", default = 1),
                 box = 3, search = 6,
                 plot_lattice_points = True,
                 plot_lattice_lines = True,
                 plot_dual_points = True,
                 plot_dual_lines = True):

    v1 = vector((v1x, v1y))
    v2 = vector((v2x, v2y))
    vecs = []
    v1_, v2_ = matrix([v1,v2]).inverse().T
    vecs_ = []
    # Generate vectors
    for i in range(-search,search):
        for j in range(-search,search):
            vecs.append(i*v1 + j*v2)
    for i in range(-search,search):
        for j in range(-search,search):
            vecs_.append(i*v1_ + j*v2_)
    # Plot stuff
    G = Graphics()
    for p1 in vecs:
        x1, y1 = p1
        if x1 > -box and x1 < box and y1 > -box and y1 < box:
            if plot_lattice_points:
                G += point(p1, color = 'green', size = 70)
            if plot_lattice_lines:
                G += line([p1, p1 + v2], linestyle = '--', alpha = .20, color = 'green')
                G += line([p1, p1 + v1], linestyle = '--', alpha = .20, color = 'green')
    if plot_lattice_lines:
        G+= arrow((0, 0), v1, color = 'green', arrowsize = 2)
        G+= arrow((0, 0), v2, color = 'green', arrowsize = 2)
        G+= text('v1', v1 + .2 * v1, color = 'green')
        G+= text('v2', v2 + .2 * v2, color = 'green')
    
    # Dual
    for p1 in vecs_:
        x1, y1 = p1
        if x1 > -box and x1 < box and y1 > -box and y1 < box:
            if plot_dual_points:
                G += point(p1, color = 'red', size = 25)
            if plot_dual_lines:
                G += line([p1, p1 + v2_], linestyle = '--', alpha = .20, color = 'red')
                G += line([p1, p1 + v1_], linestyle = '--', alpha = .20, color = 'red')
    if plot_dual_lines:
        G+= arrow((0, 0), v1_, color = 'red', arrowsize = 2)
        G+= arrow((0, 0), v2_, color = 'red', arrowsize = 2)
        G+= text('v1\'', v1_ + .2 * v1, color = 'red')
        G+= text('v2\'', v2_ + .2 * v2, color = 'red')
    
    G.show(axes = False, figsize = (7, 7))
```

**Q-ary plots**

```python
# I'm not sure this does what is supposed to do
# but the plots are nice

from sage.modules.free_module_integer import IntegerLattice
@interact
def draw_qary(v1x = input_box(label = "v1 x =", default = 1),
                 v1y = input_box(label = "v1 y =", default = 0),
                 v2x = input_box(label = "v2 x =", default = 0),
                 v2y = input_box(label = "v2 y =", default = 1),
                 q = input_box(label = "q =", default = 5),
                 box = 7, search = 6,
                 plot_lattice_points = True,
                 plot_lattice_lines = True,
                 plot_qary_points = True,
                 plot_qary_lines = True):

    v1 = vector((v1x, v1y))
    v2 = vector((v2x, v2y))
    L = IntegerLattice(matrix([v1, v2]))
    vecs = []
    v1_ = v1.change_ring(Zmod(q))
    v2_ = v2.change_ring(Zmod(q))
    vecs_ = []
    # Generate vectors
    for i in range(-search,search):
        for j in range(-search,search):
            v = i*v1 + j*v2
            vecs.append(v)
            v = v.change_ring(Zmod(q)).change_ring(ZZ)
            if v not in vecs_:
                vecs_.append(v)
                
    # Lattice
    G = Graphics()
    for p1 in vecs:
        x1, y1 = p1
        if x1 > -box and x1 < box and y1 > -box and y1 < box:
            if plot_lattice_points:
                G += point(p1, color = 'green', size = 70)
            if plot_lattice_lines:
                G += line([p1, p1 + v2], linestyle = '--', alpha = .20, color = 'green')
                G += line([p1, p1 + v1], linestyle = '--', alpha = .20, color = 'green')
    if plot_lattice_lines:
        G+= arrow((0, 0), v1, color = 'green', arrowsize = 2)
        G+= arrow((0, 0), v2, color = 'green', arrowsize = 2)
        G+= text('v1', v1 + .2 * v1, color = 'green')
        G+= text('v2', v2 + .2 * v2, color = 'green')
    
    # qary
    for p1 in vecs_:
        p1 = p1
        x1, y1 = p1
        if x1 > -box and x1 < box and y1 > -box and y1 < box:
            if plot_qary_points:
                G += point(p1, color = 'red', size = 25)
            if plot_qary_lines:
                G += line([p1, p1 + v2_], linestyle = '--', alpha = .20, color = 'red')
                G += line([p1, p1 + v1_], linestyle = '--', alpha = .20, color = 'red')
    if plot_qary_lines:
        G+= arrow((0, 0), v1_, color = 'purple', arrowsize = 2)
        G+= arrow((0, 0), v2_, color = 'purple', arrowsize = 2)
        G+= text('v1\'', v1_.change_ring(ZZ) + .2 * v1, color = 'purple')
        G+= text('v2\'', v2_.change_ring(ZZ) + .2 * v2, color = 'purple')
    
    G.show(axes = False, figsize = (10, 10))
```

