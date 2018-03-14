# Math

> SGN (x)

Sign of x (+1 for positive, -1 for negative and 0 for zero).

Built-in:    SGN
Syntax:      SGN(numeric-expression)
Description: SGN returns a value indicating the sign of a numeric expression (1 if the
             expression is positive, 0 if it is zero, or -1 if it is negative).
Comment:     SGN cannot accept a numeric string, such as "24", as an argument.
Example:
             PRINT SGN(1), SGN(-1), SGN(0)  ' Output is:  1  -1  0
             PRINT SGN(CINT("-2"))          ' Output is:  -1
             PRINT SGN("2 + 1")             ' Error
See Also:    ABS, ABSMAX, ABSMIN, CINT
thanks shian!
