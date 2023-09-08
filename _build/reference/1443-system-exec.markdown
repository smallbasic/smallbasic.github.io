# EXEC

> EXEC (file)

Transfers control to the program `file`. Control returns to the calling bas-file immediately and the program is executed parallel and independent to SmallBASIC. File name is case sensitive in Linux. Enclose the string `file` with quotation marks to start a program with parameters.

See `run` for starting an external program and wait until program finished execution.

### Example 1

```
                ' Select your editor for testing
exec "kate"     ' Editor KDE
'exec "gedit"   ' Editor Gnome
'exec "Notepad" ' Editor Windows

print "This line will be printed immediately without delay"
```

### Example 2: Execute with parameters

```
' Call shutdown in Linux
exec(enclose("shutdown -h now"))
```
