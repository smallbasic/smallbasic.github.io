# SEEK

> SEEK #fileN, pos

Sets file position to `pos` for the next read/write for file with the ID `#fileN`. The file position starts with `0`.

### Example 

```
' create a file
open "testseek.txt" for output as #1
print #1, "abcdefghijk"
close #1


' open file
open "testseek.txt" for input as #1
seek #1, 4                              ' file position set to 4
c = input(1,1)                          ' read one character from file
print c                                 ' Output: e
close #1
```
