# DISCLOSE

> DISCLOSE (str[, pairs [, ignore-pairs]])

Discloses a string.

Default pairs and ignore pairs

| First non white-space character | Check | Ignore  |
|---------------------------------|-------|---------|
| "                               | " "   | ' '     |
| '                               | ' '   | " "     |
| (                               | ()    | " " ' ' |
| [                               | []    | " " ' ' |
| {                               | {}    | " " ' ' |
| <                               | <>    | " " ' ' |
| "                               | " "   | ' '     |

## Example

```
s = "abc (abc)"
? "1. "; s; tab(20); " -> "; disclose(s, "()")                  ' prints abc

s = "abc (a(bc))"
? "2. "; s; tab(20); " -> "; disclose(s, "()")                  ' prints a(bc)
? "3. "; s; tab(20); " -> "; disclose(disclose(s, "()"), "()")  ' prints bc

s = "abc (a='(bc)')"
? "4. "; s; tab(20); " -> "; disclose(s, "()", "''")             ' prints a='(bc)'
? "5. "; s; tab(20); " -> "; disclose(disclose(s, "()", "''"), "()", "''")
' prints nothing
```
