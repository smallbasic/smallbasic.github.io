# LINE

> LINE [STEP] x,y [,|STEP x2,y2] [, color| COLOR color]

Draws a line.

Example:

```
line 20,40,140,40 color 2
line 20,80,140,80 color 2
line 60,0,60,120 color 2
line 100,0,100,120 color 2
```

By default LINE draws with anti-aliasing. For details, see: [Xiaolin Wu's line algorithm](https://en.wikipedia.org/wiki/Xiaolin_Wu%27s_line_algorithm){target=_blank}

To turn off anti-aliasing, add this to the start of your program:

```
 option predef antialias off
```
