### Language

> a NAND b

Bitwise exclusive NOT AND.

<pre>

' Two's complement is the standard way of representing negative integers in binary. 
' The sign is changed by inverting all of the bits and adding one.
Def invsgn(n) = ((n Nand n) + 1) - Frac(n) ' invert the sign of n
While True Do
  Input "Enter a number (Enter empty to stop) : ", n
  If Isstring(n) Then
    Stop
  Endif
  
  Print "This is the number with inverted sign: "; invsgn(n)
  Print
Wend

</pre>

