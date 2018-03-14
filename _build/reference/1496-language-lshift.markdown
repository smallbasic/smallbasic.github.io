# Language

> result = LSHIFT number, amount

Performs an arithmetic left shift on a bit pattern.



<pre>

' Tested on 32-bit system (I'm not sure yet about the result on 64-bit system):
x = 1                 ' x = 1 (0b1)
? Bin(x)
?
x = x Lshift 1        ' Shift-Left x by 1
? Bin(x)
x = x Lshift 30       ' Shift-Left x again by 30
? Bin(x)
?
x = 1 Lshift 33        ' The same as: x = 1 Lshift (33 Mod 32)
? Bin(x)
?
x = 0b1111 Lshift 30   ' The two upper bits are lost (on 32-bit system)
? Bin(x)
? x                    ' x is -1073741824  (on 32-bit system)

</pre>

