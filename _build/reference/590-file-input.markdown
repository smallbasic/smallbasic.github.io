# INPUT

> INPUT #fileN; var1 [,delim] [, var2 [,delim]] ...

Reads data from file #fileN and stores the values in var1, var2 to varN. Specify a delimiter if necessary.

### Example: Read a comma-separated-value file (csv)

```
' Create a csv-file
open "test.csv" for output as #1
for x = 1 to 10
    print #1, x + "," + x^2 + "," + x^3
next
close #1

' Open the file and read the values
open "test.csv" for input as #1
while(!eof(1))
    input #1; x, ",", x2, ",", x3
    print x, x2, x3
wend
close #1
```



