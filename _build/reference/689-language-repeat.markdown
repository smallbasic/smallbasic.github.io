### Language

> REPEAT ... UNTIL expr

Begins the definition of a REPEAT/UNTIL loop.


<p>SmallBasic starts executing the commands between the REPEAT and UNTIL commands. When SmallBasic encounters the UNTIL command, it evaluates the expression parameter. If that parameter is zero (false), the process will be repeated; otherwise, execution continues at the next command.
<p>REPEAT/UNTIL loops may be nested to any level of complexity, but there must be an UNTIL for each REPEAT.
<pre>C=1
REPEAT
    PRINT C
    C=C+1
UNTIL C=10
...
' This is the same with that
FOR C=1 TO 9
    PRINT C
NEXT

