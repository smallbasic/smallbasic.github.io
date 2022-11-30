# ACCESS

> ACCESS (file)

Returns the access rights of the file.

* file - A string expression that follows OS file naming conventions.

Returns file permissions as per chmod() and stat() system calls.

The bits (in octal):

| Bits | Permission                |
|------|---------------------------|
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


```
IF ACCESS("/bin/sh") AND 0o4 THEN
   PRINT "Others can read the file"
ENDIF
```

