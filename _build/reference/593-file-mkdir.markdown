# MKDIR

> MKDIR dir

Creates the directory `dir`. `dir` is a string representing a valid directory name. `dir` can additionally contain a path. Without a path, the directory will be created in the current working directory. Errors can be catched using TRY ... CATCH.

### Example 1

```
mkdir "test"
mkdir "C:\\test"    ' In Windows use \\ instead of \
```

### Example 2: Use TRY ... CATCH

```
' Run this program two times to get the error messege "FILE EXISTS"
try
    mkdir "test"
catch err
    print err
end try
```



