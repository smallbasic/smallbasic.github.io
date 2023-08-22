# SPLIT

> SPLIT s, delim, byref words [, pairs] [USE expr]

Splits the string `s` at the position of the given delimiters `delim` and returns an array `words` with the splitted substrings. The optional parameter `pairs` can be used to group words. The optional `Use expr` is applied to every splitted substring. If `delim` contains more than one character, each character representing a delimiter.

See SINPUT for an alternative command to split a string.

### Example 1: Split a string using two delimiters

```
s = "/etc/temp/filename.ext"
SPLIT s, "/.", v                    ' Splits the string using the delimiters "/" and "."
FOR i = 0 TO UBOUND(v)
  PRINT i; " ["; v(i); "]"
NEXT

' Output:
' 0 []
' 1 [etc]
' 2 [temp]
' 3 [filename]
' 4 [ext]
```

### Example 2 : Using the argument "pairs"  

```
s = "/etc/temp/filename.ext"
SPLIT s, "/", v, "temp"
FOR i = 0 TO UBOUND(v)
  PRINT i;" [";v(i);"]"
NEXT

' Display
0 []
1 [etc/temp]
2 [filename.ext]
```

### Example 3: Using "USE expr"

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


