# SEGSIN

> SEGSIN (Ax,Ay,Bx,By,Cx,Cy,Dx,Dy)

Sinus of 2 line segments (A->B, C->D).

```
' Line 1
Ax = 50
Ay = 50
Bx = 50
By = 100

' Line 2
Cx = 100
Cy = 100
Dx = 50
Dy = 100

print "SEGCOS: "; SEGCOS(Ax,Ay,Bx,By,Cx,Cy,Dx,Dy)
print "SEGSIN: "; SEGSIN(Ax,Ay,Bx,By,Cx,Cy,Dx,Dy)
print "Angle between the lines: "; deg(acos(SEGCOS(Ax,Ay,Bx,By,Cx,Cy,Dx,Dy))); "°"
```

```
' Interactive example to illustrate the geometry
' of SEGCOS and SEGSIN

' Line 1
Ax = 280
Ay = 250
Bx = 250
By = 200

' Line 2
Cx = 400
Cy = 300
Dx = 210
Dy = 300

pen on
while(!pen(12))

  cls
  print "Move Mouse. Press Left Mouse Button to exit"
  
  Dx = pen(10)
  Dy = pen(11)
  
  ResultCos = SEGCOS(Ax,Ay,Bx,By,Cx,Cy,Dx,Dy)
  ResultSin = SEGSIN(Ax,Ay,Bx,By,Cx,Cy,Dx,Dy)
  print "SEGCOS between the two segments: "; ResultCos  ;"
  print "SEGSIN between the two segments: "; ResultSin  ;"
  print "Angle between the two segments : "; DEG(ACOS(ResultCos)); " DEG"
  
  'Calc intersecton of both lines
  'f1(x) = a1*x+b1
  'f2(x) = a2*x+b2
  'f1 = f2
  '-> x0 = (b2-b1) / (a1-a2)
  '-> y0 = f1(x0)
  '  
  if( (Bx - Ax) != 0 AND (Dx - Cx) != 0) then
    a1 = (By - Ay) / (Bx - Ax)
    a2 = (Dy - Cy) / (Dx - Cx)
    b1 = Ay - a1 * Ax
    b2 = Cy - a2 * Cx
  
    X0 = (b2-b1) / (a1-a2) 
    Y0 = a1*X0 + b1
  endif
  
  ' Draw
  line X0, Y0, Ax, Ay color 2  ' Line segment 1
  line X0, Y0, Cx, Cy color 2  ' Line segment 2
  line Ax, Ay, Bx, By color 10 ' Line 1
  line Cx, Cy, Dx, Dy color 10 ' Line 2
  
  
  showpage
  delay(50)
  
wend
```
