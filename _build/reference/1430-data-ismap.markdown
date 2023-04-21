# ISMAP

> b = ISMAP (x)

Returns true if `x` is a MAP variable.

### Example

```
A = {"x":1, "y":2}
print IsMap(A)      ' Output 1

A = [1,2,3]
print IsMap(A)      ' Output 0 (is an array)

A = 1
print IsMap(A)      ' Output 0 (is a number)

A = "abc"
print IsMap(A)      ' Output 0 (is a string)
```


