# STRING

> s = STRING ( count, {str | chr} )

Creates a new string, which repeats the string `str` `count` times. If instead of a string a number `chr` is given, `chr` will be interpreted as an ASCII-code and the corresponding character will be repeated `count` times.

### Example

```
print string(4, "A")        ' Output: AAAA
print string(4, "AB")       ' Output: ABABABAB
print string(4, 65)         ' Output: AAAA
```



