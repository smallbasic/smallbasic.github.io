# BAND

> y = a BAND b

Bitwise AND.

Truth table:

| a | b | a BAND b |
|:-:|:-:|:--------:|
| 0 | 0 | 0        |
| 0 | 1 | 0        |
| 1 | 0 | 0        |
| 1 | 1 | 1        |

See AND for the logical operator.

### Example 1

```
print "1011 AND 1101 = "; bin(0b1011 band 0b1101)
' Output: 1011 AND 1101 = 1001
```

### Example 2

The following example will first pack a date into a single integer
and then unpack the integer to get the original date using bitwise operations.

```
Def shl(n, c) = n * Pow(2, c)         ' shift-left c bits in n
Def shr(n, c) = n \ Pow(2, c)         ' shift-right c bits in n
Def mask(c) = Pow(2, c) - 1           ' return a mask of c bits

' get the current date as three integers:
now = Date ' now is "dd/mm/yyyy"
day = Left(now, 2) * 1
month = Mid(now, 4, 2) * 1
year = Right(now, 4) * 1

' pack the date in one integer:
p = day                                ' packing 5 bits (days 1..31)
p = shl(p, 4) Bor month                ' packing 4 bits (months 1..12)
p = shl(p, 12) Bor year                ' packing 12 bits (years 0..4095)
Print Using "The current date : 00/00/0000"; day, month, year;
Print " -> Packed as: "; p; " (0x"; Hex(p); ")"

' unpack the date from one integer:
p_day = shr(p, 12 + 4)                 ' packed in bits 16..20
p_month = shr(p, 12) Band mask(4)      ' packed in bits 12..15
p_year = p Band mask(12)               ' packed in bits 0..11
Print Using "The Unpacked date: 00/00/0000"; p_day, p_month, p_year;
```


