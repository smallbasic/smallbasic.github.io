# WRITE

> WRITE #fileN, var1 [, var2, ... , varN]

Store variables `var1` to `varN` to a file as binary data. Variables can be numbers, strings and arrays.

See READ for reading variables from a file.

### Example

```
a = 12.3
b = "test"
c = [1,2,3,4]

' Write variables to file
open "text.bin" for output as #1
write #1, a, b, c
close #1

' Read variables from file
open "text.bin" for input as #1
read #1, a, b, c
close #1

print a
print b
print c
```
