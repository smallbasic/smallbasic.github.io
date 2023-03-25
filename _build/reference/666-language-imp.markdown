# IMP

> a IMP b

Perform a logical implication on two expressions. IMP is equivalent to (NOT a) OR b.

### Truth table

| a | b | a IMP b |
|:-:|:-:|:--------|
| 0 | 0 | 1       |
| 0 | 1 | 1       |
| 1 | 0 | 0       |
| 1 | 1 | 1       |

### Example 1

```
print "Truth table"
print
print "0 IMP 0 = "; 0 IMP 0
print "0 IMP 1 = "; 0 IMP 1
print "1 IMP 0 = "; 1 IMP 0
print "1 IMP 1 = "; 1 IMP 1
```

### Example 2

```
a = 0b10011101
b = 0b11010011

print "    "; bin(a)
print "IMP "; bin(b)
print "------------"
print "    "; bin(a IMP b)

' output:
'     10011101
' IMP 11010011
' ------------
'     11110011
```
