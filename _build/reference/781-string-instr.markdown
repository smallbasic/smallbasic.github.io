# INSTR

> pos = INSTR ([start,] s1, s2)

Returns the position `pos` of the first occurrence of the string `s2` in string `s1` (starting from the position `start`). If there is no match, INSTR returns 0.

### Example 1: Get position starting a the beginning of the string

```
s1 = "abcdef"
s2 = "cd"
print instr(s1, s2)  ' Output 3
```

### Example 2: Get position using a starting point

```
s1 = "abcdefabcd"
s2 = "ab"
print instr(3, s1, s2)  ' Output: 7  (instead of 1)
```
