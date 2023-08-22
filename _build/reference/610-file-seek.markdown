# SEEK

> n = SEEK (fileN)

Returns the current file position of file with ID `fileN`. The file position start with `0`.

### Example

```
' create a file
open "testseek.txt" for output as #1
print #1, "abcdefghijk"
close #1

' open file
open "testseek.txt" for input as #1
c = input(3,1)                          ' read three character from file
print seek(1)                           ' Output: 3
close #1
```
