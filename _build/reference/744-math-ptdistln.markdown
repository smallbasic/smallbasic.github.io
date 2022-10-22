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

Distance = ptdistln(Bx, By, Cx, Cy, Ax,Ay) 
print "Distant between line and point is "; Distance  ;" pixel"
```

```
' Interactive example to illustrate the geometry of PTDISTLN

Bx = 200
By = 300
Ax = 300
Ay = 100

pen on
while(!pen(12))

  cls
  print "Move Mouse. Press Left Mouse Button to exit"
  
  Cx = pen(10)
  Cy = pen(11)
  
  Distance = PTDISTLN (Bx,By,Cx,Cy,Ax,Ay) 
  print "Distant between line and point is "; Distance  ;" pixel"
  
  Lx = Cx - Bx
  Ly = Cy - By
  
  if(Lx != 0 AND Ly != 0) then
    ' Calculate projection vector V using dot-product
    Px = Ax - Bx
    Py = Ay - By
    Vx = Bx + (Lx * Px + Ly * Py) / (Lx^2 + Ly^2) * Lx
    Vy = By + (Lx * Px + Ly * Py) / (Lx^2 + Ly^2) * Ly
  endif

  ' Draw
  line Bx, By, Cx, Cy color 10   ' Line
  line Ax, Ay, Vx, Vy color 2    ' Distant between line and point
  circle Ax, Ay, 5 color 11      ' Cirlce at position of the point
  showpage
  delay(50)
  
wend
```
