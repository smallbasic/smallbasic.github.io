### Language

> WHILE expr

Loop while a test condition evaluates to true.


<p>SmallBasic starts by evaluating expression. If expression is nonzero (true), the next command is executed. If expression is zero (false), control passes to the first command following the next @WEND@ command.
<p>When SmallBasic encounters the @WEND@ command, it reevaluates the expression parameter to the most recent @WHILE@. If that parameter is still nonzero (true), the process is repeated; otherwise, execution continues at the next command.
<p>WHILE/WEND loops may be nested to any level of complexity, but there must be a WEND for each WHILE.
C=1
WHILE C<10
    PRINT C
    C=C+1
WEND
...
' This is the same with that
FOR C=1 TO 9
    PRINT C
NEXT

