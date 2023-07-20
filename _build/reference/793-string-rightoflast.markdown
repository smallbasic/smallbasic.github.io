# RIGHTOFLAST

> r = RIGHTOFLAST (s1, s2)

Returns the right part of string `s1` at the position of the last occurrence of string `s2` in `s1`. If `s2` does not occure in `s1` RIGHTOFLAST returns an empty string.

### Example

```
s = "abcdefcd123"

print rightoflast(s, "cd")  ' Output: 123
print rightoflast(s, "a")   ' Output: bcdefcd123
print rightoflast(s, "3")   ' Output: 
print rightoflast(s, "xx")  ' Output:
```
