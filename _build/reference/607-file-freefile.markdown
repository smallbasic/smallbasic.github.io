# FREEFILE

> FREEFILE

Returns an unused file handle.

### Example

```
' create a text file

f = freefile()
open "MyDemoFile.txt" for output as #f

for i = 1 to 10
    print #f, i 
next

close #f

' open text file and print content line by line

f = freefile()
open "MyDemoFile.txt" for input as #f

while(!eof(f))   ' eof works only without #
    input #f, c
    print c
wend

close #f
```


