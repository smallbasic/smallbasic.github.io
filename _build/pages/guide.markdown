# SmallBASIC User Guide

> SmallBASIC is a fast and easy to learn BASIC language interpreter ideal for
everyday calculations, scripts and prototypes. SmallBASIC includes
trigonometric, matrices and algebra functions, a built in IDE, a powerful string
library, system, sound, and graphic commands along with structured programming
syntax.

::: articleRight ::
::: articleRightInner ::
Contents
:::

* [Source Code Format](#SourceCodeFormat)
* [Comments](#Comments)
* [Numbers and Srings](#NumberAndStrings)
  * [Integers](#Integers)
  * [Reals](#Reals)
  * [String Literals](#Strings)
* [Variables and Constants](#ConstantsVariables)
  * [Variable names](#Variable)
  * [Assigning Values to Variables](#AssigningValuesToVariables)
  * [Constants](#Constants)
* [Arrays](#Arrays})
  * [Creating Arrays](#CreatingArrays)
  * [Accessing Elements of an Array](#AccessingElementsOfAnArray)
  * [Nested Arrays](#NestedArrays)
  * [Array Operations](#ArrayOperations)
* [Matrices](#Matrices)
  * [Creating 2D Matrices](#Creating2DMatrices)
  * [Accessing Elements of a 2D Matrix](#AccessingElementsOfA2DMatrix)
  * [2D Matrix Operations](#MatrixOperations)
  * [Higher Dimensional Matrices](#HigherDimensionalMatrices)
  * [Row and Column Vectors](#RowAndColumnVectors)
* [Maps](#Maps)
  * [Creating a Map Variable](#CreatingAMapVariable)
  * [Accessing Elements of a Map Variable](#AccessingElementsOfAMapVariable)
  * [Add Key-Value Pairs](#AddKeyValuePairs)
  * [Key-Value Pairs with References](#KeyValuePairsWithReferences)
* [Operators](#Operators)
  * [Pseudo-operators](#pseudo)
* [Subroutines and Functions](#SubroutinesAndFunctions)
  * [Names](#SubroutinesAndFunctionsNames)
  * [Declaration of Subroutines](#DeclarationOfSubroutines)
  * [Declaration of Functions](#DeclarationOfFunctions)
  * [Parameters](#Parameters)
  * [Exit a function or subroutine](#ExitAFunctionOrSubroutine)
  * [Single-line Functions](#SingleLineFunctions)
  * [Using Local Variables](#UsingLocalVariables)
  * [Nested Routines](#NestedRoutines)
  * [Declarations in PalmOS](#DeclarationsInPalmOS)
* [Expressions](#Expressions)
* [Loops](#Loops)
  * [FOR-TO-NEXT Loop](#ForToNextLoop)
  * [FOR-IN-NEXT Loop](#ForInNextLoop)
  * [WHILE-WEND Loop](#WhileWendLoop)
  * [REPEAT-UNTIL Loop](#RepeatUntilLoop)
* [Units](#Units)
  * [Declaration](#UnitsDeclaration)
  * [Import](#UnitsImport)
* [OPTION](#Statement1)
  * [OPTION BASE](#Statement2)
  * [OPTION MATCH](#Statement3)
  * [OPTION PREDEF](#Statement4)
* [Meta Commands](#Meta)
* [The USE keyword](#use)
* [The DO keyword](#do)
* [Loops and variables](#Loops)

:::

## Source Code Format {#SourceCodeFormat}

SmallBASIC files are plain text files in ASCII or UTF-8. A program consists of
at least one line of text. Every line is terminated with a `CR` or `CR/LF`. Each
line consist of one or more commands. Multiple commands in a line are separated
by a colon `:`. If `&` is the last character of a line, SmallBASIC will continue
with the command in the next line.

Spaces and tabs are ignored as long as the syntax is valid. Inside a string
literal spaces and tabs are retained.

A line can start with a line number. Line numbers can be in any order. Multiple
lines can have the same line number. Commands like `GOTO` will go to the last
line with the specified line number.

## Comments {#Comments}

A comment is a piece of code which is ignored by SmallBASIC but gives the
programmer helpful information about the source code. Comments can be created by 
placing text after a quotation mark `'` or after the command `REM`. Comments can
be placed anywhere in the code but not inside a string. Starting with `'` or `REM`
the rest of the line will be a comment.

When using `REM` be aware that `REM` is a build in command and multiple commands
need to be separated with a colon `:`.

```smallbasic
' This is a comment
REM This is a comment

a = 1  ' This is a comment
a = 1  : REM This is a comment
```

## Numbers and Strings {#NumberAndStrings}

### Integers {#Integers}

Integers are used to store numeric values without any fractional part. Integer
is the default data type. You can declare integers in decimal, hexadecimal,
octal and binary form. For hexadecimal the number starts with `0x` or `&x`, for
octal with `0o` or `&o`, and for binary with `0b` or `&b`.

```smallbasic
256
0x100 ' Hexadecimal form 1
&h100 ' Hexadecimal form 2
0o400 ' Octal form 1
&o400 ' Octal form 2
0b111 ' Binary form 1
&b111 ' Binary form 2
```

### Reals {#Reals}

Floating point values are used to store numeric data which may have a fractional
part. Any number which out-bounds the limits or an integer or has decimal digits
will be converted automatically to real. Reals can be written in scientific
notation.

```smallbasic
1.2
.25
1E2
1.2E-2
2.6E-0.25
```

### String Literals {#Strings}

Strings are used to store sequences of characters. The characters of a string 
are enclosed with `"`. If a string spans more than one line, enclose the string
with `"""`. The end of each line will be a line break in the string. Strings may
be appended to one another using the `+` operator.

```smallbasic
"This is a string"
"Hello, " + "world!"
"""This is
a string
over several lines
with line breaks"""
```

Strings can contain escape sequences. Escape sequences always start with the `\`
character. The following escape sequences are supported:

| Code     | Action                                                         |
|----------|----------------------------------------------------------------|
| `\a`     | beep                                                           |
| `\t`     | tab (20 px)                                                    |
| `\r`     | return                                                         |
| `\n`     | next line                                                      |
| `\"`     | quote `"`                                                      |
| `\\`     | Backslash `\`                                                  |
| `\e[K`   | clear to end of line                                           |
| `\e[nG`  | move to column `n`                                             |
| `\e[s`   | save cursor position                                           |
| `\e[u`   | restore cursor position                                        |
| `\e[0m`  | reset all attributes to their defaults                         |
| `\e[1m`  | set bold on                                                    |
| `\e[3m`  | set italic on                                                  |
| `\e[4m`  | set underline on                                               |
| `\e[7m`  | reverse video                                                  |
| `\e[21m` | set bold off                                                   |
| `\e[23m` | set italic off                                                 |
| `\e[24m` | set underline off                                              |
| `\e[27m` | set reverse off                                                |
| `\e[nm`  | `n`: foreground color 30 to 37, `m`: background color 40 to 47 |

Example:

```Smallbasic
print "String with line\nbreak"
print "\e[32m\e[47mGreen text on white background"
```

In the console version of SmallBASIC (sbasic.exe or sbasic) most of the escape 
codes, for example 
[ANSI Codes at wikipedia](https://en.wikipedia.org/wiki/ANSI_escape_code),
can be used in version 12.25 or later. Support of escape codes depends on the
operating system and the terminal you are using.

## Variables and Constants {#ConstantsVariables}

SmallBASIC uses, internally, 4 data-types:

- Integer  (64bit)
- Real     (64bit)
- String   (> 2GB)
- Array    (> 50M elements)

However, all user variables (include arrays) are 'Variant'. That means the 
data-type is invisible to users and might change during runtime. Arrays are
always dynamic (size and number of elements), even if you had declared their
size. Conversions between those types are performed internally. In any case
there are functions for the user to do it manually.

### Variable Names {#Variable}

Variable names can use any alphanumeric characters, extended characters (ASCII
codes 128 - 255 for non-English languages), the symbol `_`, and the symbol `$`.
The first character of the name cannot be a digit nor `$`.

The symbol `$` is supported for compatibility. The dollar in variable names will
be count as part of the name, that means `v` and `v$` are two different
variables. It can be used only as the last character of the name, and only one
is allowed.

Variable names are case-insensitive.

```
abc, a_c, _bc, ab2c, abc$   -> valid names
1cd, a$b, $abc              -> invalid names
```

### Assigning Values to Variables {#AssigningValuesToVariables}

Variables do not need to be declared. A variable will be initialized with `0`
when used for the first time.

Values are assigned to a variable using the `=` character. The value at the
right of `=` will be assigned to the variable on the left side. Additionally the
right side of `=` can be an expression or a function.

```smallbasic
a = 256
b = 0x100
c = 0o400
d = 0b111

e = "This is a string"
g = """This is
a string
over several lines
with line breaks"""

h = 1 + 1
i = h
j = 1 + h

k = "Hello, " + "world"
l = k + "!"

m = j > h
n = h == j

o = sin(0.5)
```

For compatibility reasons, SmallBASIC support the assignment of values to a
variable using the `LET` command.

```smallbasic
let x = 20
```

### Constants {#Constants}

Constants store values that don't change during the execution of the program.
Constant variables can be declared by using the keyword `CONST`. Assigning a
value to a constant a second time will result in an error.

```Smallbasic
CONST my_pi = 3.14
```

SmallBASIC predefines the following constants:

| Constant| Value         |
|:-------:|:-------------:|
| PI      | 3.14..        |
| TRUE    | 1             |
| FALSE   | 0             |
| NIL     | nil (not set) |

## Arrays {#Arrays}

Arrays are used to store sequences of elements. Arrays are always dynamic. The
allowed data-types of the elements can be integers, reals and strings and
maps Data-types can be mixed in an array. Nested arrays are allowed.

Arrays are a subclass of Matrices (see [Matrices](#Matrices)). They are
equivalent to a row vector.

### Creating Arrays {#CreatingArrays}

Arrays can be created by assignment using the `=` operator, with the command
`DIM`, or with `[]`.

__By Assignment__

To assign an array to a variable, the array elements are enclosed by square
brackets `[` and `]`. The array elements are separated by a comma `,`. If no
value for a element is given, SmallBASIC will set this element to `0`.

```smallbasic
A = [1,2,3,4]
A = [,2,,4]                       ' Equal to A = [0,2,0,4]
A = [1,"A", 2.2]                  ' Array with elements of different data-type
A = [1,"A", [2,3]]                ' Creates an nested array
S = [1, "Small", "BASIC"]         ' Numbers and strings
M = [{x: 1, y: 2}, {x: 4, y: 7}]  ' Array of maps
```

__By DIM__

Using the command `DIM A(n)` or `DIM A[n]`, an array `A` with `n + 1` elements
will be created. Every element is set to `0`. 

```smallbasic
DIM A(3)    ' Array A with 4 elements
DIM A[3]
```

When using the command `DIM A(lower TO upper)` it is also possible, to set the
`lower` and `upper` element index of an array.

```smallbasic
' One dimensional array of 7 elements, starting from 3
' with elements A(3), A(4), ... , A(9)
DIM A(3 TO 9)
```

__Empty Array__

The following example will create an empty array variable. If the variable
already exist, it will be deleted and reinitialized as an array.

```smallbasic
A = []
```

### Accessing Elements of an Array {#AccessingElementsOfAnArray}

To access an element of an array, the array name is followed by `(i)` or `[i]`,
where `i` is the element index. In SmallBASIC using default configuration, the
first element of an array has the index `0`.

Examples:

```smallbasic
A = [1,2,3,4]
print A(1)      ' Output: 2
A[1] = 5        ' A = [1,5,3,4]
A(0) = A(3)     ' A = [4,5,3,4]
```
Accessing an element outside the bounds of the array will result in an error.

### Nested Arrays {#NestedArrays}

In a nested array, one or more elements of this array are arrays. Nested arrays
can be created by assignment with the `=` operator. There is no limit to the
depth of nesting. 

```smallbasic
A = [[1,2] , [3,4]]
A = [[1,2] , [3, [4, 5]]]

B = [1, 2, 3]
C = [4, 5]
B(2) = C      ' -> B = [1, 2, [4, 5]]
```

To access an element of a nested array, a second (or third, etc) pair of 
parenthesis or square brackets can be used.

```smallbasic
A = [1, 2, [4, 5]]
PRINT A[2][0]      ' Output: 4
PRINT A(2)(1)      ' Output: 5
```

### Array Operations {#ArrayOperations}

SmallBASIC supports basic array operations using the standard operators:

__Element-wise Addition and Subtraction__

```smallbasic
A = [1, 2, 3, 4]
B = [5, 6, 7, 8]

C = B + A
D = A - B
```

__Element-wise Multiplication__

```smallbasic
A = [1, 2, 3, 4]
B = [5, 6, 7, 8]

C = A * B
D = 0.8 * A
```

__Equality__

```smallbasic
A = [1, 2, 3, 4]
B = [5, 6, 7, 8]

e = A==B
```

__Unary__

```smallbasic
A = [5, 6; 7, 8]

B = -A
```

__Append Elements__

The pseudo-operator `<<` can be used to append elements to an array.

```smallbasic
A << 1
A << 2
A << 3
PRINT A(1)    ' Output: 2
```

## Matrices {#Matrices}

### Creating 2D Matrices {#Creating2DMatrices}

A 2D matrix can be created by assignment using the `=` operator or with the
command `DIM`.

__By Assignment__

To assign a matrix to a variable, the matrix elements are enclosed by square
brackets `[` and `]`. The matrix elements of one row are separated by `,` and
rows are separated by a semicolon `;`. If no value for a element is given,
SmallBASIC will set this element to `0`.

Examples 1:

```smallbasic
M = [11, 12; 21, 22; 31, 32]

' Creates the 3x2 matrix
'  11  12
'  21  22
'  31  32
```

Example 2:

```
M = [ ; ; 1, 2 ; 3, 4, 5]

' Creates the 3x3 matrix
'  0  0  0
'  1  2  0
'  3  4  5
```

__By DIM__

Using the command `DIM M(n,m)` or `DIM M[n,m]`, a matrix `M` with `n + 1` rows
and `m + 1` elements per row will be created. Every element is set to `0`. 

Example:

```smallbasic
DIM M(3,2)

' Creates the 3x4 matrix
'  0  0  0
'  0  0  0
'  0  0  0
'  0  0  0
```

When using the command `DIM A(rlower TO rupper, elower TO eupper)` it is also
possible, to set the `rlower` and `rupper` row index and `elower` and `eupper`
element index of a matrix.

Example:

```smallbasic
DIM M(2 to 4, 3 to 7)

' Creates the 5x3 matrix
'  0  0  0  0  0
'  0  0  0  0  0
'  0  0  0  0  0
' With elements M(2,3) to M(2,7), M(3,3) to M(3,7) and M(4,3) to M(4,7)
```

### Accessing Elements of a 2D Matrix {#AccessingElementsOfA2DMatrix}

To access an element of a matrix, the matrix name is followed by `(row, column)`
or `[row, column]`, where `column` and `row` are the coordinates of the matrix
element. In SmallBASIC using default configuration, the first element of a
matrix has the index `(0, 0)`.

Examples:

```smallbasic
M = [1,2;3,4]
print M(0,0)      ' Output: 1
M[1,0] = 5        ' M = [1,2;5,4]
M(0,1) = M(0,0)   ' M = [1,1,5,4]
```

Accessing an element outside the bounds of the matrix will result in an error.

### 2D Matrix Operations {#MatrixOperations}

SmallBASIC supports basic matrix operations using the standard operators:

__Addition and Subtraction__

```smallbasic
A = [1, 2; 3, 4]
B = [5, 6; 7, 8]

C = B + A
D = A - B
```

__Multiplication__

```
A = [1, 2; 3, 4]
B = [5 ; 6]

C = A * B
D = 0.8 * A
```

__Equality__

```smallbasic
A = [1, 2; 3, 4]
B = [5, 6; 7, 8]

e = A==B
```

__Unary__

```smallbasic
A = [5, 6; 7, 8]

B = -A
```

### Higher Dimensional Matrices {#HigherDimensionalMatrices}

Matrices with a dimension higher than two can be created with the command
`DIM M(n1, n2, ..., ni)`, where `n1 + 1` to `ni + 1` are the number of
elements of each dimension. To access an element, give the coordinates of that
element in parenthesis or square brackets.

Example:

```smallbasic
DIM M(2,2,3)    ' Creates a 3x3x4 3D Matrix

M[0,0,2] = 5
```

Equality is the only valid matrix operating for higher dimensional matrices.

### Row and Column Vectors {#RowAndColumnVectors}

__By Assignment__

To create a column vector, separate the elements by `;`.

Example:

```smallbasic
v = [1;2;3]
' Creates the column vector
'  1
'  2
'  3

PRINT v(1,0)  ' Prints the value of the element in row 2 -> 2
```

__By DIM__

The command `DIM A(n)` creates a row vector with `n+1` elements. To create a
column vector, use `DIM A(n, 0)`. The elements of the column vector can be
access by `A(n,0)`, where `n` is the column index of the element.

```smallbasic
DIM A(2)
' Creates a row vector
' 0  0  0

DIM B(2, 0)
' Creates a column vector
' 0
' 0
' 0

PRINT B(1,0)  ' Prints the value of the element in row 2
```

## Maps {#Maps}

Maps are complex data structures with key-value pairs. Elements of a map are
addressed by keys. Allowed data-types are integers, reals, strings, arrays, maps
and references. Elements of different data-types can be mixed in a map.

### Creating a Map Variable {#CreatingAMapVariable}

Maps can be created by assignment using the `=` operator, with the command
`ARRAY` and with `{}`.

__By Assignment__

To assign a map to a variable, key-value pairs are enclosed by curly brackets
`{` and `}`. The key-value pairs are separated by comma `,`. A key-value pair
consist of a key and a value. Key and value are separated by a colon `:`. The
key is a string. It is not necessary to enclose the string with quotes. The
value can be any data-type, array, map or reference. The order of key-value
pairs is not relevant for maps.

Additionally, a map variable can be created with the assignment
`name.key = value`, where `name` is the name of the map variable, `key` is the
name of the key and value any datatype supported by SmallBASIC.

Examples of valid map assignments:

```smallbasic
A = {x:1, y:2, z:3}
B = {"x":1, "y":2, "z":3}
C = {1:10, 2:5, Name: "SmallBASIC"}
D = {ArrayData:[1,2,3], MapData:{node:1, value:5}}
E.x = 1
```

__By ARRAY__

Using the command `M = ARRAY(JSONString)` will create a map variable from the
string `JSONString`.

```smallbasic
M = ARRAY("{x:1, y:2, z:3}")

s = "{1:10, 2:5, Name:\"SmallBASIC\"}"   ' The quotation marks of the string SmallBASIC are escaped with \"
M = ARRAY(s)
```

__Empty Map__

The following example will create an empty map variable. If the variable already
exist, it will be deleted and reinitialized as a map.

```smallbasic
A = {}
```

### Accessing Elements of a Map Variable {#AccessingElementsOfAMapVariable}

An element of a map variable can be accessed in the following three ways:

1. `name.key`
2. `name("key")` or `name["key"]`
3. `s = "key" : name(s)` or `s = "key" : name[s]`

where `name` is the name of the map variable and `key` is the key of the
key-value pair. The third option offers the possibility to access an element
using a string-variable as the key.

```smallbasic
A = {x:1, y:2, z:3}

print A.x
print A("x")
print A["x"]

A.y = 3
A("y") = 3
A["y"] = 3
```

To access elements of an array or a matrix inside a map, use additional
parentheses `()` or square brackets`[]`.

```smallbasic
A = {x:[2,3], y:[1,2;3,4]}

print A.x(0)        ' Output: 2
print A.x[1]        ' Output: 3
print A.y[1,1]      ' Output: 4

A.x(0) = 5
A.x[1] = 6
A.y[1,1] = 7
print A             ' Output: {"y":[1,2;3,7],"x":[5,6]}
```

To access a nested map variable, use a further `.` or `("key")`. Both notations
can be mixed.

```smallbasic
A = {x:{a:1, b:{c:2}}}

print A.x.a             ' Output: 1
print A.x.b.c           ' Output: 2
print A("x")("a")       ' Output: 1
print A("x")("b")("c")  ' Output: 2
print A("x")("b").c     ' Output: 2

A.x.a = 3
A.x.b.c = 4
print A                 ' Output: {"x":{"a":3,"b":{"c":4}}}

A("x")("a") = 5
A("x")("b")("c") = 6
A("x")("b").c = 7
print A                 ' Output: {"x":{"a":5,"b":{"c":7}}} 
```

Reading a non-existing element of a map will return `0`. Writing to a
non-existing element will create a new key-value pair.

### Add Key-Value Pairs {#AddKeyValuePairs}

Use dot-notation or parenthesis-notation with the `=` operator to add a new
key-value pair to a map variable.

```smallbasic
A = {a:1, b:2}

A.c = 3
A("d") = 4
A.e = {x:5, y:6}
```

### Key-Value Pairs with References {#KeyValuePairsWithReferences}

The value of a key-value pair can be a reference to a function or subroutine.

```smallbasic
A = {}
A.x = 1
A.Add = @Add
A.PrintBold = @PrintBold

print A     ' Output: {"x":1,"Add":func,"PrintBold":func}

' Execute function and subroutine
print A.Add(1, 2)
A.PrintBold("Test")

' Define function and subroutine
func Add(a,b)
    return a + b
end

sub PrintBold(s)
    print "\e[1m"; s; "\e[21m"
end
```

Maps in combination with references can be used to create a pseudo object
similar to object-oriented programming.

```smallbasic
A = MyAddClass(3,4)
print A.Add()

' Definitions
func MyAddClass(x,y)
    local TempMap

    ' Properties
    TempMap.x = x
    TempMap.y = y
    
    ' Methods
    TempMap.Add = @AddFunction
    
    ' Functions and subroutines
    func AddFunction()
        return self.x + self.y
    end

    return TempMap
end
```

## Operators {#Operators}

SmallBASIC supports the following operators, sorted by priority:

| Operator      | Description                                                     |
|:-------------:|-----------------------------------------------------------------|
| `(`, `)`      | Parenthesis                                                     |
| `+`, `-`      | Unary                                                           |
| `~`           | bitwise NOT                                                     |
| `NOT` or `!`  | Logical NOT  (NOT false = true)                                 |
| `^`           | Exponentiation                                                  |
| `*`, `/`, `\` | Multiplication, Division, Integer Division                      |
| `%` or `MOD`  | Reminder (QB compatible: `a = int(a), b = int(b), a - b*(a/b)`) |
| `MDL`         | Modulus  (`a % b + b*(sgn(a) <> sgn(b))`)                       |
| `+`, `-`      | Addition/Concatenation, Subtraction                             |
| `=` or `==`   | Equal                                                           |
| `<>` or `!=`  | Not Equal                                                       |
| `>`, `<`      | Less Than, Greater Than                                         |
| `=>`, `=<`    | Less or Equal, Greater or Equal                                 |
| `>=`, `<=`    | Less or Equal, Greater or Equal                                 |
| `IN`          | belongs to                                                      |
| `LIKE`        | Regular expression match                                        |
| `AND` or `&&` | Logical AND                                                     |
| `OR`  or `||` | Logical OR                                                      |
| `BAND` or `&` | bitwise AND                                                     |
| `BOR` or `|`  | bitwise OR                                                      |
| `EQV`         | bitwise EQV                                                     |
| `IMP`         | bitwise IMP                                                     |
| `XOR`         | bitwise XOR                                                     |
| `NAND`        | bitwise NAND                                                    |
| `NOR`         | bitwise NOR                                                     |
| `XNOR`        | bitwise XNOR                                                    |

### Pseudo-operators {#pseudo}

These operators are replaced by the compiler with a command or an expression.

The `++` and `--` operators are used to increase or decrease the value of a
variable by 1.

```Smallbasic
x = 4
x++    ' x = x + 1 -> 5
x--    ' x = x - 1 -> 4
```

The generic `p=` operators are used to perform an operation `p` on a variable 
and store the result in the same variable. `p` is any character of `-+/\*^%&|`

```Smallbasic
x += 4      ' x = x + 4
x *= 4      ' x = x * 4
x &= 4      ' x = x & 4
```

All these pseudo-operators are not allowed inside of expressions.

```Smallbasic
y = x++           ' -> ERROR
z = (y+=4) + 5    ' -> ERROR
```

## Expressions {#Expressions}

Expressions are entities that are evaluated to determine their values. They are a
combination of one or more constants, variables, functions, and operators.
SmallBASIC evaluates an expression and returns a value. Order of evaluation is
left-to-right and inside-out according to the priority of the operators used in
the expression.

```smallbasic
a = 1 + 1
b = 1 + a
c = sin(pi)
d = sin(x^2) + 2
e = a AND b
f = a AND (c OR d)
```

## Subroutines and Functions {#SubroutinesAndFunctions}

Subroutines and functions are blocks of code separated from the main program.
These routines can be called from the main program or other subroutines and
functions. When calling, program execution will jump to the start of the routine
and execute the code of it. After finishing the routine, program execution will
continue from the position of calling.

Subroutines and functions can be defined at every position in the source code.
These routines can be nested. If a routine is nested, it can only be called
within the parent routine. Otherwise subroutines and functions have a global
scope.

### Names {#SubroutinesAndFunctionsNames}

Subroutine and function names can use any alphanumeric characters, extended
characters (ASCII codes 128 - 255 for non-English languages), and the symbol `_`.
The first character of the name cannot be a digit nor a `_`.

Subroutine and function names are case-insensitive.

```
abc(), a_c(), ab2c()   -> valid names
1cd(), a$b(), _abc()   -> invalid names
```

Subroutines and functions can not have the same name as build-in commands.

### Declaration of Subroutines {#DeclarationOfSubroutines}

```smallbasic
SUB name
  ' subroutine code here
END

SUB name()
  ' subroutine code here
END

SUB name par1, ..., parN
  ' subroutine code here
END

SUB name (par1, ..., parN)
  ' subroutine code here
END
```

The definition of a subroutine starts with the keyword `SUB` and ends with the
keyword `END`. It has a name `name`, can have parameters `par1` to `parN` and
does not return a value. The parameters are separated with a comma `,`. The
parameters can be optionally enclosed by parentheses.

### Declaration of Functions {#DeclarationOfFunctions}

```smallbasic
FUNC name
  ' function code here
  RETURN value
END

FUNC name()
  ' function code here
  name = value
END

FUNC name par1, ..., parN
  ' function code here
  RETURN value
END

FUNC name (par1, ..., parN)
  ' function code here
  name = value
END
```

The definition of a function starts with the keyword `FUNC` and ends with the
keyword `END`. It has a name `name`, can have parameters `par1` to `parN` and
must return a value `value`. The parameters are separated with a comma `,`. The
parameters can be optionally enclosed by parentheses. To return a value, the
keyword `RETURN` can be used or the assignment of a value to the function name.
If `RETURN` is used, execution of the function will immediately stop, even if
there are further commands until `END`.

```smallbasic
FUNC MyFunction()
    i = 1
    Return i
    i = 2
    Return i
end
print MyFunction()  ' Output: 1
```

```smallbasic
FUNC MyFunction()
    i = 1
    MyFunction = i
    i = 2
    MyFunction = i
end
print MyFunction()  ' Output: 2
```

### Parameters {#Parameters}

__Using Parameters__

To use a parameters inside a function or subroutine, address the parameter by
the name given in the routine declaration.

```smallbasic
FUNC AddNumbers(a, b)
  c = a + b
  RETURN c
END
```

__By-Value and By-Reference__

Parameters are 'by value' by default. Passing parameters by value means, that
the function or subroutine receives a copy of the parameters.

When using the keyword `BYREF` or the symbol `@` in the routine declaration 
before the parameter, a reference (pointer) to the parameter will be passed to
the routine. 'by-reference' parameters can be used to return values from a
subroutine or function, because the variable in the calling subroutine or
function will be changed.

Passing array or map parameters as references will not result in creating a
copy of the parameters in RAM. Thus, program execution will be faster and
RAM will be saved.

```smallbasic
' Passing the parameter by value
SUB F(a)
  a = 1
END

x = 2
F(x)
PRINT x   ' Output 2
```

```smallbasic
' Passing the parameter by reference
SUB F(BYREF a)
  a = 1
END

x = 2
F(x)
PRINT x    ' Output 1
```

### Exit a Function or Subroutine {#ExitAFunctionOrSubroutine}

Functions can be exited using `RETURN expression`, where `expression` is an
expression to be evaluated. The evaluated value of the expression will be returned
by the function. Alternatively the keywords `EXIT FUNC` can be used. In this case
the return value of the function will be `0`. All commands following 
`RETURN expression` or `EXIT FUNC` will not be executed.

Subroutines can be exited using the keywords `EXIT SUB`. All commands following
`EXIT SUB` will not be executed.

### Single-line Functions {#SingleLineFunctions}

```
FUNC name(par1, ..., parN) = expression
DEF  name(par1, ..., parN) = expression
```

`FUNC` and `DEF` can be used to declare single-line functions. Declaration
starts with the keyword `FUNC` or `DEF`, followed by the name of the routine.
The parameter list must be enclosed by parentheses. After the closing
parentheses an expression is assigned to the routine using the `=` operator.

```smallbasic
DEF MyFunc(x) = SIN(x) + COS(x)
Print MyFunc(pi/2)
```

### Using Local Variables {#UsingLocalVariables}

Variable are by default global variables. Global variables are accessible
anywhere in the program.  A usual problem is that a variable name may be used
again in a function or subroutine:

```smallbasic
FOR i = 1 TO 10
  a = F(i)
  PRINT i
NEXT

FUNC F(x)
  FOR i = 1 TO 6
  NEXT  
  RETURN x
END
```

In this example, the result is a real mess, because the variable `i` of the main
loop will always (except the first time) have the value 7 and the program will 
run endless! This problem can be solved by using the keyword `LOCAL` to declare
the variable in the function body.

```smallbasic
FOR i = 1 TO 10
    a = F(i)
    PRINT i
NEXT

FUNC F(x)
    LOCAL i
    FOR i = 1 TO 6
    NEXT  
    RETURN x
END
```

It is good practice to declare all local variables on the top of the routine.
For compatibility reasons, the function and subroutine variables are not
declared as 'local' by default.

### Nested Routines {#NestedRoutines}

Nested subroutines and Functions are allowed in SmallBASIC. Nested subroutines 
and functions are visible only inside the parent routine. There is no way to
access a global routine with the same name of a local routine.

```smallbasic
FUNC f1(x)              ' f1 

    FUNC f2(x)          ' f2 nested in f1
        FUNC f3(x)      ' f3 nested in f2
            f3 = cos(x)
        END
        f2 = f3(x)/4
    END

    FUNC f4             ' f4 nested in f1
        f4 = f2(pi/2)   ' f2 is visible for f4
    END

    PRINT f2(pi)        ' Calling f2 inside f1 is valid
    'PRINT f3(pi)       ' Calling f3 inside f1 is invalid,
                        ' because f3 is only visible to f2
END
```

### Declarations in PalmOS {#DeclarationsInPalmOS}

On a multi-section (PalmOS) applications subroutines and functions need to be 
declared in the main section.

```smallbasic
sec:Main
declare func f(x)
#sec:another section
func f(x)
  ' function code
end
```

## Loops {#Loops}

Loops are used to repeatably execute commands until a stop condition is reached.
Inside a loop an unlimited amount of program lines can be placed. Loops can be
nested and subroutines, functions and all build-in commands can be used.

### FOR-TO-NEXT Loop {#ForToNextLoop}

A FOR-TO-NEXT-loop will continue until an index variable goes beyond a defined
stop value. In the last loop, the index variable is set to the defined stop value.
The index variable is updated automatically every cycle. The syntax of a
FOR-TO-NEXT-loop is:

```smallbasic
FOR Index = StartExpr TO StopExpr STEP StepSize
  ' some code
NEXT
```

Where `Index` is the automatically updates index variable, `StartExpr`
and `StopExpr` are expressions defining the start and stop value, and `StepSize` is
an expression defining the step size of the FOR-loop. The FOR-loop ends with the
Keyword `NEXT`.

The expressions `Start`, `Stop` and `StepSize` are evaluated every
cycle. It is allowed that these expressions change their value every cycle, i.e.
they are changed inside the FOR-loop. To speed up a FOR-loop these expressions
should be pre-calculated and assigned to variables, which are used in the loop.

Defining a step size is optional. If `STEP` is not used, the step size is set to
`1`.

```smallbasic
FOR i = 6 to 1 STEP -2
  PRINT i
NEXT
' Output: 6,4,2
```

The index variable after the end of the loop has a value larger/smaller than the
stop condition, depending on the step size.

Use `EXIT` or in case of nested loops `EXIT FOR` to end the loop before the stop
condition is reached.

### FOR-IN-NEXT loop {#ForInNextLoop}

A FOR-IN-NEXT loop loops until the last element of an array or map is reached.
In every cycle the index variable is updated with the next value of the array or
map. The array or map variable can change value and/or number of elements.

```smallbasic
a =  [12, 6, 23, -4]
FOR index IN a
  PRINT index
NEXT

' Output 12 6 23 -4
```

Use `EXIT` or in case of nested loops `EXIT FOR` to end the loop before the last
element is reached.

### WHILE-WEND Loop {#WhileWendLoop}

A WHILE-WEND loop continues executing as long as the expression `Expression` 
evaluates to `true`.

```smallbasic
WHILE Expression
  ' some code
WEND
```

If `Expression` evaluates to `false` when starting the loop for the first time,
the loop will not be entered and the code inside the loop will not be executed.

```smallbasic
WHILE index < 10
  index++
  PRINT index
WEND
```

Use `EXIT` or in case of nested loops `EXIT LOOP` to exit the loop.

### REPEAT-UNTIL Loop {#RepeatUntilLoop}

A REPEAT-UNTIL loop continues executing until the expression `Expression`
evaluates to `true`. The code inside the loop will be executed at least one time.

```smallbasic
REPEAT
  ' some code
UNTIL Expression
```

```smallbasic
REPEAT
  index++
  PRINT index
UNTIL index > 10
```

Use `EXIT` or in case of nested loops `EXIT LOOP` to exit the loop.

## Conditions {#Conditions}

Conditions can be used to branch the program flow depending on the value of
expressions.

### IF-THEN-ELSIF-ELSE {#IfThenElseifEndif}

```smallbasic
IF expression1 THEN
  ' some code
ELSEIF expression2 THEN
  ' some code
ELSE
  ' some code
ENDIF
```

IF-THEN_ELSEIF-ELSE causes SmallBASIC to make a decision based on the value of an
expression. `expression1` and `expression2` are expressions, which will be
evaluated. `0` is equivalent to `FALSE`, while all other values are equivalent to
`TRUE`.

Each expression in the IF/ELSEIF construct is tested in order. As soon as an
expression is found to be `TRUE`, then its corresponding commands are executed.
If none of the expressions are `TRUE`, then the commands following the `ELSE`
keyword are executed. If `ELSE` is not specified, then execution continues with
the command following `ENDIF`. More then one `ELSEIF` is allowed.

`IF`, `ELSE`, `ELSEIF`, and `ENDIF` must all be the first keywords on their
respective lines. `THEN` is optional, but if its used it must be the last keyword
on its line. If anything other than a comment follows `THEN` on the same line,
SmallBASIC interprets it as a single-line IF-THEN-ELSE construct. IF blocks may
be nested.

Instead of `ELSEIF` and `ENDIF`, `ELIF` and `FI` can be used.

### Single-line IF-THEN-ELSE

```smallbasic
IF expression THEN command1 ELSE command2
```

Single-line IF-THEN-ELSE causes SmallBASIC to make a decision based on the value
of an expression `expression`. `0` is equivalent to `FALSE`, while all other
values are equivalent to `TRUE`. `command1` and `comannd2` are any legal commands.
Multiple commands can be separated by a colon `:`. If instead of a command a
number is specified, it is equivalent to a GOTO command with the specified
numeric-label.



## Units {#Units}

Units are a set of subroutines, functions and/or variables that can be used by
another SmallBASIC program or SmallBASIC unit. An unit has its own namespace and
therefore is independent of the program code. Every unit is saved in a separate
file with the extension `.bas`. A unit source file can only contain one unit.
Unit name must be identical to the file name, but without the `.bas` extension.

### Declaration {#UnitsDeclaration}

An unit is declared by the use of the `UNIT` keyword followed by the name of the
unit as the first command in the unit source file. The functions, subroutines
and/or variables which should be accessible by another programs must be declared
with the `EXPORT` keyword and defined in the unit source file.

```smallbasic
UNIT MyUnitName

EXPORT MyFunction

FUNC MyFuntion(x)
  ' some code
END
```

Function, subroutines or variables which are not exported can only be used inside
the unit source file.

### Import {#UnitsImport}

To import an unit in a program use the `IMPORT` keyword followed by the unit name
without the `.bas` extension. The namespace is identical to the unit name. If a
different namespace is required specify the new namespace using
`IMPORT UnitName AS NameSpace`.

To access a member of a unit use the namespace followed by a point and the name
of the member.

```smallbasic
IMPORT MyUnit
MyUnit.MyFunction(1)
```

```smallbasic
IMPORT MyUnit as u
u.MyFunction(1)
```

## OPTION {#Statement1}

The `OPTION` command is used to pass parameters to the SB-environment. There are
two styles for that, the run-time which can change the value at run-time, and 
the compile-time which used only in compile-time and the value cannot be changed
on run-time.

### OPTION BASE {#Statement2}

The `OPTION BASE LowerBound` statement sets the lowest allowable subscript of
arrays to `LowerBound`. The default is zero. The `OPTION BASE` statement can be
used in any place in the source code but in most cases the `OPTION BASE` must be
declared in the first lines of the program before any `DIM` declaration.

Use `OPTION BASE 1` to set the index of the first element of an array to `1`.
This option is useful especially for beginners, because it makes counting
elements more intuitive.

```smallbasic
OPTION BASE 1
A = [1,2,3]
PRINT A[1]    ' Output 1
```

`OPTION BASE` is a run-time option.

### OPTION MATCH {#Statement3}

`OPTION MATCH [PCRE [CASELESS]|SIMPLE]` sets the default matching algorithm to
(P)erl-(C)ompatible (R)egular (E)xpressions library or back to simple. The
matching-algorithm is used in `LIKE` and `FILES`. PRCE works only in systems
with this library and SmallBASIC must be linked against it.

`OPTION MATCH` is a run-time option.

### OPTION PREDEF {#Statement4}

`OPTION PREDEF parameter` sets parameters of the compiler. Where `parameter` is

- `QUIET`: Sets the quiet flag (-q option)
- `COMMAND cmdstr`: Sets the `COMMAND` string to `cmdstr` (useful for debug
  reasons)
- `GRMODE [widthxheight[xbpp]]`: Sets the graphics mode flag (-g option) or sets
  the preferred screen resolution. Example: `OPTION PREDEF GRMODE 320x320x16`
- `TEXTMODE`: Sets the text mode flag (-g- option)
- `CSTR`: Sets as default string style the C-style special character encoding
  (`\`)
- `ANTIALIAS on,off` : Enable/Disable anti-aliasing for drawing commands like
  `CIRCLE` or `LINE`

`OPTION PREDEF` is a compile-time option.

## Meta Commands {#Meta}

SmallBASIC uses the following meta commands:

- `#!...`: Shebang; used by Linux to make source runs as a script executable
- `#sec: SectionName`: Used internally to store the section name. Sections names
   are used at limited OSes like PalmOS for multiple 32kB source code sections.
- `#inc: FileName`: Used to include a SmallBASIC source file into the current
  BASIC code.
- `#unit-path: path`: Used to setup additional directories for searching for
  unit-files This meta does nothing more than to setting up the environment 
  variable SB_UNIT_PATH. Directories on Linux must be separated by `:`, and on
  DOS/Windows by `;`

```smallbasic
#!/usr/local/bin/sbasic
#inc:"mylib.bas"
#unit-path: C:\sbasic\units;C:\temp
```



### The USE keyword {#use}

This keyword is used on specific commands to passing a user-defined expression.

```
SPLIT s," ",v USE TRIM(x)
```

In that example, every element of V() will be 'trimmed'.
Use the x variable to specify the parameter of the expression. If the expression needs more parameter, you can use also the names y and z

### The DO keyword {#do}

This keyword is used to declare single-line commands. It can be used with WHILE and FOR-family commands.

```
FOR f IN files("*.txt") DO PRINT f
...
WHILE i < 4 DO i ++
```

Also, it can be used by IF command (instead of THEN), but is not suggested.



### Loops and variables {#Loops}

When we write loops it is much better to initialize the counters on the top of the loop instead of the top of the program or nowhere.

```
i = 0
REPEAT
  ...
  i = i + 1
UNTIL i > 10
```

p.. Initializing variables at the top of the loop can make code more readable.

## Loops and expressions

```
FOR-like (loops) commands evaluate both the "destination" and the exit-expression every time.
FOR i=0 TO LEN(FILES("*.txt"))-1
    PRINT i
NEXT
```

In that example the 'destination' is the LEN(FILES("*.txt"))-1 For each value of i the destination will be evaluated. That is WRONG but it is supported by BASIC and many other languages.
So, it is much better to be rewritten as

```
idest=LEN(FILES("*.txt"))-1
FOR i=0 TO idest
    PRINT i
NEXT
```

Of course, it is much faster too.


