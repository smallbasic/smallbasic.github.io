# Language

> IF expr

Tests the expression and IF it evaluates to a non-zero value program flow will resume after the following THEN statement.


IF expression1 [THEN]
    .
    . [commands]
    .
[ [ELSEIF| ELIF] expression2 [THEN]
    .
    . [commands]
    .
]
[ELSE
    .
    . [commands]
    .
]
ENDIF| FI
<p>Block-style IF.
Causes SmallBASIC to make a decision based on the value of an expression.
* expression  - An expression; 0 is equivalent to FALSE, while all other values are equivalent to TRUE.
* commands - One or more commands.
p.. Each expression in the IF/ELSEIF construct is tested in order.
As soon as an expression is found to be TRUE, then its corresponding
commands are executed. If no expressions are TRUE, then the commands
following the ELSE keyword are executed. If ELSE is not specified, then
execution continues with the command following the ENDIF.
p.. IF, ELSE, ELSEIF, and ENDIF must all be the first keywords on their respective lines.
p.. THEN is optional, but if its defined it must be the last keyword on its
line; if anything other than a comment follows on the same line with
THEN, BASIC thinks it's reading a single-line IF/THEN/ELSE construct.
IF blocks may be nested.
<pre>x=1
IF x=1 THEN
    PRINT "true"
ELSE
    PRINT "false"
ENDIF
...
' Alternate syntax:
x=1
IF x=1
    PRINT "true"
ELSE
    PRINT "false"
FI
*Single-line IF*
<pre>IF expression THEN [num-label]|[command] [ELSE [num-label]|[command]]
<p>Causes SmallBASIC to make a decision based on the value of an expression.
* expression - An expression; 0 is equivalent to FALSE, while all other values are equivalent to TRUE.
* command - Any legal command or a numeric label. If a number is specified, it is equivalent to a GOTO command with the specified numeric-label.
<pre>' Single-line IF
x=1
IF x=1 THEN PRINT "true" ELSE PRINT "false"
...
IF x=1 THEN 1000
...
1000 PRINT "true"

