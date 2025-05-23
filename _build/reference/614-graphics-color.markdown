# COLOR

> COLOR foreground-color [, background-color]

Specifies the foreground color `foreground-color` and the optional background color `background-color`.

Color can be either an index from the build in color palette (see table) or the return value of the
commands `RGB` and `RGBF`.

| Index | Color                                                     |
|:-----:|:----------------------------------------------------------|
| 0     | <font style='color:#000000'>&block;</font> black          |
| 1     | <font style='color:#000080'>&block;</font> blue           |
| 2     | <font style='color:#008000'>&block;</font> green          |
| 3     | <font style='color:#008080'>&block;</font> cyan           |
| 4     | <font style='color:#800000'>&block;</font> red            |
| 5     | <font style='color:#800080'>&block;</font> magenta        |
| 6     | <font style='color:#808000'>&block;</font> yellow         |
| 7     | <font style='color:#c0c0c0'>&block;</font> white          |
| 8     | <font style='color:#808080'>&block;</font> gray           |
| 9     | <font style='color:#0000ff'>&block;</font> bright blue    |
| 10    | <font style='color:#00ff00'>&block;</font> bright green   |
| 11    | <font style='color:#00ffff'>&block;</font> bright cyan    |
| 12    | <font style='color:#ff0000'>&block;</font> bright red     |
| 13    | <font style='color:#ff00ff'>&block;</font> bright magenta |
| 14    | <font style='color:#ffff00'>&block;</font> bright yellow  |
| 15    | <font style='color:#ffffff'>&block;</font> bright white   |

### Example 1

```
color 14, 1
print "Yellow text on blue background"
```

### Example 2: Assigning SmallBASIC standard colors to text

```
For back = 0 To 7 Do
  text = back Xor 15 ' count down text color (15 to 8)
  
  Color text, back
  Print Using " FG and BG COLOR: ##, ## "; text, back;
  
  Color back, text ' reverse colors
  Print Using " FG and BG COLOR: ##, ## "; back, text
Next
```

### Example 3: Using RGB and RGBF to draw a magenta filled rectangle with white boarder

```
color rgb(255, 67, 133)
rect 10, 10, 100, 100 filled  ' filling always with foreground color

color rgbf(1, 1, 1)
rect 10, 10, 100, 100
```

### Example 4: Assigning RGB-colors to text

```
Print "Try color printing with some RGB shades"
Print
For shade = 0 To 10
  text = rgb(shade * 25, 0, 0)
  back = rgb(255 - shade * 25, 255 - shade * 25, 255 - shade * 25)
  
  Color text, back
  
  Print "Here is black to red on white to black "; shade * 25; ","; 255 - 25 * shade
  
  Color back, text ' reverse colors
  
  Print "Here is reverse white to black on black to red."
  print
Next
```

### Example 5: Chart of the 16 SmallBASIC standard colors and their numbers

```
' Color chart of the 16 SmallBASIC standard colors
' for 0 = black to 15 = bright white
dy = ymax / 16
for i = 0 to 15
  rect 0, i * dy, xmax, i * dy + dy, i filled
  at 0, i * dy : print i;
next
```

### Example 6

You may include "color_const.bas" file in another file to make your code more clear.

```
' demo - add these lines to another BAS file:
' ------------------------------------------
'  Include "color_const.bas" ' actuall filename must be lower case for Linux.
'
'  Circle 200, 200, 50, 1, YELLOW FILLED
'  Color BRIGHT_MAGENTA, BLUE: ? "Bright Magenta on Blue"
' ------------------------------------------
' color_const.bas - COLOR values for characters and pixels:
Const BLACK           = 0
Const BLUE            = 1
Const GREEN           = 2
Const CYAN            = 3
Const RED             = 4
Const MAGENTA         = 5
Const BROWN           = 6
Const WHITE           = 7
Const GRAY            = 8
Const BRIGHT_BLUE     = 9
Const BRIGHT_GREEN    = 10
Const BRIGHT_CYAN     = 11
Const BRIGHT_RED      = 12
Const BRIGHT_MAGENTA  = 13
Const YELLOW          = 14
Const BRIGHT_WHITE    = 15
```


