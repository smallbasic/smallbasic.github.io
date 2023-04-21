# INTERSECT

> INTERSECT Ax, Ay, Bx, By, Cx, Cy, Dx, Dy, BYREF type, BYREF Rx, BYREF Ry

Calculates the intersection of two line segments AB and CD given by the point `Ax`, `Ay`, `Bx`, `By` and `Cx`, `Cy`, `Dx`, `Dy`.

Returns: 

- Rx, Ry = coordinates of crossing point.
- type = cross-type:
  - 0: No cross (R = external cross)
  - 1: One cross
  - 2: Parallel
  - 3: Parallel (many crosses)
  - 4: The cross is one of the line segments edges.

### Example

```
' Line segment AB
Ax = 50
Ay = 50
Bx = 100
By = 100

' Line segment CD
Cx = 100
Cy =  50
Dx =  50
Dy = 100

intersect Ax, Ay, Bx, By, Cx, Cy, Dx, Dy, type, Rx, Ry

print "Intersection at x = "; Rx; ", y = "; Ry

' Draw lines and a circle at the calculated crossing point
line Ax, Ay, Bx, By color 5
line Cx, Cy, Dx, Dy color 8
circle Rx,Ry, 5 color 12
```
