# ISNUMBER

> b = ISNUMBER (x)

Returns true if x is a number or can be converted to a number.

### Example 

```
print ISNUMBER(12)          ' Output 1
print ISNUMBER("12")        ' Output 1
print ISNUMBER("12E+2")     ' Output 1
print ISNUMBER("abc")       ' Output 0
print ISNUMBER("1+2")       ' Output 0
print ISNUMBER("int(2.4)")  ' Output 0
```


