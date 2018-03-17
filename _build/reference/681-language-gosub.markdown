# GOSUB

> GOSUB label

Causes program execution to branch to the specified label; when the RETURN command is encountered, execution branches to the command immediately following the most recent GOSUB command.


~~~

' Note: using SUB instead of GOSUB is much more easy and modular.
  
x = 50
Gosub routine1 ' prints 100
Print x        ' prints 50
routine2 x     ' prints -50
Print x        ' prints 50
' Using GOSUB inside SUB:
Sub routine2(x)
  Gosub routine3
  Exit Sub
  
Label routine3
  x = -x
  Print x      
Return
End Sub
Pause
End ' End of program
' Using GOSUB with LOCAL variables:
Label routine1
  Local x = 100
  Print x
Return

~~~


