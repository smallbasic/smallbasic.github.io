# REPEAT

> REPEAT ... UNTIL expr

Begins the definition of a REPEAT/UNTIL loop.

SmallBASIC starts executing the commands between the REPEAT and UNTIL commands. When SmallBASIC encounters the UNTIL command, it evaluates the expression parameter `expr`. If that parameter is zero (false), the process will be repeated; otherwise, execution continues at the next command.
The REPEAT/UNTIL loop evaluates the expression at the end of the loop. Therefore at least one loop is performed.

REPEAT/UNTIL loops may be nested to any level of complexity, but there must be an UNTIL for each REPEAT.

See WHILE...WEND loop if you want to evaluate the expression at the begin of the loop.

### Example

```
C = 1
REPEAT
    PRINT C
    C = C + 1
UNTIL C == 10

' Output: 1 2 3 4 5 6 7 8 9
```

