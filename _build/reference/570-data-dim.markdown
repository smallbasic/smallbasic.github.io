# DIM

> DIM var([lower TO] upper [, ...]) [, ...]

Reserves storage space for an array.

The array will have (upper-lower)+1 elements. If `lower` is not specified, and `OPTION BASE` hasn't used, elements start at 0.

## Example 1: One dimensional arrays

```
REM One dimensional array of 7 elements, starting from 0
REM with elements A(0), A(1), ... , A(6)
DIM A(6)
```

```
REM One dimensional array of 7 elements, starting from 3
REM with elements A(3), A(4), ... , A(9)
DIM A(3 TO 9)
```

```
REM One dimensional array of 6 elements, starting from 1
REM with elements A(1), A(2), ... , A(6)
option base 1
DIM A(6)
```

## Example 2: Multi dimensional arrays

```
REM Two dimensional array
DIM A(3, 4)
```

```
REM Three dimensional array
DIM A(2 TO 6, 5 TO 9, 1 TO 8)
```

## Example 3: Empty array

```
REM Allocating zero-length arrays:
DIM z()
```

## Example 4: Creating and accessing arrays

~~~

Option Base 1 ' Set default lower bound of arrays to 1
? "Showing x,y,z elements of index 5:"
?
' Reserve space for a single 1-dimensional array:
x = 0
y = 10
z = 20
Dim a(1 To 30)
For i = 1 To 10
  a(i + x) = i
  a(i + y) = i + 10
  a(i + z) = i + 100
Next
? a(5 + x), a(5 + y), a(5 + z),, "(1-dimensional array)"

' Reserve the same space for three 1-dimensional arrays:
Dim a_x(1 To 10), a_y(1 To 10), a_z(1 To 10)
For i = 1 To 10
  a_x(i) = i
  a_y(i) = i + 10
  a_z(i) = i + 100
Next
? a_x(5), a_y(5), a_z(5),, "(three 1-dimensional arrays)"

' Reserve the same space for a single 2-dimensional array:
x = 1
y = 2
z = 3
Dim a(1 To 10, x To z)
For i = 1 To 10
  a(i, x) = i
  a(i, y) = i + 10
  a(i, z) = i + 100
Next
? a(5, x), a(5, y), a(5, z),, "(2-dimensional array)"

' Reserve the same space for a single nested array:
Dim a(1 To 10)
For i = 1 To 10
  a(i) = [,,] ' convert this element to nested array
  a(i)(x) = i
  a(i)(y) = i + 10
  a(i)(z) = i + 100
Next
? a(5)(x), a(5)(y), a(5)(z),, "(nested array)"

' Reserve the same space for a single map array (see also: ARRAY, ISMAP):
Dim a(1 To 10)
For i = 1 To 10
  a(i).x = i
  a(i).y = i + 10
  a(i).z = i + 100
Next
? a(5).x, a(5).y, a(5).z,, "(map array)"
~~~


