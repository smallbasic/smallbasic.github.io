---
layout: post
title:  "COLOR"
categories: graphics
---
Graphics

COLOR foreground-color [, background-color]

Specifies the foreground and background colors.

```

Print "0 to 15 colors available for printing text..."
Print
For back = 0 To 7 Do
  text = back Xor 15 ' count down text color (15 to 8)
  
  Color text, back
  Print Using " text_, back COLOR ##, ## "; text, back;
  
  Color back, text ' reverse colors
  Print Using " text_, back COLOR ##, ## "; back, text
Next
Pause

```


```

Print "Try color printing with some RGB shades"
Print
For shade = 0 To 10
  text = rgb(shade*25,0,0)
  back=rgb(255-shade*25,255-shade*25,255-shade*25)
  Color text, back
  Print "Here is black to red on white to black ";shade*25;",";255-25*shade
  
  Color back, text ' reverse colors
  Print "Here is reverse white to black  on black  to red."
  print
Next
Pause

```

Here is chart of the 16 QB colors and their numbers:
```

'QB color chart of 16 colors for 0 = black to 15 = bright white
dy=ymax/16
for i=0 to 15
  rect 0,i*dy,xmax,i*dy+dy,i filled
  at 0,i*dy:? i;
next
pause

```

SmallBASIC recognizes two color Systems RGB(red,green,blue) and QB colors 0-15 (3 systems if you count RGBF which is like RGB but instead of 0-255 for each of red, green blue in RGB, the RGBF uses scale 0-1 for each of red,green, blue).
You may <strong>Include</strong> "color_const.bas" file in another file to make your code more clear.
```

' demo - add these lines to another BAS file:
' ------------------------------------------
'  Include "color_const.bas" ' actuall filename must be lower case for Linux.
'
'  Circle 200, 200, 50, 1, YELLOW FILLED
'  Color BRIGHT_MAGENTA, BLUE: ? "Bright Magenta on Blue"
' ------------------------------------------
' color_const.bas - COLOR values for characters and pixels:
Const BLACK   = 0
Const BLUE    = 1
Const GREEN   = 2
Const CYAN    = 3
Const RED     = 4
Const MAGENTA = 5
Const BROWN   = 6
Const WHITE   = 7
Const GRAY    = 8
Const BRIGHT_BLUE  = 9
Const BRIGHT_GREEN = 10
Const BRIGHT_CYAN  = 11
Const BRIGHT_RED   = 12
Const BRIGHT_MAGENTA = 13
Const YELLOW       = 14
Const BRIGHT_WHITE = 15

```

