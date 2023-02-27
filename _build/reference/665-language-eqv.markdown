# EQV

> a EQV b

Bitwise equivalence.

Truth table:

| a | b | a EQV b |
|:-:|:-:|:-------:|
| 0 | 0 | 1       |
| 0 | 1 | 0       |
| 1 | 0 | 0       |
| 1 | 1 | 1       |

### Example 1: Print truth table

```
print "0 eqv 0 = " + bin(0 eqv 0)
print "0 eqv 1 = " + bin(0 eqv 1)
print "1 eqv 0 = " + bin(1 eqv 0)
print "1 eqv 1 = " + bin(1 eqv 1)
```

### Example 2: Bitwise equivalence of two numbers

```
a = 0b110010011111000010101011
b = 0b101010010101011100010101

print "    " + bin(a)
print "EQV " + bin(b)
print "----------------------------"
print "    " + bin(a eqv b)

' Output:
'
'     110010011111000010101011
' EQV 101010010101011100010101
' ----------------------------
'     100111110101100001000001
```

