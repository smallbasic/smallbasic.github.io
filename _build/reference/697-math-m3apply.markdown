# M3APPLY

> M3APPLY m3x3, BYREF poly

Apply matrix to poly-line.


--------- 
1  0  0
0 -1  0
0  0  1
-1  0  0
0  1  0
0  0  1
--------- 
3D-Graphics Matrices:
------------ 
1  0  0 Tx
0  1  0 Ty
0  0  1 Tz
0  0  0  1
Sx  0  0  0
0 Sy  0  0
0  0 Sz  0
0  0  0  1
1  0  0  0
0  c -s  0
0  s  c  0
0  0  0  1
c  0  s  0
0  1  0  0
-s  0  c  0
0  0  0  1
c -s  0  0
s  c  0  0
0  0  1  0
0  0  0  1
------------ 
Any change to matrix will combined with its previous value.
> DIM poly(24)
DIM M(2,2)
...
M3IDENT M
M3ROTATE M, pi/2, 0, 0
M3SCALE M, 0, 0, 1.24, 1.24
...
' Draw the original polyline
DRAWPOLY poly
...
' Draw the polyline
' rotated by pi/2 from 0,0 and scaled by 1.24
M3APPLY M, poly
DRAWPOLY poly


