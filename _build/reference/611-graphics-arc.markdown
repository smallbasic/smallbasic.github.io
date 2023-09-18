# ARC

> ARC [STEP] x, y, r, astart, aend [, aspect [, color]] [COLOR color]

Draws an arc:

- `[x, y]`: center point
- `r`: radius in pixel
- `astart`, `aend`: first anf last angle in radians
- `aspect`: aspect ratio
- `color`: line color

If STEP is used `x` and `y` are a step from the last position of the graphics cursor.

### Example 1

```
x = 100
y = 100
r = 50
astart = 0
aend = rad(90)

ARC x, y, r, astart, aend
```

### Example 2: Using STEP

```
x = 50
y = 50
r = 50
astart = 0
aend = rad(90)

pset(100,100)                      ' Draw point at 100,100 and set the graphics cursor to 100,100
ARC STEP x, y, r, astart, aend     ' make a step from 100,100 by 50 pixels in x and 50 pixels in y
```
