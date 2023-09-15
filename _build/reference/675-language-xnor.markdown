# XNOR

> n = a XNOR b

Bitwise exclusive NOT OR.

Truth table:

| a | b | a XNOR b |
|:-:|:-:|:--------:|
| 0 | 0 | 1        |
| 0 | 1 | 0        |
| 1 | 0 | 0        |
| 1 | 1 | 1        |

### Example 1

The NOT-operation as part of XNOR performs a bitwise inversion on all bits of a number. This leads to the following (maybe unexpected) result: 

```
print bin(0 xnor 0)     ' Output: 11111111111111111111111111111111
```

### Example 2: Operate XNOR only on last n bits

If you want to operate NOR only on the last `n` bits of the numbers, you can use the following code:

```
n = 4
a = 0b1100
b = 0b1010

print bin((a XNOR b) BAND ((1 lshift n ) - 1)) 

' Output 1001
```

