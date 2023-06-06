# M3SCALE

> M3SCALE BYREF M, Ox, Oy, Sx, Sy

Multiply the 2D transformation matrix `M` by a scale matrix. `Sx` and `Sy` are the scaling factors in x and y direction. `Ox` and `Oy` define the position of the origin. 

If `Ox = 0` and `Oy = 0` then the scaling matrix `M` has the form:

```
         |Sx  0  0|
MScale = |0  Sy  0|
         |0   0  1|
```

else:

```
         |1 0 Ox|   |Sx  0 0|   |1 0 -Ox|   |Sx  0 (1 - Sx) * Ox|   
MScale = |0 1 Oy| * | 0 Sy 0| * |0 1 -Oy| = | 0 Sy (1 - Sy) * Oy|
         |0 0  1|   | 0  0 1|   |0 0   1|   | 0  0             1|
```

### Example

```
DIM M(2,2)

Rectangle = [-1,-1, 1,-1, 1,1, -1,1, -1,-1]  ' Create a rectangular polygon

M3IDENT M                                    ' Create Identity Matrix

M3Trans M, 100,100                           ' Move rectangle to position (100,100) 
M3SCALE M, 0, 0, 50, 50                      ' Scale rectangle by factor 50 in x and y
M3ROTATE M, 45*pi/180                        ' Rotate by 45°

M3APPLY M, Rectangle                         ' Transform the rectangle

DRAWPOLY Rectangle
```

M3TRANS, M3SCALE and M3ROTATE perform a matrix multiplication. When performing matrix multiplication, then last matrix is applied first.
In the example above, the rectangle is first rotated, then scaled and in the last step translated. If the order is changed, the outcome might
be different.
