# RIGHTOF

> r = RIGHTOF (s1, s2)

Returns the right part of string `s1` at the position of the first occurrence of string `s2` in `s1`. If `s2` does not occure in `s1` RIGHTOF returns an empty string.

### Example

```
s = "abcdef"

print rightof(s, "cd")  ' Output: ef
print rightof(s, "a")   ' Output: bcdef
print rightof(s, "f")   ' Output: 
print rightof(s, "xx")  ' Output: 
```
