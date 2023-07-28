# REM

> REM comment

Code comments. Comments can also be introduced using `#`, single quote character `'`.

The `#` character can only be used as remarks if it is the first character of the line.

### Example 1:

```
' That text-line is just a few remarks
REM another comment
# one more comment
```

### Example 2:

```
' Although the code is very short (less then thousands of lines...), it's
' almost impossible to decode it... - That's why comments are so useful:
' to remind *yourself* and others what you did and why.
' Let's try to analyze "Curlie borealis.bas" code and add few comments to it:

' --- Start of "Curlie borealis.bas" + Comments:
' Initialize variables for the main loop:
Randomize           ' - I'm not sure why do we need it here... (MGA?)
ff = 440.03         ' Factor for defining x,y location to draw point
maxi = 25000        ' Maximum points to draw in each shape
maxi2 = maxi \ 2    ' Factor for defining two different color schemes in shape
b = Rgb(40, 20, 30) ' Background color
Color 0, b
Cls
' Run program in an endless loop (Press Ctrl+B or Ctrl+C to stop):
While 1
  ff += 9.444 ' Move the next shape to different x,y location

  ' Draw a single shape using two color schemes, or draw an invisible shape:
  For i = 0 To maxi
    ' Define location (x,y) to draw a single point:
    f += ff
    x = Min(xmax, -x + Cos(f * i)) ' (MIN makes sure location is within screen)
    y = Min(ymax, -y + Sin(f * i))

    ' Define nice color to draw a point:
    If cc Mod 6 = 0 Then
      If i < maxi2 Then ' One color scheme
        c = Rgb(255 - 255 * i \ maxi2, 255 * i \ maxi2, 0)
      Else              ' Second color scheme
        c = Rgb(0, 255 - 255 * (i - maxi2) \ maxi2, 255 * (i - maxi2) \ maxi2)
      Fi
    Else
      c = b ' Use background color to draw invisible shape
    Fi

    ' Draw a single point (pixel):
    Pset x, y, c
    If i Mod 5000 = 0 Then Showpage ' Update screen each 5000 points (smoother)
  Next
  cc++ ' Counter for drawing invisible shape (using background color)
Wend
' --- End of "Curlie borealis.bas" + Comments

' To sum up:
' Whether you write a short program or long, comments will help you
' and others to understand, debug and improve your program later on; i.e.
' comments make your code useful!
REM "Curlie borealis.bas" code example taken from:
REM http://smallbasic.sourceforge.net/?q=comment/1184#comment-1184
REM Without explicit permission from MGA...
```


