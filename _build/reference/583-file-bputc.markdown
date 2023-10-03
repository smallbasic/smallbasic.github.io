# BPUTC

> BPUTC #fileN, byte

Writes a byte `byte` on file or device in binary mode.

See BGETC for reading bytes from a file or device.

### Example

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
