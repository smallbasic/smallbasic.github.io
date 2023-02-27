# FILES

> FILES (exp)

Returns an array with the filenames. If there are no files, `FILES` returns an empty array. `exp` can contain the wildcards `*` and `?`. `exp` can include a path.

### Example 1: List all files in the current directory

```
FileNames = files("*.*")

for f in FileNames
    print f
next
```

### Example 2: List all files matching search string

```
FileNames = files("t?st.bas")

for f in FileNames
    print f
next
```

### Example 3: Using a path

```
FileNames = files("/usr/bin/*")    ' Linux
' FileNames = files("C:\*.*")      ' Windows

for f in FileNames
    print f
next
```
