# ATAN2

> a = ATAN2 (x, y)

Returns the angle `a` in radians of a right-angled triangle, where `x` is the opposite side and `y` is the adjacent side.  

### Example 1

```
x = 10                       ' Opposite side of right-angled triangle
y = 100                      ' Adjacent side of right-angled triangle

print deg( atan2(x, y) )     ' Output: 5.71059313749964
```

### Example 2: Graphics demo

```
' Both atan(n) and atan2(y, x) return an angle measured in radians.
' The return measure is from -pi to pi. In demo below it is converted
' to angle between 0 and 360 degrees.
' atan2 is better for detecting angle's quardrant because 
' x and y are given separartely.
' y the vertical change is given first.

centerX = xmax / 2
centerY = ymax / 2

pen on

while asc(inkey) <> 27
    cls
    locate 0,20: print  "ATAN2 demo, used to detect angle of mouse to screen center."
    at centerX + 210, centerY - 10 : Print "0 degrees (or radians)"

    line centerX, centerY, centerX + 200, centerY

    mouseX = pen(4) 
    mouseY = pen(5)

    line centerX, centerY, mouseX, mouseY, 15 'draw line from center to mouse

    differenceX = mouseX - centerX
    differenceY = mouseY - centerY 
    a = atan2(differenceY, differenceX)       ' < notice y difference is listed first

    if a < 0 then a += 2 * pi                 ' atan2 returns neg number for angles > 180

    arc centerX, centerY, 100, 0, a           'draw the arc from 0 to angle

    s = "Angle of mouse to center of screen ~ " + deg(a)\1 + " degrees"
    locate 30, 20 : print s
    showpage
    delay 10
wend
```


