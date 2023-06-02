# COMMAND

> s = COMMAND

Returns a string `s` containing the SmallBASIC startup command line options.

### Example 1: SDL version (GUI)

Running the following line from the command line:

```
LINUX:   sbasicg -r test.bas abc xyz fileName
WINDOWS: sbasicg.exe -r test.bas abc xyz fileName
```

When "test.bas" is:

```
PRINT COMMAND
```

Will print "abc xyz fileName"

Note: When using the paramter `-r` in the above shown example, sbasicg will from now on always start the programm. If you want, that sbasicg starts again in edit-mode, please use the parameter `-e`

```
LINUX:   sbasicg -e test.bas
WINDOWS: sbasicg.exe -e test.bas
```

### Example 2: Non-graphical console version (cygwin or linux)

Running the following line from the command line:

```
LINUX:   sbasic test.bas abc xyz fileName
WINDOWS: sbasic.exe test.bas abc xyz fileName
```

When "test.bas" is:

```
PRINT  COMMAND
```

Will print "abc xyz fileName"

### Example 3: Use SPLIT to separate parameters

```
LINUX:   sbasicg -r test.bas abc xyz fileName
WINDOWS: sbasicg.exe -r test.bas abc xyz fileName
```

When "test.bas" is:

```
s = COMMAND()

split s, " ", parameters

print "First parameter : "; parameters[0]
print "Second parameter: "; parameters[1]
print "Third parameter : "; parameters[2]

' Output:
' First parameter : abc
' Second parameter: xyz
' Third parameter : fileName 
```

