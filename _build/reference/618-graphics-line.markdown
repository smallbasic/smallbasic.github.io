# LINE

> LINE [STEP] x,y [,|STEP x2,y2] [, color| COLOR color]

Draws a line from the point (x,y) to the point (x2,y2). If `STEP` is used, the graphics cursor is moved by a step of x and y pixels.
When `color` is specified, instead of the actual foreground color the line will be drawn with the color `color`. 

By default LINE draws with anti-aliasing. For details, see: [Xiaolin Wu's line algorithm](https://en.wikipedia.org/wiki/Xiaolin_Wu%27s_line_algorithm).
To turn off anti-aliasing, add this to the start of your program:

```
option predef antialias off
```

### Example 1: Line defined by two points

```
line 20, 20, 100, 100
```

### Example 2: Line defined using STEP

```
line 20, 20, STEP 80,80                      ' Line starts at point (20,20) 
                                             ' and ends at point (20+80, 20+80) -> (100,100)
line STEP -80, -70, STEP 80,80               ' Line starts at last graphics cursor position 
                                             ' plus step values (100-80,100-70) -> (20,30)
                                             ' and ends at last graphics cursor position 
                                             ' plus step values (20+80, 30+80) -> (100,110)
line STEP -80, -70, 100, 120                 ' Line starts at last graphics cursor position 
                                             ' plus step values (100-80,110-70) -> (20,40)
                                             ' and ends at the point (100,120) 
```

### Example 3: Using colors

```
line 20, 30, 100, 110 color 2
line 20, 40, 100, 120, 3
line 20, 50, 100, 130, rgb(0,255,0)
line 20, 60, 100, 140 color rgb(0,255,255)
```


