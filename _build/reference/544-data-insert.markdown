# INSERT

> INSERT a, idx, val [, val [, ...]]]

Inserts the values to the specified array at the position idx.

- a - An array-variable.
- idx - Position in the array.
- val - Any value or expression.

Please be aware, that multiple variables will be sequentially inserted each at position 3. This leads to a reverse order.

### Example 1: Insert one variable

```
a = [1,2,3,4,5]

print a
insert a, 3, 6
print a

' Output:
' [1,2,3,4,5]
' [1,2,3,6,4,5]
```

### Example 2: Insert several variables

```
a = [1,2,3,4,5]

print a
insert a, 3, 6, 7, 8
print a

' Output:
' [1,2,3,4,5]
' [1,2,3,8,7,6,4,5]
```

### Example 3: Insert an array

```
a = [1,2,3,4,5]

print a
insert a, 3, [6,7]
print a

' Output:
' [1,2,3,4,5]
' [1,2,3,[6,7],4,5]
```

### Example 4: Insert a map variable

```
a = [1,2,3,4,5]
b = {x:6, y:7}

print a
insert a, 3, b
print a

' Output:
' [1,2,3,4,5]
' [1,2,3,{"y":7, "x":6},4,5]
```

### Example 5: Append a variable (insert at last position)

```
a = [1,2,3,4,5]

print a
a << 6
print a

' Output:
' [1,2,3,4,5]
' [1,2,3,4,5,6]
```


