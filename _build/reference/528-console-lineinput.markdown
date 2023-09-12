# LINEINPUT

> LINEINPUT [#fileN,] var

Reads a whole text line from file or console and stores it in the string `var`. If a file handle `#fileN` is specified, LINEINPUT will read from the corresponding file otherwise it will read from the console.

### Example 1: Read from console

```
LINEINPUT S
PRINT S
```

### Example 2: Read from file

```
' create a file
open "File.txt" for output as #1

print #1, "First line"
print #1, "Second line"

close #1


' open file and print content
open "File.txt" for input as #1

LINEINPUT #1, S
Print S
LINEINPUT #1, S
Print S

close #1
```

