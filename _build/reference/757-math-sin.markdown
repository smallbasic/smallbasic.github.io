# SIN

> f = SIN (x)

Calculate the Sine of `x`. `x` is in radians.

### Example 1

```
a = sin(0.5)
print a         ' Output: 0.4794255386042

b = asin(a)
print b         ' Output: 0.5
```

### Example 2: Using RAD

The RAD function can be used to convert an angle in degrees to radians.

```
alpha_in_degrees = 90
a = sin(rad(alpha_in_degrees))
print a                         ' Output: 1
```

### Example 3: Drawing a spiral

```
' Drawing spiral around point.bas SmallBASIC 0.12.2 [B+=MGA] 2016-03-13
' using SIN and COS in a most common situation drawing at an angle from a point

cx = xmax\2 : cy = ymax\2

for degree = 0 to 360 step 10   'zero is due East

  line cx, cy step 10 * (degree^.5) * cos(rad(degree)), 10 * (degree^.5) * sin(rad(degree)), rgb(128,128,degree/360 * 128 + 127)

  at 0,0: print spc(100)
  at 0,0
  
  if degree = 0 then
    print " 0 degrees don't worry, you haven't seen nothing yet! press any key ..."
  else
    print degree;" degrees press any key ..."
  end if
  
  pause
next

print "Notice how the the drawing started due East for 0 degrees and"
print "as the angle increased the drawing went around clock-wise."

pause 

cls

' now I am doing a LOGO like program and I want 0 degrees to be due North
' due North is -90 degrees for clock-wise rotation so subtract 90 from degrees

for degree = 0 to 360 step 10
  
  line cx, cy step 10 * (degree^.5) * cos(rad(degree - 90)), 10 * (degree^.5) * sin(rad(degree - 90)), rgb(250,0,degree/360 * 128 + 127)

  at 0,0: print spc(100)
  at 0,0

  if degree = 0 then
    print " 0 degrees don't worry, you haven't seen nothing yet! press any key ..."
  else
    print degree;" degrees press any key ..."
  end if
  
  pause

next
print "Notice how the drawing started due North because of the -90 adjustment made in SIN and COS calls"
```

### Example 3: Draw a polygon

```
' sin and cos use.bas  SmallBASIC 0.12.2 [B+=MGA] 2016-03-15
'                    SIN and COS work as a team
'
' SIN and COS are used most for drawing points in circle around a central point.
' Here we are going to divide a circle into n sections to draw an n sided polygon,
' for instance, divide a circle into 3 equal parts and you get equilateral triangle (all sides =)
' divide by 4 and get a square, by 5 a pentagon, 6 a hexagon.... all equal sides
' I have to spend some time explaining why this works and a triangle diagram is really needed
' but here goes, imagine a pie sitting on top of a given center point cx,cy
' it is cut into n equal slices each piece has a central angle of 360/n or in radians 2*pi/n
' a polygon just cuts the round parts off with straight lines to each end at outer edge.
' remember COS is the leg adjacent to the angle in question divide by hypotenuse
' or COS(inner angle) = adj/hyp
' x is the adjacent side, the hypotenuse is the radius
' so COS(inner angle) = x/radius
' or radius * COS(angle) = x  multiple each side by radius
' x = radius * COS(angle)
' but remember this is distance relative to center point not a screen coordinate
' to make absolute screen point it is: x = cx + radius*COS(angle)
' SIN works out similar
' SIN(inner angle) = opposite/hyp
' and again y is opposite side (of inner angle) and the hypotenuse is the radius of circle
' SIN(angle) = y/radius    multiply each side by radius
' radius*SIN(angle) = y
' y = radius * SIN(angle)
' to make absolute screen point it is y = cy + radius*SIN(angle)
' So going around a central point x=cx+radius*COS(angle),y=cy+radius*SIN(angle)
' will locate points equal distance from center for equal sided polygon

cx = xmax / 2: cy = ymax / 2                ' here's our center move it anywhere on screen
'cx=100 : cy = 500                          ' <== try different center points
radius = 150

while 1
  cls
  circle cx, cy, 3, 1, 14                   'this shows the central point in small yellow circle

  ' what polygon shall we draw?
  print "A regular polygon is a many sided figure with equal sides."
  print "A triangle is a 3 sided polygon, a square 4, a pentagon 5..."
  input "(<=2 quits) Enter the number of sides for a polygon to draw "; n
  
  if n < 3 then end                         ' need at least 3 sides

  ' make the first point 0 degrees or directly East of center point (offset 0)
  ' you can off set the first point by some degree amount to spin the polygon by the offset
  
  offset = 0                                ' play with this to spin polygon
  ' offset = pi / 10 
  ' offset = pi / 18
  ' offset = pi / 36 
  
  for centralAngle = offset to 2*pi + offset step 2*pi / n
    '2*pi is a circle (360 degrees) divide by n get inner angles of pie slices that's our step

    'radius * cos(centralAngle) = our needed x coordinate to center point so add cx for absolute screen coordinate
    'radius * sin(centralAngle) = our needed y coordinate to center point so add cy for absolute screen coordinate
    if centralAngle=0+offset then           'first point location
      xstart = cx + radius * cos(centralAngle)
      ystart = cy + radius * sin(centralAngle) 'get the ball rolling by recording first point
    else
      line xstart, ystart, cx + radius * cos(centralAngle), cy + radius * sin(centralAngle)
      xstart = cx + radius * cos(centralAngle)
      ystart = cy + radius * sin(centralAngle)
    end if
    delay 300                               'to show the progress of draw
  next
  s="press any key ..."
  at cx - txtw(s) / 2, cy - txth(s) / 2:print s  'this puts cue right where you will see it
  pause
wend
'you are just a few simple steps away from spinning these polygons!
```

### Example 4: Plot sin, cos and tan

```
' sin-cos-tan.bas from FLTK samples
cls
at 0, ymax / 2 + txth("Q")

color 1:  print "sin(x)"
color 8:  print "cos(x)"
color 12: print "tan(x)"

line 0, ymax/2, xmax, ymax/2  'central or x axis, ymax/4 is multiplier scaled to 1/4 of ymax
for i = 0 to xmax
   pset i, ymax/2 - sin(i * 2*pi / ymax) * ymax/4 color 1
   pset i, ymax/2 - cos(i * 2*pi / ymax) * ymax/4 color 8
   pset i, ymax/2 - tan(i * 2*pi / ymax) * ymax/4 color 12
next
```


