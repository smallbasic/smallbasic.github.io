# Data

> REDIM x

Same as DIM only the contents of x are preserved.

<pre>

' inspired by Bambi56...
Option Base 1 ' Start arrays at 1 (not 0)
Const FILENAME = "One hell of a REDIM.tmp" 
' Save 6 lines in demo file:
Open FILENAME For Output As #1
 ? #1, "one"
 ? #1, "two"
 ? #1, "three"
 ? #1, 1
 ? #1, 2
 ? #1, 3; ' (Using ; to avoid an extra empty line).
Close #1
' Load 6 lines from demo file:
Tload FILENAME, lines
Color 15
? "One hell of a REDIM..."
Color 7
' Print lines before redim:
?
? "lines before REDIM: "; lines
?
' Redim lines into two columns:
Const TOTAL_LINES = Len(lines) \\ 2
Redim lines(1 To 2, 1 To TOTAL_LINES)
' Print lines after redim:
? "lines after REDIM:  "; lines
?
For l = 1 To TOTAL_LINES
  ? lines(1, l);      ' First column
  Locate Ypos, 15 
  ? lines(2, l)       ' Second column
Next row
Pause

</pre>

I never would have guessed you could TLOAD an OPENed file and Bambi56 used the file number from OPEN to do the TLOAD.
Very interesting...
