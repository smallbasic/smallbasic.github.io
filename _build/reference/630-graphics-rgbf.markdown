# RGBF

> c = RGBF (r, g, b)

Returns the RGB color code for the specified color values. `r`, `g` and `b` are the three color channels red, green and blue and take floating point values from 0 to 1 for each of the colors. Values outside that range will be clamped. The return value is a negative 24bit value to be used by the drawing functions.

See also [Colors Tutorial](www.w3schools.com/colors/default.asp).

Additionally see the CSS color names unit in the article section, to use all 140 standard CSS colors in an easy way.

### Example 1

```
c = rgbf(0.047, 0.48, 0.94)
rect 10, 10,  50, 50 color c filled
rect 60, 10, 100, 50 color rgbf(0.047, 0.48, 0.94) filled
```

### Example 2: Clamping of values

```
c1 = rgbf(-0.55, 2.5, 0.94)    ' same as rgbf(0, 1, 0.94)
c2 = rgbf(0, 1, 0.94)
rect 10, 10,  50, 50 color c1 filled
rect 60, 10, 100, 50 color c2 filled
```

### Example 3: Fading colors

```
Def txt(t) = "     " + t + "     "
For c = 0 to 1 step 0.01
    Color 15, Rgbf(c,     0,   0): At 10,   0: Print txt("1. RED");
    Color 15, Rgbf(0,     c,   0): At 10,  30: Print txt("2. GREEN");
    Color 15, Rgbf(0,     0,   c): At 10,  60: Print txt("3. BLUE");
    Color 15, Rgbf(0,     c,   c): At 10,  90: Print txt("4. CYAN");
    Color 15, Rgbf(c,     c,   0): At 10, 120: Print txt("5. YELLOW");
    Color 15, Rgbf(c,     0,   c): At 10, 150: Print txt("6. MAGENTA");
    Color 15, Rgbf(c,     c,   c): At 10, 180: Print txt("7. GRAY");
    Color 15, Rgbf(c,   c\2,   0): At 10, 210: Print txt("8. ORANGE");
    Color 15, Rgbf(c\2, c\2,   0): At 10, 240: Print txt("9. OLIVE");
    Color 15, Rgbf(c\2, c\4,   0): At 10, 270: Print txt("A. BROWN");
    Color 15, Rgbf(c,     0, c\2): At 10, 300: Print txt("B. PINK");
    Color 15, Rgbf(0,     0, c\3): At 10, 330: Print txt("C. NAVY");
    Color 15, Rgbf(c\3, c\2,   c): At 10, 360: Print txt("D. SKY");
    Delay 20
Next
```

