# PAINT

> PAINT [STEP] x, y [,fill-color [,border-color]]

Fills an enclosed area on the graphics screen with the color `fill-color`. `x` and `y` are screen coordinates within the area that is to be filled.

If `border-color` is specified then PAINT will fill outwards until is meets the specified border-color. If the border-color is not specified then PAINT
will fill the area until it meets a color which is not the original color at `[x,y]`. Please note that border-color needs to be specified using the
functions RGB or RGBF.

If the keyword STEP is used, `x` and `y` move the graphics cursor in pixel. The area will be filled starting from this new position of the graphics cursor.

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

### Example 2: Fill with specified fill-color and border-color

```
' draw a diamond shaped polygon
polygon = [[100,100], [150,50], [200,100], [150,200], [100,100]]
color 14
drawpoly polygon

' draw a rectangle on top of the diamond
RectColor = rgb(255,0,255)
color RectColor
rect 120,60,180,180


' fill area inside rect
paint 150,130, 11, RectColor        ' Border color needs do be set with RGB(...)
```


