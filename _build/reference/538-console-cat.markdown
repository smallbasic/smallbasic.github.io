# CAT

> s = CAT (x)

Returns an escape code to format a string. The values of `x` are listed in the following table:

| x  | format        |
|---:|---------------|
| 0  | reset         |
| 1  | bold          |
| -1 | bold off      |
| 2  | underline     |
| -2 | underline off |
| 3  | reverse       |
| -3 | reverse off   |

For more information about escape codes please see the article "Escape codes".

### Example

```
Color 14, 1
print Cat(1); "This is Bold text"; Cat(-1)
print
print Cat(2); "This is Underline text"; Cat(-2)
print
print Cat(3); "This is Reverse text"; Cat(-3)
print 
' Cat(0) resets ALL attributes, including colors.
print Cat(1); Cat(2); "This is Bold & Underline text"; Cat(0) 
print
print Cat(2); Cat(3); "This is Underline & Reverse text (with default colors)"; Cat(0)
```

