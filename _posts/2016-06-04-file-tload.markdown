---
permalink: /598
layout: post
title:  "TLOAD"
categories: file
---
File

TLOAD file, BYREF var [, type]

Loads a text file into array variable. Each text-line is an array element. type 0 = load into array (default), 1 = load into string.

Both these methods load a string/text file into an array.
```

' TLOAD.bas  SmallBASIC 0.12.2 [B+=MGA] 2016-04-04
'with TLOAD you don't even have to dim your array to have it created
me="TLOAD.bas"
TLOAD me,ta    '<==== it's all done in one line!
'show me
for ln = 0 to ubound(ta)
  ? ln;" ";ta(ln)
next
?
?"compare TLOAD above to INPUT method below to load array"
?
'compare to this
dim ia()
open me for input as #1
while not eof(1)
  input #1, aline
  ia << aline
wend
close #1            '<=== this took 7 lines
'show me again
for ln = 0 to ubound(ia)
  ? ln;" ";ia(ln)
next
pause

```

```

' See also: Home -- Articles -- Welcome to SmallBASIC -- *Arrays and Matrices*
Option Base 1 ' Start arrays at 1 (not 0)
' Save few text lines in demo file:
s1 = "xx_1 xx_2"
s2 = "yy_1      yy_2  yy_3"
s3 = "  zz_1   zz_2 "
s4 = "JEQ"
Open "demo.tmp" For Output As #1
 Print #1, s1
 Print #1, s2
 Print #1, s3
 Print #1, s4
Close #1
' Load demo file into 1-dimension array:
Tload "demo.tmp", lines, 0
Const MAX_LINES = Ubound(lines)
Const BLANK = " "
' Convert array to nested array and display it:
For i = 1 To MAX_LINES
  
  ' Split array into words, i.e. nested array; space, " ", is the delimiter:
  Split Squeeze(lines(i)), BLANK, lines(i)
  ?
  ? "Line "; i; ":   "; lines(i)
  ' Print word for each column:
  For w = 1 To Len(lines(i))
    ?  "Column "; w; ": "; lines(i)(w) ' (i)(w) is a nested array...
  Next
Next
Pause

```

