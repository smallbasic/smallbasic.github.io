# INPUT

> s = INPUT (len [, fileN])

Reads 'len' bytes from file or console (if fileN is omitted) and returns the result as sting s. This function does not convert the data or remove spaces.

### Example 1: Read from a file

```
' Create a file and write 10 bytes
open "test.txt" for output as #1
for byte = 100 to 110
    bputc #1, byte
next
close #1

' Open the file 
open "test.txt" for input as #1
' Read the first 5 byte
A = input(5, 1)
print A
' Read the second 5 byte
A = input(5, 1)
print A

close #1
```

### Example 2: Read from console

```
' Read three characters from keyboard
A = input(3)
print A
```

