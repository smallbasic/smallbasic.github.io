# READ

> READ var1 [, var2, ..., varN]

Assigns values in DATA items to the specified variables `var1` to `varN`. Unless a RESTORE command is executed, SmallBASIC moves to the next DATA item with each READ assignment. If SmallBASIC runs out of DATA items to read, an run-time error occurs.

See DATA and RESTORE for more information.

### Example 1: READ with one variable

```
FOR c = 1 TO 6
   READ x
   PRINT x
NEXT

DATA "a,b,c", 2
DATA 3, 4
DATA "fifth", 6
```

### Example 2: READ with two variables

```
FOR c = 1 TO 3
   READ x, y
   PRINT x, y
NEXT

DATA "a,b,c", 2
DATA 3, 4
DATA "fifth", 6
```

