# PAINT

> PAINT [STEP] x, y [,fill-color [,border-color]]

Fills an enclosed area on the graphics screen with a specific color. x,y = Screen coordinate (column, row) within the area that is to be filled.

If border-color is specified then PAINT will fill outwards until is meets the specified border-color - (fill-until, color!=point(x,y))
If the border-color is NOT specified then PAINT will fill the area with the same color as the pixel at x,y - (fill-while, color=point(x,y))

### Example 1: Fill without specified border-color

```
' draw a diamond shaped polygon
polygon = [[100,100], [150,50], [200,100], [150,200], [100,100]]
color 14
drawpoly polygon

' draw a rectangle on top of the diamond
color 13
rect 120,60,180,180

' fill area inside
color 12
paint 150,130
```




