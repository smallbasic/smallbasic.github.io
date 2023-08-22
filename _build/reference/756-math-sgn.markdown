# SGN

> n = SGN (x)

Sign of `x`. Return values are `+1` for positive `x`, `-1` for negative `x` and `0` for zero. SGN cannot accept a numeric string, such as "24", as an argument.

### Example

```
PRINT SGN(2), SGN(-2), SGN(0)  ' Output is:   1 -1  0
PRINT SGN(INT("-2"))           ' Output is:  -1
``` 

