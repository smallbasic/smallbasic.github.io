# OR

> y = a OR b

Logical OR. Right side is not evaluated if left side evaluates to True.

Truth table:

| a | b | a OR b |
|:-:|:-:|:-------:|
| 0 | 0 | 0       |
| 0 | 1 | 1       |
| 1 | 0 | 1       |
| 1 | 1 | 1       |

See BOR for bitwise OR.

### Example:

```
a = 1       ' Change value to 1,2 or other

if (a == 1) OR (a == 2) then
    print "a is 1 or 2"
endif
```

