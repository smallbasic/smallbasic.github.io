# WHILE

> WHILE expr

Starts a WHILE ... WEND loop. 

A While-loop loops as long as the test condition `expr` evaluates to true. SmallBASIC starts by evaluating the expression. If the expression is nonzero (true), the next command in the loop is executed. If the expression is zero (false), control passes to the first command following the next WEND command. When SmallBASIC encounters the WEND command, it reevaluates the expression parameter to the most recent WHILE. If that parameter is still nonzero (true), the process is repeated; otherwise, execution continues at the next command.

WHILE/WEND loops may be nested to any level of complexity, but there must be a WEND for each WHILE.

See EXIT to exit a while-loop, even when expression is true.

### Example

```
c = 1
WHILE c < 10
    PRINT c
    c = c + 1
WEND
' Output: 1 2 3 4 5 6 7 8 9
```
