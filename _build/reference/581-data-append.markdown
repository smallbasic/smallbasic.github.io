# APPEND

> APPEND a, var1 [, var2 [, ..., varN]]

Inserts the values `var1` to `varN` at the end of the array `a`. `var1` to `varN` can be any data type.

Instead of APPEND the `<<` Operator can be used.


### Example 1: Append single number

```
a = [1,2,3]
print "Before APPEND: "; a

APPEND a, 4
print "After APPEND : "; a

' Output:
' Before APPEND: [1,2,3]
' After APPEND : [1,2,3,4]
```

### Example 2: Append multiple numbers

```
a = [1,2,3]

APPEND a, 4, 5
print a              ' Output: [1,2,3,4,5]
```

### Example 3: Append an array

```
a = [1,2,3]

APPEND a, [4,5,6]
print a              ' Output: [1,2,3,[4,5,6]]
```

### Example 4: Append a string

```
a = ["a", "b", "c"]

APPEND a, "d"
print a                 ' Output: [a,b,c,d]
```

### Example 5: Using << operator

```
a = [1,2,3]

a << 4
print a                  ' Output: [1,2,3,4]
```
