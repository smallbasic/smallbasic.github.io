# DISCLOSE

> s = DISCLOSE (str [, pairs [, ignore-pairs]])

Discloses the string `str`. `pairs` is a string of 2n characters. Two consecutive characters form a pair. The characters of `str` which are positioned between the first matching pair of `pairs` will be returned. `ignore-pairs` is a string with 2n characters. Two consecutive characters form a ignore-pair. All characters of `str` between an ignore-pair will be ignored (not returned).

if `pairs` and  `ingnore-pairs` are not given, the following default pairs and ignore pairs will be used:

| First non white-space character | Check | Ignore  |
|---------------------------------|-------|---------|
| "                               | " "   | ' '     |
| '                               | ' '   | " "     |
| (                               | ()    | " " ' ' |
| [                               | []    | " " ' ' |
| {                               | {}    | " " ' ' |
| <                               | <>    | " " ' ' |

### Example 1: Disclose default pairs

```
s = "(abc)"
print disclose(s)                        ' Output: abc
```

### Example 2: Disclose non-default pairs

```
s = "_abc_"
print disclose(s, "__")                  ' Output: abc

s = "([abc])"
print disclose(s, "[]")                  ' Output: abc

s = "([abc])"
print disclose(s, "[)")                  ' Output: abc]

s = "[(abc)]"
print disclose(s, "()[]")                ' Output: (abc)

s = "abc (def)"
print disclose(s, "()")                  ' Output: def

s = "abc (d(ef))"
print disclose(s, "()")                  ' Output: d(ef)
```

### Example 3: Disclose with ignore-pairs

```
s = "abc [d(ef)] (gh)"
print disclose(s, "()", "[]")            ' Output: gh
```
