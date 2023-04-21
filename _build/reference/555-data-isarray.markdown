# ISARRAY

> b = ISARRAY (x)

Returns true if x is an array.

### Example

```
A = [1,2,3]
print IsArray(A)    ' Output 1

A = {"x":1, "y":2}
print IsArray(A)    ' Output 0 (is a map)

A = 1
print IsArray(A)    ' Output 0 (is a number)

A = "abc"
print IsArray(A)    ' Output 0 (is a string)
```
