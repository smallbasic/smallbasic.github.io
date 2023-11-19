# DRAW

> DRAW CommandString

Draw lines as specified by the given `CommandString`. The `CommandString` is created using commands from the Graphics Definition Language.
The start point for drawing can be defined using the PSET command. COLOR can be used to change the color of the lines.

### Graphics Definition Language

In the movement instructions below, n specifies a distance to move in pixel.

| Command | Description 
|---------| ---------
| Un      | Move up.
| Dn      | Move down.
| Ln      | Move left.
| Rn      | Move right.
| En      | Move diagonally up and right.
| Fn      | Move diagonally down and right.
| Gn      | Move diagonally down and left.
| Hn      | Move diagonally up and left.
| Mxy     | Move to coordinate x,y. If x is preceded by a + or -, the movement is relative to the last point referenced.
| B       | A prefix command. Next movement command moves but doesn't plot.
| N       | A prefix command. Next movement command moves, but returns immediately to previous point.


### Example 1: Let's draw a house

```
COLOR 9
PSET 80,80
DRAW "R50D70L25U25L15D25NR15"   ' House part 1
DRAW "L10U70E25F25"             ' House part 2
PSET 118,105
COLOR 3
DRAW "R8U16L16D16R8U10NR8U6"    ' Window
```

