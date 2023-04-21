# ISSTRING

> b = ISSTRING (x)

Returns true if x is a string and cannot be converted to a number.

### Example

```
print ISSTRING(12)          ' Output 0
print ISSTRING("12")        ' Output 0
print ISSTRING("12E+2")     ' Output 0
print ISSTRING("abc")       ' Output 1
print ISSTRING("1+2")       ' Output 1
print ISSTRING("int(2.4)")  ' Output 1
```

