# M3TRANS

> M3TRANS BYREF M, Tx, Ty

Multiply the 2D transformation matrix `M` by a translation matrix. `Tx` and `Ty` are the translations in x and y direction. `M` is a 3x3 matrix.

The translation matrix has the form

```
         |  1  0  Tx |
MTrans = |  0  1  Ty |
         |  0  0  1  |
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
