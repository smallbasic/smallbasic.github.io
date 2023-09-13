# VIEW

> VIEW [x1, y1, x2, y2 [, color [, border-color]]]

Defines a viewport with starting point (upper left corner)) `[x1,y1]` and end point (lower right corner) `[x2,y2]`. The optional parameters `color` and `border-color` define the background color and the border color of the viewport, respectively. VIEW without parameters will disable the last set viewport.

### Example

```
view                                            ' Disable viewport
rect 100,100, STEP 100,100 color 4 filled       ' Draw a rectangle in dark red

view 150,150, 300,300, 0, 13                    ' Set new viewport with black background and magenta border
rect 100,100, STEP 100,100 color 14 filled      ' Draw same rectangle in yellow
```
