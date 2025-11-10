# IF

> IF expr

Tests the expression and if it evaluates to a non-zero value, program flow will resume after the following THEN statement.

### Block-style IF

```
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
```

Causes SmallBASIC to make a decision based on the value of an expression.

* expression  - An expression; 0 is equivalent to FALSE, while all other values are equivalent to TRUE.
* commands - One or more commands.

Each expression in the IF/ELSEIF construct is tested in order.
As soon as an expression is found to be TRUE, then its corresponding
commands are executed. If no expressions are TRUE, then the commands
following the ELSE keyword are executed. If ELSE is not specified, then
execution continues with the command following the ENDIF.

IF, ELSE, ELSEIF, and ENDIF must all be the first keywords on their respective lines.

THEN is optional, but if its defined it must be the last keyword on its
line; if anything other than a comment follows on the same line with
THEN, BASIC thinks it's reading a single-line IF/THEN/ELSE construct.
IF blocks may be nested.

### Single-line IF

```
IF expression THEN [num-label]|[command] [ELSE [num-label]|[command]]
```

Causes SmallBASIC to make a decision based on the value of an expression.

* expression - An expression; 0 is equivalent to FALSE, while all other values are equivalent to TRUE.
* command - Any legal command or a numeric label. If a number is specified, it is equivalent to a GOTO command with the specified numeric-label.

### Inline-IF

```smallbasic
result = IF (condition, return_value_true, return_value_false)
```

The function `IF` will test the condition `condition`. If `condition` resolves to
`true` then `return_value_true` will be returned otherwise `return_value_false`.

### Example 1: Block-style IF

```
x = 1
IF x = 1 THEN
    PRINT "true"
ELSE
    PRINT "false"
ENDIF

' Alternate syntax:
x = 1
IF x = 1
    PRINT "true"
ELSE
    PRINT "false"
FI
```

### Example 2: Single-line IF

```
x = 1
IF x = 1 THEN PRINT "true" ELSE PRINT "false"

IF x = 1 THEN 1000

end ' ends the program

1000 PRINT "true"
```

### Example 3: Nested IF

```
x = 1
y = 2

IF x == 1 THEN 
    PRINT "x equals 1"
    
    if y == 2 THEN
        PRINT "y equals 2"
    ELSE
        PRINT "y not 2"
    ENDIF
    
ELSE
    PRINT "x not 1"
ENDIF
```

### Example 4: IF ... ELSEIF ... ELSE

```
foo = 1     ' change value to 1,2,3

IF foo == 1
    PRINT "one"
ELSEIF foo == 2
    PRINT "two"
ELSE
    PRINT "something else"
ENDIF
```

### Example 5: Inline IF

```
x = 4
ans = IF(x <= 5, 0, 10)
PRINT ans           ' Output: 0
```