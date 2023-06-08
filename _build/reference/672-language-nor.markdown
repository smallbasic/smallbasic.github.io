# NOR

> y = a NOR b

Bitwise NOT OR.

Truth table:

| a | b | a NOR b |
|:-:|:-:|:-------:|
| 0 | 0 | 1       |
| 0 | 1 | 0       |
| 1 | 0 | 0       |
| 1 | 1 | 0       |

### Example 1

The NOT-operation as part of NOR performs a bitwise inversion on all bits of a number. This leads to the following (maybe unexpected) result: 

```
print 1 NOR 1   ' Output: 11111111111111111111111111111110 
```

### Example 2: Operate NOR only on last n bits

If you want to operate NOR only on the last `n` bits of the numbers, you can use the following code:

```
n = 4
a = 0b1010
b = 0b1000

print bin((a NOR b) BAND ((1 lshift n ) - 1)) 

' Output 101
```

### Example 3: Set a bit

```
Def Bnot(n) = n Nor n                       ' Bnot inverts all bits in n (it's very useful for inverting a mask).
Def mask(i) = Pow(2, i)                     ' return a mask of only bit-i set (base 0)
Def set_bit(n, i) = n Bor mask(i)           ' set bit-i in n (base 0)
Def reset_bit(n, i) = n Band Bnot(mask(i))  ' reset bit-i in n (base 0)
Def get_bit(n, i) = (n Band mask(i)) <> 0   ' return bit-i status: 0 or 1
 
Color 15,0
cls

Print "* Set/Reset bit is useful for storing boolean data efficiently."
Print "* The rightmost bit of binary number is bit-0, then bit-1, etc."
Print "* This SB version supports "; Len(Bin(0)); " bits binary numbers."
Print
  
While True Do
    Color 15,0
    Input " Enter a number (Enter empty to stop): ", n
    If isstring(n) Then
        Stop
    Endif
  
    Print
    Color 14, 0: Print " In Binary is: "; Bin(n)
    Color  7, 0: Print " Bit-3 status: "; get_bit(n, 3)
    If get_bit(n, 3) Then
        Color 11, 0: Print " Reset bit-3:  "; Bin(reset_bit(n, 3))
    Else
        Color 15, 0: Print " Set bit-3:    "; Bin(set_bit(n, 3))
    Endif
    Print
Wend
```
