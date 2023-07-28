# RECT

> RECT [STEP] x1,y1 [,|STEP x2,y2] [, color| COLOR color] [FILLED]

Draws a rectangle from point `x1,y1` to point `x2,y1`. If STEP is used, start point and/or end point are relative to the current graphics cursor position. The line color of the rectangle will be `color`. If `color` is omitted then the current foreground color will be used as line color. When using FILLED, the rectangle will be filled with color `color` or with the current foreground color.

### Example 1: Draw rectangles

```
                                ' Draws a rectangle:
rect 200, 100                   ' at point [0,0], width 200, height 100
rect 10, 10, 210, 110           ' from proint [10,10] to point [210,110]
rect 20, 20, STEP 200, 100      ' at point [20,20], width 200, height 100
rect STEP 10,10, 420, 220       ' from last graphics cursor position + [10,10]
                                ' to point [420,100]
rect STEP 10,10, STEP 200, 100  ' from last graphics cursor position + [10,10],
                                ' width 200, height 100
```

### Example 2: Draw rectangles with color

```
rect 10, 10, STEP 200, 100, 12
rect 20, 20, STEP 200, 100 COLOR 13
rect 30, 30, STEP 200, 100, rgb(50,255,20)

rect 10, 140, STEP 200, 100, 12 FILLED
rect 20, 150, STEP 200, 100 COLOR 13 FILLED
rect 30, 160, STEP 200, 100, rgb(50,255,20) FILLED

color 11
rect 10, 270, STEP 200, 100
rect 20, 280, STEP 200, 100 FILLED
```
