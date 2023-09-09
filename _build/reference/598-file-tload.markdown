# TLOAD

> TLOAD file, BYREF var [, type]

Loads a text file `file` into the array variable `var`. Each text-line is an array element. The optional variable `type` defines the type of `var`: 

- `0`: load into array (default)
- `1`: load into string

### Example 1

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

### Example 2: Reading json data

```
' Create an array with some json data
A << {name: "Ben", age: 20}
A << {name: "Alice", age: 22}

' Save the array. This will create the file myfile.txt in
' the same directory as your BASIC file
tsave "myfile.txt", A

' Load the file
tload "myfile.txt", B

' Convert B to map variable
for element in B
    M << array(element)
next

print M
print M[1].age

' Output: 
' [{"age":20,"name":"Ben"},{"age":22,"name":"Alice"},0]
' 22
```

### Example 3: Read as string

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
tload "myfile.txt", B, 1
print "->"; B ; "<-"            ' Output: ->1
                                '         test
                                '         2
                                '         <-
```
