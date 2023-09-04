# TIMESTAMP

> s = TIMESTAMP (filename)

Returns the file `filename` last modified date and time as a string. The returned string `s` has the format "YYYY-MM-DD hh:mm AM|PM".

### Example

```
' Create a file
open "timetest.txt" for output as #1
    print #1, 1
close #1

' Get time stamp
print timestamp("timetest.txt")     ' Output: 2023-09-03 11:36 AM
```


