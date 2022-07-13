# M3SCALE

> M3SCALE BYREF m3x3, x, y, Sx, Sy

Multiply the given matrix by a scale matrix. Sx and Sy are the scaling factors in x and y direction.

```
         | Sx  0  0|
MScale = | 0  Sy  0|
         | 0   0  1|
```

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
