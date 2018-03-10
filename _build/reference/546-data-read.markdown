### Data

> READ var[, var ...]

Assigns values in DATA items to specified variables.


* var - Any variable.
<p>Unless a RESTORE command is executed, SmallBASIC moves to the next DATA item with each READ assignment. If SmallBASIC runs out of DATA items to READ, an run-time error occurs.
<pre>FOR c=1 TO 6
    READ x
    PRINT x
NEXT
...
DATA "a,b,c", 2
DATA 3, 4
DATA "fifth", 6

