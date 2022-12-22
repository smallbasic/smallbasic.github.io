# CLOSE

> CLOSE #fileN

Close a file or device with file-handle #fileN.

See OPEN for more information on how to read or write files.

```
' create a text file
open "MyDemoFile.txt" for output as #1

for i = 1 to 10
    print #1, i 
next

close #1

' open text file and print content line by line
open "MyDemoFile.txt" for input as #1

while(!eof(1))   ' eof works only without #
    input #1, c
    print c
wend

close #1
```
