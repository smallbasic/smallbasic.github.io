# RINSTR

> n = RINSTR ( [start], s1, s2 )

Returns the position of the last occurrence of string `s2` in string `s1` starting from the position `start`. If there is no match, RINSTR returns 0

### Example

```
s = "ab12ab34"
print rinstr(s, "ab")      ' Output: 5
print rinstr(6, s, "ab")   ' Output: 0
```
