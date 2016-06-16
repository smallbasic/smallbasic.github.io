---
permalink: /1439
layout: post
title:  "CHAIN"
categories: system
---
System

CHAIN source

Compile and run the given source. Source can be a file name, a line of code or an array of code. Use ENV to share variables with the parent process.

<pre>

' Note: CHAIN behaves like EVAL function in other languages.
Option Base 1 ' (for 'IN' keyword which is 1-Based)
' Code using constants:
Chain "? \\"100 + 50 is: \\"; 100 + 50: Pause" ' (100 + 50 = 150)

' Code using variables:
Environ "SB1=6" ' add two unique variables (for reuse)
Environ "SB2=2"
Chain "? Env(\\"SB1\\") ^ Env(\\"SB2\\"): Pause" ' (SB1 ^ SB2 = 36)

' Code using an array:
Environ "SB1=3"  ' reuse SB1 variable
Dim a()          ' append code to array a
a << "x = Env(\\"SB1\\")"
a << "For i = 1 To 5"
a << "? i * x; Spc(1);"
a << "Next i"
a << "Pause"
Chain a ' prints 3 6 9 12 15

' Code using a file name (output a array to demo file):
Const FILE_NAME = "demo.bas"
Environ "SB1=4"  ' reuse SB1 variable
Open FILE_NAME For Output as #1
For i In a
  ? #1, i; ":"; ' output all code as a single string, ":";
Next i
Close #1
?
Chain FILE_NAME ' prints 4 8 12 16 20

' Now append to file name a return value (on the same line):
Environ "SB1=5"  ' reuse SB1 variable
Open FILE_NAME For Append As #1
? #1, "Env \\"SB1=\\" + Str(i):"; ' add extra space or ":"
Close #1
?
Chain FILE_NAME ' prints 5 10 15 20 25
Color 15 ' print the return value from file
? " (Return value SB1 is: "; Env("SB1"); ")" ' (i is 6)
Pause

</pre>

<pre>

Const FILENAME = "demo.bas"
' Create demo bas file (could be any SmallBASIC file):
Open FILENAME For Output As #1
? #1, "Sub count10(n)"
? #1, "  Local i"
? #1, "  Color 14"
? #1, "  For i = n To 10
? #1, "    Print i; " + Enclose(", ") + ";" 
? #1, "  Next i"
? #1, "  Environ " + Enclose("SB1=") + " + Str(i) ' return value to parent
? #1, "End Sub"
? #1, 
? #1, "Color 7: ? " + Enclose("I'm The Child Program...! I can count!") + ": ?"
? #1, 
? #1, "n = Val(Environ(" + Enclose("SB1") + ")) ' get value from parent"
? #1, 
? #1, "count10 n ' run sub-routine to count n to 10"
? #1, 
? #1, "?:?"
Close #1
' Load demo bas file into array:
Tload FILENAME, lines
Environ "SB1=2" ' Set value for child program (1..10)
' Execute the demo bas file (the array):
Chain lines
' now print the return value from child program:
Color 7:  ? "I'm The Parent Program..."
?
Color 15: ? "Child program returned value: "; Environ("SB1")
Pause

</pre>

<pre>

' Dedicated to MGA.
' s is any legal SmallBASIC Math Expression as String, e.g. "1 + 2 / 4"
Func EVAL(s)
  ' It takes 2 lines of SmallBASIC code to implement Math EVAL Function:
  Chain "Environ " + Enclose("SBEVAL=") + " + Str(" + s + ")"
  eval = Val(Environ("SBEVAL"))
End Func

' now run few demos:
? eval("1+2") ' prints 3, ...
? eval("Rad(45) * 2") 
? eval("PI / 2 + PI")
? eval("0b1111 * Pow(2, 4)")
? eval("Sin(2) * Tan(4) / Cos(6)")
? eval("1 + 2 / 4")
? eval("6 * (Pow(2, 4) * 8)")
? eval("Rad((45 * 3) - 20) * 2")
Pause

</pre>

