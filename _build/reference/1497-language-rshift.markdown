# RSHIFT

> result = RSHIFT number, amount

Performs an arithmetic right shift on a bit pattern.




~~~

' Tested on 32-bit system (I'm not sure yet about the result on 64-bit system);
' On 32-bit system RSHIFT cannot manipulate correctly bit-31 (leftmost bit).
x = Pow(2, 30)          ' x = 0b 0100 0000 0000 0000 0000 0000 0000 0000
? Bin(x)
?
x = x Rshift 1          ' Shift-Right x by 1
? Bin(x)
x = x Rshift 29         ' Shift-Right x again by 29
? Bin(x)
?
x = Pow(2, 30)          ' x = 0b 0100 0000 0000 0000 0000 0000 0000 0000
x = x Rshift 33         ' The same as: x = x Rshift (33 Mod 32)
? Bin(x)
?
x = 0b1111 * Pow(2, 27) ' x = 0b 0111 1000 0000 0000 0000 0000 0000 0000
x = x Rshift 29         ' The two lower (11) bits are lost
? Bin(x)
? x                      ' x is 3

~~~


