# VAL

> f = VAL (s)

Returns the numeric value of string `s`. If `s` cannot be converted to a number, VAL will return `0`. VAL does not evaluate the string.

### Example

```
print val("123")        ' Output: 123
print val("123e2")      ' Output: 12300
print val("0xFF")       ' Output: 255

print val("123*2")      ' Output: 123
print val("123abcd")    ' Output: 0
print val("seven")      ' Output: 0
```


