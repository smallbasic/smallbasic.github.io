# XOR

> a XOR b

Bitwise exclusive OR. Equivalent syntax to: a ~ b

<pre>

' return true if n is ASCII code of letter (A-Z|a-z); e.g. ? isAbc(Asc("z"))
Def isAbc(n) = ((n >= 65 And n <= 90) Or (n >= 97 And n <= 122))

' change case of string s; mode is -1, 0, 1 (lower, invert, upper). 
Func ccase(s, mode)
  Local i, n
  
  For i = 1 To Len(s)
    n = Asc(Mid(s, i, 1))
    If isAbc(n) Then
      Select Case mode
        Case -1: n = n Bor  0b00100000 ' set bit-5 to lower case
        Case  0: n = n Xor  0b00100000 ' invert bit-5 to invert case
        Case  1: n = n Band 0b11011111 ' reset bit-5 to upper case 
      End Select
      s = Replace(s, i, Chr(n))
    Endif
  Next
  ccase = s
End

' run demo:
Repeat
  Cls
  Input "Enter a string (Enter empty to stop): ", s
  
  Print
  Print "  Upper case: "; ccase(s, 1)
  Print "  Lower case: "; ccase(s, -1)
  Print " Invert case: "; ccase(s, 0)
  Pause
Until s = ""

</pre>

XOR is Not equivalent syntax to: a ~ b
~ is bitwise NOT, for example: ~b
