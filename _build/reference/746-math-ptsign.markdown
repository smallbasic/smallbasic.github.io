# PTSIGN

> PTSIGN (Ax,Ay,Bx,By,Qx,Qy)

The sign of point Q from line segment A->B.

```
' Define line
Bx = 100
By = 100
Cx = 200
Cy = 150

' Define point
Ax = 150
Ay = 50

Sign = PTSIGN(Bx, By, Cx, Cy, Ax,Ay) 
print "Sign of point relative to the line "; Sign
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
  
  Sign = PTSIGN (Bx,By,Cx,Cy,Ax,Ay) 
  print "Sign of point relative to the line "; Sign
  
  ' Draw
  line Bx, By, Cx, Cy color 10   ' Line
  circle Ax, Ay, 5 color 11      ' Cirlce at position of the point
  showpage
  delay(50)
  
wend
```
