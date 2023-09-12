# TAB

> s = TAB (n)

Moves cursor position to the `n`th column. the return value `s` contains the escape sequence for moving the cursor.

### Example

```
print tab(1); "1 tab"
print tab(2); "2 tabs"

s = tab(3)
print s; "3 tabs"
```
