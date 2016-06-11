---
permalink: /800
layout: post
title:  "STRING"
categories: string
---
String

STRING ( count [,start | s] )

Creates a new string of count length.

```

Def rainbow = Floor((Rnd * 100) Mod 16) ' random text color 0 to 15
' parameters for printing a box:
Const ROW = 2 
Const COLUMN = 1 
Const HEIGHT = 8 
Const WIDTH = 9
 
While True Do
  Color 7, 0: Cls
  Input "Enter 1 to 5 character(s) [Enter empty to stop]"; c
  c = Left(Str(c), 5) ' 12 -> "12"; 0 -> "0",  etc
  If Empty(c) Then ' c is ""?
    Stop
  Endif
 
  ' print box top line:
  Color rainbow: Locate ROW, COLUMN: Print String(WIDTH, c);
  ' print box vertical lines:
  v_lines = c + Space((WIDTH - 2) * Len(c)) + c
  For r = ROW + 1 To ROW + HEIGHT - 2 Do
    Color rainbow: Locate r, COLUMN: Print v_lines;
  Next
  ' print box down line:
  Color rainbow: Locate ROW + HEIGHT - 1, COLUMN: Print string(WIDTH, c);
  
  Color 7: Locate ROW + HEIGHT + 2, COLUMN: Print "Press any key...";
  Pause
Wend

```

I wasted a day trying to figure what "Invalid parameter" was causing a Mastermind program from crashing under certain circumstances. 
Turns out STRING can't handle a 0 value in first argument. It would have been nice if the program stopped on that statement instead all the other places it had.
```

'in this little example code does stop with cursor on the wrong line
cows = 2
? string(3,"Bulls")+string(cows,"Cows") 'returns BullsBullsBullsCowsCows
cows =0
? string(3,"Bulls")+string(cows,"Cows") 'Error: "Invalid parameter"
pause
end

```

How to understand this syntax "STRING ( count [,start | s] )":
' start is an ASCII value of a string character:
x = STRING(2, ASC("Hello ")) 
? x ' --> x is "HH"
' s is a string of any length:
x = STRING(2, "Hello ") 
? x ' --> x is "Hello Hello " 
