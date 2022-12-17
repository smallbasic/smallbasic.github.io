# BGETC

> BGETC (fileN)

Reads and returns a byte from file or device (Binary mode) .

```
' create a binary file
open "BinaryFile.txt" for output as #1

for c = 0 to 255
    bputc #1, c
next

close #1

' open binary file and print content
open "BinaryFile.txt" for input as #1

for i = 0 to 255
    c = bgetc(1)
    print CHR(c);
next

close #1
```
