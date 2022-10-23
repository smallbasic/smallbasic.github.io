# TSAVE

> TSAVE file, var

Writes an array to a text file. Each array element is a text-line.


* file - A string expression that follows OS file naming conventions.
* var - An array variable or a string variable. Expressions are not allowed.


```
' Create an array with some data
DIM A
A << 1
A << "test"
A << 2

print A

' Save the array. This will create the file myfile.txt in
' the same directory as your BASIC file
tsave "myfile.txt", A

' Create a second array for loading
dim B

' Load the file
tload "myfile.txt", B

print B
```
