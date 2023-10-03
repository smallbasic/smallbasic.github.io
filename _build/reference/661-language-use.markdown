# USE

> USE expr

Used with various commands for passing a user-defined expression `expr`.

### Example: Split

```
s = "/etc/temp/filename1.ext  "        ' additional spaces at the end of the string
SPLIT s, "/", v, "temp" USE TRIM(x)    ' trim(x) will remove spaces at the beginning
                                       ' and the end of the splitted strings;
                                       ' try the example without "USE TRIM(x)"
FOR i = 0 TO UBOUND(v)
  PRINT i;" [";v(i);"]"
NEXT

' displays
' 0 []
' 1 [etc/temp]
' 2 [filename1.ext]
```
