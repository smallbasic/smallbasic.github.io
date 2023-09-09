# TSAVE

> TSAVE file, var

Writes the array or string `var` to the text file `file`. Each array element is a text-line in the file. Every line of the string will be one line in the text file. Use `\n` in the string to separate lines.

See TLOAD for loading data from a text-file.

### Example 1: Save an array

```
' Create an array with some data
A << 1
A << "test"
A << 2
print A                         ' Output: [1,test,2]

' Save the array. This will create the file myfile.txt in
' the same directory as your BASIC file
tsave "myfile.txt", A

' Load the file
tload "myfile.txt", B
print B                         ' Output: [1,test,2,]
```

### Example 2: Save a string

```
' Create a string with some data
A = "line 1\nline 2\nline 3"
print A                         ' Output: line 1
                                '         line 2
                                '         line 3 

' Save the string. This will create the file myfile.txt in
' the same directory as your BASIC file
tsave "myfile.txt", A

' Load the file
tload "myfile.txt", B
print B                         ' Output: [line 1,line 2,line 3]
```
