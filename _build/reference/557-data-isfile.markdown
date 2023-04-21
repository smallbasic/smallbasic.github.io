# ISFILE

> b = ISFILE (file)

Returns true if the string "f" is a regular file.

### Example

```
print IsFile("C:\windows\EXPLORER.EXE")        ' Output 1 on Windows, otherwise 0
print IsFile("/etc/passwd")                    ' Output 1 on Linux, otherwise 0
```
