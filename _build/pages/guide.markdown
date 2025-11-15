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

* [Getting Started](#GettingStarted)
  * [SmallBASIC Versions](#SmallbasicVersions)
  * [Windows](#Windows)
  * [Linux](#Linux)
  * [Android](#Android)
  * [Build from Source](#BuildFromSource)
  * [Using the IDE](#UsingtheIntegratedDevelopmentEnvironment)
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
* [Arrays](#Arrays)
  * [Creating Arrays](#CreatingArrays)
  * [Accessing Elements of an Array](#AccessingElementsOfAnArray)
  * [Nested Arrays](#NestedArrays)
  * [Packed/Unpacked Assignment](#PackedUnpackedAssignment)
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
  * [Maps as Pseudo Objects for OOP](#MapsAsPseudoObjectForOOP)
* [Operators](#Operators)
  * [Supported Operators](#SupportedOperators)
  * [Pseudo-Operators](#PseudoOperators)
* [Expressions](#Expressions)
* [Subroutines and Functions](#SubroutinesAndFunctions)
  * [Names](#SubroutinesAndFunctionsNames)
  * [Declaration of Subroutines](#DeclarationOfSubroutines)
  * [Declaration of Functions](#DeclarationOfFunctions)
  * [Parameters](#Parameters)
  * [Exit a function or subroutine](#ExitAFunctionOrSubroutine)
  * [Single-Line Functions](#SingleLineFunctions)
  * [Short-circuit evaluation](#LogicalExpressionShortCircuitEvaluation)
  * [Using Local Variables](#UsingLocalVariables)
  * [Nested Routines](#NestedRoutines)
  * [Function and Routine Pointers](#FunctionAndRoutinePointers)
  * [Declarations in PalmOS](#DeclarationsInPalmOS)
* [Conditions](#Conditions)
  * [IF-THEN-ELSIF-ELSE](#IfThenElseifEndif)
  * [Single-Line IF-THEN-ELSE](#SingleLineIfThenElse)
  * [Inline Version of IF](#InlineVersionOfIf)
  * [SELECT CASE](#SelectCase)
* [Loops](#Loops)
  * [FOR-TO-NEXT Loop](#ForToNextLoop)
  * [FOR-IN-NEXT Loop](#ForInNextLoop)
  * [WHILE-WEND Loop](#WhileWendLoop)
  * [REPEAT-UNTIL Loop](#RepeatUntilLoop)
  * [The DO Keyword](#TheDoKeyword)
* [Units](#Units)
  * [Declaration](#UnitsDeclaration)
  * [Import](#UnitsImport)
  * [Name Pathing](#NamePathing)
* [Input and Output](#InputAndOutput)
  * [Print on Screen](#PrintOnScreen)
  * [Read Input from the Keyboard](#ReadInputFromKeyboard)
  * [Draw Graphics on Screen](#DrawGraphicsOnScreen)
  * [Basic File Read and Write](#BasicFileReadAndWrite)
  * [Save Arrays and Maps to a File](#SaveArraysAndMapsToAFile)
  * [Save Variables to a File](#SaveVariablesToAFile)
  * [Binary Files](#BinaryFiles)
* [The USE Keyword](#TheUseKeyword)
* [OPTION](#Statement1)
  * [OPTION BASE](#Statement2)
  * [OPTION MATCH](#Statement3)
  * [OPTION PREDEF](#Statement4)
* [Meta Commands](#Meta)
* [Exception Handling](#ExceptionHandling)

:::

## Getting Started {#GettingStarted}

SmallBASIC is available for various operating systems, including
Windows, Linux, and Android. It can be built from source to run
on many other POSIX-compliant systems, such as Raspberry Pi OS. With
its built-in Integrated Development Environment (IDE), you can write
programs on your Android-powered tablet or mobile phone and run them
instantly. 

### SmallBASIC Versions {#SmallbasicVersions}

SmallBASIC comes in three different flavors for the desktop. The SDL version offers a simple but
efficient IDE and is perfect for working with graphics. The FLTK version has a great IDE. The
console version doesn’t offer an IDE and is text-only but works perfect with plugins like raylib
or nuklear. The Android version is similar to the SDL version and comes with an integrated IDE,
too.

### Windows {#Windows}

Download the [latest release of SmallBASIC](/pages/download.html).
The different versions of SmallBASIC are included in the zip-file. Extract the zip-file to a
location of your choice. Open the SmallBASIC folder and start one of the following programs:

- sbasicg.exe: SDL
- sbasici.exe: FLTK
- sbasic.exe: Console

### Linux {#Linux}

Download the [latest release of SmallBASIC](pages/download.html).
The different versions of SmallBASIC are provided as separate AppImages. Download an AppImage
and copy it to a directory of your choice. Execute the AppImage. Depending of the Linux version
you have to make the AppImage executable: `chmod u+x AppImageFile`, where `AppImageFile` is the
filename of the AppImage.

### Android {#Android}

Download and install SmallBASIC for Android using 
[Google Play](https://play.google.com/store/apps/details?id=net.sourceforge.smallbasic). Files
are stored in `/InternalMemory/SmallBASIC` or in case of an old Android version in 
`/InternalMemory/Android/data/net.sourceforge.smallbasic/files`. For easy file transfer between
Android and desktop, please read [SmallBASIC file transfer](/pages/android_file_transfer.html)

### Build from Source {#BuildFromSource}

Using Linux it is quite easy to build SmallBASIC from source. This has the advantage, that you
don't need to use AppImages and you can use SmallBASIC on other devices like Raspberry Pi.
Please follow the instructions on [Github](https://github.com/smallbasic/SmallBASIC).

### Using the Integrated Development Environment {#UsingtheIntegratedDevelopmentEnvironment}

Please read the separate articles for the different versions of SmallBASIC:

- [SDL](/pages/sdl.html)
- [Android](/pages/android.html)
- [FLTK](/pages/fltk.html)

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

If the closing quote character is not present then the end of line marker is used
to terminate the string definition, for example:

```smallbasic
a = "this is a string
b = " and this is another string
PRINT a;b
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

### Packed/Unpacked Assignment {#PackedUnpackedAssignment}

An array can be unpacked using the unpack assignment:

```
(var1,...,varN) = array[element1,...,elementN]
```

The number of variables must match the number of elements.

```smallbasic
v = [1,2,3]
(x,y,z) = v
PRINT x, y, z
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

__IN Operator__

When applied to arrays the `IN` operator returns the 1 based index
position of the element, for example:

```smallbasic
a << "cat"
a << "dog"
PRINT "dog" IN a      ' Output: 2
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

### Maps as Pseudo Objects for OOP {#MapsAsPseudoObjectForOOP}

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

### Supported Operators {#SupportedOperators}

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

### Pseudo-Operators {#PseudoOperators}

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
The first character of the name cannot be a digit.

Subroutine and function names are case-insensitive.

```
abc(), a_c(), ab2c(), _abc()  -> valid names
1cd(), a$b()                  -> invalid names
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

### Single-Line Functions {#SingleLineFunctions}

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
PRINT MyFunc(PI/2)
```

### Logical expression short-circuit evaluation {#LogicalExpressionShortCircuitEvaluation}

In the code fragment below, if A and B are both functions and the A function
returns `TRUE`, then the B function is not called since the expression outcome
will still be the same, the expression will evaluate to TRUE.

```smallbasic
IF (A OR B) ...
```

In the next code fragment, if C and D are both functions and the C function returns
FALSE, then the D function is not called since the expression outcome will still
be the same, the expression will evaluate to FALSE.

```smallbasic
IF (C AND D) ...
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

Local variable can be declared and assigned on the same line:

```smallbasic
LOCAL foo = "foo"
```

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

### Function and Routine Pointers {#FunctionAndRoutinePointers}

The `@` operator can be used to obtain the address of a routine or a function.
The `CALL` command is then used to invoke the routine or function pointed to by
the pointer variable.

```smallbasic
FUNC foo(s)
 foo="foo!"+s
END

SUB bar
 PRINT "in bar"
END

p = @foo
PRINT CALL(@foo, "#")
PRINT CALL(p, "%")
pb = @bar
CALL pb
CALL @bar
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

The FOR-IN-NEXT loop also loops until the last character of a string is reached.

```smallbasic
s = "Test"
FOR index IN s DO PRINT index
```

The index variable is only a copy of the array element. Changing the content of
the index variable will not change the content of the array element.

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

### The DO Keyword {#TheDoKeyword}

This keyword is used to declare single-line commands. It can be used with
`WHILE` and `FOR`-family loops.

```smallbasic
FOR i = 1 to 10 DO PRINT i
FOR f IN files("*.txt") DO PRINT f
```

```smallbasic
WHILE i < 4 DO i++
```

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

Instead of `ELSEIF` and `ENDIF`, `ELIF` and `FI` can be used. Instead of `THEN`,
`DO` can be used, but this is not suggested.

### Single-Line IF-THEN-ELSE {#SingleLineIfThenElse}

```smallbasic
IF expression THEN command1 ELSE command2
```

Single-line IF-THEN-ELSE causes SmallBASIC to make a decision based on the value
of an expression `expression`. `0` is equivalent to `FALSE`, while all other
values are equivalent to `TRUE`. `command1` and `comannd2` are any legal commands.
Multiple commands can be separated by a colon `:`. If instead of a command a
number is specified, it is equivalent to a GOTO command with the specified
numeric-label.

### Inline Version of IF {#InlineVersionOfIf}

```smallbasic
result = IF (condition, return_value_true, return_value_false)
result = IFF (condition, return_value_true, return_value_false)
```

The functions `IF` and `IFF` will test the condition `condition`. If `condition` resolves to
`true` then `return_value_true` will be returned otherwise `return_value_false`.

```smallbasic
x = 4
ans = IFF(x <= 5, 0, 10)
PRINT ans           ' Output: 0
```

If `IF` is used with one parameter, the normal IF-statement is used.

See function reference [IFF](https://smallbasic.github.io/reference/638.html) for
more information.

### SELECT CASE {#SelectCase}

```smallbasic
SELECT CASE expr
  CASE result1
    ' do thinks
  CASE result2
    ' do thinks
  CASE ELSE
    ' do thinks
END SELECT
```

`SELECT CASE` offers a more concise syntax to writing successive IF tests. `SELECT CASE`
performs multiple tests on the expression `expr`. If the value of `expr` is equal to 
`result1`, the case statement `result1` will be entered and the commands executed. An
unlimited amount of case statements can be used. Once a case statement is fulfilled
the select-case structure will be exited and all following case statements will not be
tested anymore. If non of the case statements were entered the optional 'CASE ELSE'
statements will be entered.

See function reference [SELECT CASE](/reference/655.html) for
detailed information.

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

### Name Pathing {#NamePathing}

Units have the ability to include a path component in a unit name.

```smallbasic
import other.something.foo
? foo.my_var
```

Then in the `foo.bas` file:

```smallbasic
Unit other.something.Foo
export my_var
```

The unit file would be saved in `$UNITPATH/other/something`. If not defined,
`$UNITPATH` is inferred from the host program directory.

## The USE Keyword {#TheUseKeyword}

The `USE` keyword is used on specific commands for passing a user-defined expression.

```smallbasic
SPLIT s," ",v USE TRIM(x)
```

In this example, every element of `v` will be trimmed. Use the `x` variable to
specify the parameter of the expression. If the expression needs more parameter,
you can use also the names `y` and `z`.


## Input and Output {#InputAndOutput}

### Print on Screen {#PrintOnScreen}

Use `PRINT` to print text on the screen at the current cursor location. When starting
the BASIC program, the cursor is in the top left corner. After printing to the screen
the cursor location will be updated. After execution of `PRINT`, if not otherwise
specified, the cursor will be moved to the beginning of the next line. When printing
to the last line of the screen, the screen will scroll up by one line.

Basic usage of `PRINT`:

```smallbasic
PRINT 1                             ' Output: 1
PRINT 1+1                           ' Output: 2
PRINT cos(pi)                       ' Output: -1
PRINT "Text"                        ' Output: Text
```

If `;` or `,` are used as last character of a print command, carriage return/line feed
(new line) will be suppressed after printing.

Please read the language reference of [PRINT](/reference/535.html)
for a detailed description. The text cursor can be set using
[LOCATE](/reference/530.html).

### Read Input from the Keyboard {#ReadInputFromKeyboard}

`INPUT` reads text from keyboard and stores it in a variable. `INPUT` can print a prompt
on screen. After execution of `INPUT` the cursor will be moved to the beginning of the
next line. `INPUT` will block execution of the program until the return-key is pressed.

Basic usage of `INPUT`:

```smallbasic
INPUT "How old are you?", age
PRINT age
```

For more information see language reference of [INPUT](/reference/527.html).
[INKEY](/reference/539.html) and [DEFINEKEY](/reference/1015.html) allow to read from
a keyboard without blocking the execution of the program.

### Draw Graphics on Screen {#DrawGraphicsOnScreen}

In SmallBASIC graphics and text can be mixed on the same screen. The graphics screen consist
of pixels. In standard configuration the top-left pixel has the coordinate `[0,0]`. The pixel
left of `[0,0]` has the coordinate `[1,0]`. The pixel below `[0,0]` has the coordinate `[0,1]`.
The bottom-right pixel has the coordinate given by the size of the window minus one. For a
window size of 640 pixel in x- and 480 pixel in y-direction, the bottom-right pixel would have
the coordinate `[639,479]`.

A color can be assigned to every pixel. SmallBASIC supports two ways to specify a color. The easy
way is to pick a color from a build in color palette of 16 colors by specifying the corresponding
color index as listed in the following table.

| Index | Color                                                     |
|:-----:|:----------------------------------------------------------|
| 0     | <font style='color:#000000'>&block;</font> black          |
| 1     | <font style='color:#000080'>&block;</font> blue           |
| 2     | <font style='color:#008000'>&block;</font> green          |
| 3     | <font style='color:#008080'>&block;</font> cyan           |
| 4     | <font style='color:#800000'>&block;</font> red            |
| 5     | <font style='color:#800080'>&block;</font> magenta        |
| 6     | <font style='color:#808000'>&block;</font> yellow         |
| 7     | <font style='color:#c0c0c0'>&block;</font> white          |
| 8     | <font style='color:#808080'>&block;</font> gray           |
| 9     | <font style='color:#0000ff'>&block;</font> bright blue    |
| 10    | <font style='color:#00ff00'>&block;</font> bright green   |
| 11    | <font style='color:#00ffff'>&block;</font> bright cyan    |
| 12    | <font style='color:#ff0000'>&block;</font> bright red     |
| 13    | <font style='color:#ff00ff'>&block;</font> bright magenta |
| 14    | <font style='color:#ffff00'>&block;</font> bright yellow  |
| 15    | <font style='color:#ffffff'>&block;</font> bright white   |

A slightly more complicated way is to compose a color by defining the red, green and blue
component of the color using the command `RGB(r, g, b)`. Every color component has a value from
0 to 255. To assign a color for the next drawing command use the command `COLOR foreground, background`.
`foreground` and `background` are either a color index from 0 to 15 or the return value of the
command `RGB`.

SmallBASIC support a variety of basic drawing routines, like draw a point, a line or a rectangle.

The following example sets colors and draws a line and a rectangle.

```smallbasic
COLOR 15,0             ' set foregound and background color using a color index
CLS                    ' clear the screen using the background color
LINE 0,0,50,50         ' draw a line
COLOR RGB(128,45,200)  ' set foreground color using RGB values
RECT 0,0,50,50         ' draw a rectangle
```

To specify “world” coordinates for the screen use the command `WINDOW(x1,x2,y2,y1)`. `WINDOW`
allows you to redefine the corners of the display screen as a pair of “world” coordinates. The
coordinates of the upper-left corner of the screen is given by [x1, y1], the lower-left corner
by [x2, y2]. The world space defined by WINDOW is disabled by a WINDOW command without parameters.

`VIEW(x1,y1,x2,y2)` defines a viewport with starting point (upper left corner)) [x1,y1] and end
point (lower right corner) [x2,y2]. Drawing outside the viewport is not possible.

The `WINDOW` command can be used to setup several additional window parameters or to display GUI
elements, for example:

```Smallbasic
' Display an alert
w = window()
w.alert("This is an alert", "title")
```

```Smallbasic
w = window()
w.setLocation(100, 100)   ' Set window screen location 
w.setSize(800, 680)       ' Set window size
```

For more information about graphics commands please see [Graphics](/pages/graphics.html).

## Basic File Read and Write {#BasicFileReadAndWrite}

SmallBASIC supports various commands to read and write a file. Best suited for beginners are `PRINT` and `INPUT`. `PRINT` writes to a file in the same way as described in the section "Print on Screen". `INPUT` without additional parameters reads one line from a file. To read or write a file, the file needs first to be opened. This is done using the command `OPEN`:

```smallbasic
OPEN file for INPUT|OUTPUT|APPEND as #1
```

Using the command `OPEN`, a file with the file name `file` can be opened for reading (`INPUT`), for writing (`OUTPUT`), and writing to an existing file (`APPEND`). If you use the parameter `OUTPUT` and the file already exist, the file will be deleted. `#1` is a ID number you can chose freely, but it must start with `#`

To write to a file, `PRINT` can be used:

```smallbasic
PRINT #1, "Hello world"
```

`PRINT` has the same syntax as the print command in section "Print on Screen". To tell `PRINT`, that the output should be written to a file, use the file ID number as the first parameter.

With `INPUT`, data can be read from a file:

```smallbasic
INPUT #1, s
```

`INPUT` without additional parameters reads a line from file with the file ID `#1` into the variable `s`.

```smallbasic
IF EOF(1) THEN PRINT "End of file reached"
```

`EOF(FileID)` returns `1` if the end of the file is reached and no more data can be read from file. Please note, that in case of `EOF` the File ID is given without `#`.

To close a file, use `CLOSE #1`.

The following example writes the numbers 1 to 10 to a file and reads these numbers from a file and prints them on screen.

```smallbasic
' create a text file
OPEN "MyDemoFile.txt" FOR OUTPUT AS #1

FOR i = 1 TO 10
    PRINT #1, i
NEXT

CLOSE #1

' open text file and print content line by line
OPEN "MyDemoFile.txt" FOR INPUT AS #1

WHILE(!EOF(1))   ' eof works only without #
    INPUT #1, c
    PRINT c
WEND

CLOSE #1
```

### Save Arrays and Maps to a File {#SaveArraysAndMapsToAFile}

`TLOAD` and `TSAVE` provide a simple way to store arrays, maps or strings in a file and read them. Using a map, json data can be created and written to a file.

```smallbasic
' Create an array with some data
A << 1
A << "test"
A << 2
PRINT A                         ' Output: [1,test,2]

' Save the array. This will create the file myfile.txt in
' the same directory as your BASIC file
TSAVE "myfile.txt", A

' Load the file
TLOAD "myfile.txt", B
PRINT B                         ' Output: [1,test,2,]
```

### Save Variables to a File {#SaveVariablesToAFile}

With `READ` and `WRITE` numbers, strings and arrays can be read and written. The resulting file is a binary file. Viewing this file in a text editor will not show you anymore the context in a human readable form.

```smallbasic
a = 12.3
b = "test"
c = [1,2,3,4]

' Write variables to file
OPEN "text.bin" FOR OUTPUT AS #1
WRITE #1, a, b, c
CLOSE #1

' Read variables from file
OPEN "text.bin" FOR INPUT AS #1
READ #1, a, b, c
CLOSE #1

PRINT a
PRINT b
PRINT c
```

### Binary Files {#BinaryFiles}

`BGETC` and `BPUTC` can be used to read and write a byte from/to a binary file.

```smallbasic
' create a binary file
OPEN "BinaryFile.txt" for output as #1

FOR c = 0 TO 255
    BPUTC #1, c
NEXT

CLOSE #1

' open binary file and print content
OPEN "BinaryFile.txt" FOR INPUT AS #1

FOR i = 0 TO 255
    c = BGETC(1)
    PRINT CHR(c);
NEXT

CLOSE #1
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
- `OPTION PREDEF AUTOLOCAL`: All variables are local by default

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

## Exception Handling {#ExceptionHandling}

Exception handling is supported for file handling, and accessing serial ports and
network sockets. Exception handling is typically used with errors raised when
calling a file system command that cannot be completed, for example attempting to
open a non-existent file.

```smallbasic
TRY
    ' do something
CATCH err
    print err
    ' do something
END TRY
```

```smallbasic
TRY
    ' do something
CATCH "Error 1"
    ' do something
CATCH "Error 2"
    ' do something
END TRY
```

The `TRY` statement introduces a try/catch block. A try/catch block consist of the
following structure:

`TRY`

The `TRY` statement starts a block of commands which might create a run-time error.

`CATCH [var | expr]`

The `CATCH` statement is used to catch a run-time error of one of the commands in
the try-block. 

The `CATCH` statement has two modes. You can supply a variable argument to store the
error string. Alternatively you can supply a string expression. When the raised error
matches the string expression, the error will be caught. When using the expression
mode, you can supply a succession of CATCH statements to handle various error messages
separately.

`END TRY`

The `END TRY` statement marks the end of a try/catch block.

For examples see the language reference [TRY](https://smallbasic.github.io/reference/1425.html).