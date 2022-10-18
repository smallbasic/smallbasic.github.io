# INTERSECT

> INTERSECT Ax, Ay, Bx, By, Cx, Cy, Dx, Dy, BYREF type, BYREF Rx, BYREF Ry

Calculates the intersection of the two line segments A-B and C-D. Returns: Rx,Ry = cross.

type = cross-type:

- 0: No cross (R = external cross)
- 1: One cross
- 2: Parallel
- 3: Parallel (many crosses)
- 4: The cross is one of the line segments edges.

```
'Line segment AB
Ax = 50
Ay = 50
Bx = 100
By = 100

'Line segment CD
Cx = 100
Cy =  50
Dx =  50
Dy = 100

type = 0
Rx = 0
Ry = 0

intersect Ax, Ay, Bx, By, Cx, Cy, Dx, Dy, type, Rx, Ry

print "Intersection at x = "; Rx; ", y = "; Ry

' Draw lines and a circle at the calculated crossing point
line Ax, Ay, Bx, By color 5
line Cx, Cy, Dx, Dy color 8
circle Rx,Ry, 5 color 12

```
