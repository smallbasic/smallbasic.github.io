# READ

> READ #fileN, var1 [, var2, ... , varN]

Read variables `var1` to `varN` from a binary data file. Variables can be numbers, strings and arrays.

See WRITE for writing variables to a file.

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
