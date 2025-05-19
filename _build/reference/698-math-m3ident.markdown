# M3IDENT

> M3IDENT BYREF M

Creates a 3x3 Identity matrix `M`:

```
    |1  0  0|
M = |0  1  0|
    |0  0  1|
```

The Identity matrix can be used with M3TRANS, M3SCALE, M3ROTATE and M3APPLY to perform 2D transformations of a poly-line.

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
