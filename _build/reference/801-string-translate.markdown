# TRANSLATE

> s = TRANSLATE (source, what [, with])

Translates all occurrences of the string `what` found in string `source` with the string `with` and returns the new string. If `with` is not given, all occurrences of `what` will be removed.

### Example 1: Replace

```
s1 = "ab_cd_ef"
s2 = translate(s1, "_", "!")
print s1 + " -> "; s2          ' Output: ab_cd_ef -> ab!cd!ef
```

### Example 2: Remove

```
s1 = "ab_cd_ef"
s2 = translate(s1, "cd")
print s1 + " -> "; s2          ' Output: ab_cd_ef -> ab__ef
```
