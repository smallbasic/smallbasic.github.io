# ACCESS

> n = ACCESS (file)

Returns the access rights of a file. The string `file` follows OS file naming conventions. The returned file permission number `n` follows the permission pattern of the chmod() and stat() system calls. The bits of `n` (in octal) are:

| Bits | Permission                |
|:----:|:--------------------------|
|0o4000| set user ID on execution  |
|0o2000| set group ID on execution |
|0o1000| sticky bit                |
|0o400 | read by owner             |
|0o200 | write by owner            |
|0o100 | execute/search by owner   |
|0o40  | read by group             |
|0o20  | write by group            |
|0o10  | execute/search by group   |
|0o4   | read by others            |
|0o2   | write by others           |
|0o1   | execute/search by others  |

### Example

```
IF ACCESS("/bin/sh") AND 0o4 THEN
   PRINT "Others can read the file"
ENDIF
```

