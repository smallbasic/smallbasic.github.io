# PTDISTLN

> PTDISTLN (Bx,By,Cx,Cy,Ax,Ay)

Distance of point A from line B, C.

```
' Define line
Bx = 100
By = 100
Cx = 200
Cy = 150

' Define point
Ax = 150
Ay = 50

'Calc distance
Distance = ptdistln(Bx, By, Cx, Cy, Ax,Ay) 
print "Distant between line and point is "; Distance  ;" pixel"

' Make a nice drawing to illustrate the geometry
'
' using vector dot product to calculate a line orthogonal
' to line BC, wich goes to point A
Lx = Cx - Bx
Ly = Cy - By
Px = Ax - Bx
Py = Ay - By
Vx =  (Lx * Px + Ly * Py) / (Lx^2 + Ly^2) * Lx
Vy =  (Lx * Px + Ly * Py) / (Lx^2 + Ly^2) * Ly

' Draw
line Bx, By, Cx, Cy color 10   ' Line
line Ax, Ay, Bx + Vx,  By + Vy color 2 ' Distant between line and point
circle Ax, Ay, 5 color 11 ' Cirlce at position of the point
```

