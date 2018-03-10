### Graphics

> PAINT [STEP] x, y [,fill-color [,border-color]]

Fills an enclosed area on the graphics screen with a specific color. x,y = Screen coordinate (column, row) within the area that is to be filled.


<p>If border-color is specified then PAINT will fill outwards until is meets the specified border-color - (fill-until, color!=point(x,y))
<p>If the border-color is NOT specified then PAINT will fill the area with the same color as the pixel at x,y - (fill-while, color=point(x,y))

