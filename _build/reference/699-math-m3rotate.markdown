# M3ROTATE

> M3ROTATE BYREF M, angle [, x, y]

Multiply the 2D transformation matrix `M` by a rotation matrix with an angle `angle` and a rotation center `x`,`y`. `M` is a 3x3 matrix.

If x = 0 and y = 0 the rotation matrix has the form:

```
       | cos(angle) -sin(angle)  0 |
MRot = | sin(angle)  cos(angle)  0 |
       | 0           0           1 |
```

else:

```
       | cos(angle) -sin(angle)  (1 - cos(angle))*x + sin(angle) * y |
MRot = | sin(angle)  cos(angle)  (1 - cos(angle))*y - sin(angle) * x |
       | 0           0           1 |
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
