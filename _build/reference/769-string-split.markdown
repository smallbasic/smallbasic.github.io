# SPLIT

> SPLIT string, delimiters, words() [, pairs] [USE expr]

Splits "string" at the position of the given delimiters and returns the words of the specified string into array 'words'. "pairs" can be used to group words. "Use expr" is applied to every splitted word.

```
s="/etc/temp/filename.ext"
SPLIT s, "/.", v()  ' Splits the string using the delimiters "/" and "."
FOR i=0 TO UBOUND(v)
  PRINT i;" [";v(i);"]"
NEXT

' displays:
' 0 []
' 1 [etc]
' 2 [temp]
' 3 [filename]
' 4 [ext]
```

Example for using the argument "pairs"  

```
s = "/etc/temp/filename.ext"
SPLIT s, "/", v(), "temp"
FOR i = 0 TO UBOUND(v)
  PRINT i;" [";v(i);"]"
NEXT

' Display
0 []
1 [etc/temp]
2 [filename.ext]
```

Example for using "USE expr"

```
s = "/etc/temp/filename1.ext  "        ' additional spaces at the end of the string
SPLIT s, "/", v(), "temp" USE TRIM(x)  ' trim(x) will remove spaces at the beginning
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


