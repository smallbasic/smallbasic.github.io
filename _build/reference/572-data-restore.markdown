# RESTORE

> RESTORE label

Specifies the position of the next data to be read.

See DATA for more information.


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
