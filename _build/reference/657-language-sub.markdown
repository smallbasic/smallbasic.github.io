# Language

> SUB foo (a, b)

Declare a sub procedure. Sub's do not return a value but can return argument values when declared as BYREF.

<pre>

' Notes: Using SUB is much more easy and modular then using GOSUB.
'        With SUB (and FUNC) you can divide your program into many logical and
'        independent blocks, instead of writing a long "spaghetti code"...
' See also: Home -- Articles -- Welcome to SmallBASIC -- 
'           Syntax of procedure (SUB) statements & 
'           Syntax of function (FUNC) statements.
x = 9
routine1 x ' prints 9 (Passing 'x' by value)
Print x    ' prints 9
routine2 x ' prints 9 (Passing 'x' by reference)
Print x    ' prints 10
routine3 x ' prints 10 (Passing 'x' by reference)
Print x    ' prints 11 
routine4 x ' prints 11 (Use the LOCAL keyword for local variables)
Print x    ' prints 11
routine5 x ' prints 100 (Passing 'x' by value to nested procedures)
Print x    ' prints 11
Pause

' Passing 'x' by value (default):
Sub routine1(x)
  Print x
End Sub
' Passing 'x' by reference (BYREF x):
Sub routine2(Byref x)
  Print x
  x = 10
End Sub
' Passing 'x' by reference (@x is same as BYREF x):
Sub routine3(@x)
  Print x
  x = 11
End Sub
' Use the LOCAL keyword for local variables:
Sub routine4(y)
  Local x
  Print y
  x = 12
End Sub
' Passing 'x' by value to nested procedures:
Sub routine5(x)
  x = 100
  routine6 x
  Sub routine6(x)
    Print x
  End Sub
End Sub

</pre>

