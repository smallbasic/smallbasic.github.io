# NAND

> y = a NAND b

Bitwise exclusive NOT AND.

Truth table:

| a | b | a NAND b |
|:-:|:-:|:--------:|
|0  | 0 | 1        |
|0  | 1 | 1        |
|1  | 0 | 1        |
|1  | 1 | 0        |


### Example 1

The NOT-operation as part of NAND performs a bitwise inversion on all bits of a number. This leads to the following (maybe unexpected) result: 

```
print 1 NAND 1   ' Output: 11111111111111111111111111111110
```

### Example 2: Operate NAND only on last n bits

If you want to operate NAND only on the last `n` bits of the numbers, you can use the following code:

```
n = 4
a = 0b1101
b = 0b1001

print bin((a NAND b) BAND ((1 lshift n ) - 1)) 

' Output 110
```

### Example 3: Two's complement

> Two's complement is a mathematical operation to reversibly convert
> a positive binary number into a negative binary number with equivalent negative value. ([Wikipedia](https://en.wikipedia.org/wiki/Two%27s_complement))

```
' Two's complement is the standard way of representing negative integers in binary. 
' The sign is changed by inverting all of the bits and adding one.

Def invsgn(n) = ((n Nand n) + 1) - Frac(n)              ' invert the sign of n

While True Do
  Input "Enter a number (Enter empty to stop) : ", n
  If Isstring(n) Then
    Stop
  Endif
  
  Print "This is the number with inverted sign: "; invsgn(n)
  Print
Wend
```



