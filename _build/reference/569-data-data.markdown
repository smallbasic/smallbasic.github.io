# DATA

> DATA constant1 [,constant2]...

Stores one or more constants, of any type, for subsequent access via READ command.

DATA commands are non executable statements that supply a stream of data constants
for use by READ commands. All the items supplied by all the DATA commands in a
program make up one continuous "string" of information that is accessed in order
by your program's READ commands. Use RESTORE ro specify which data block should be
read next.


Example 1:

```
FOR I = 1 TO 3
    READ v
    PRINT v
NEXT
END

DATA 1,2,3
```

Example 2: Using several data commands.

```
FOR I = 1 TO 6
    READ v
    PRINT v
NEXT
END

DATA 1,2
DATA 3,4,5
DATA 6
```


Example 3: Specify which data block should be read.

```
RESTORE MyDataBlock

FOR I = 1 TO 3
    READ v
    PRINT v
NEXT
END

DATA 1,2,3
LABEL MyDataBlock
DATA 4,5,6

' Output: 4 5 6
```
