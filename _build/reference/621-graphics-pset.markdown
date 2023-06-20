# PSET

> PSET [STEP] x,y [, color| COLOR color]

Draws a pixel at coordinate `x`,`y` with color `color`. If `color` is not defined, the current foreground color will be used.
If STEP is used, the graphics cursor will be moved by `x` pixels in x-direction and `y` pixel in y-direction and then the pixel
will be drawn.

### Example:

```
color 10                    ' Set foreground color 10
PSET 50,50                  ' Point at 50,50 with foreground color 
PSET 60,60, 11              ' Point at 60,60 with color 5
PSET 70,70 COLOR 12         ' Point at 70,70 with color 6
PSET 80,80, rgb(255,255,0)  ' Point at 80,80 with color yellow
PSET STEP 10,10 COLOR 13    ' Point at 90,90 with color 7
```
