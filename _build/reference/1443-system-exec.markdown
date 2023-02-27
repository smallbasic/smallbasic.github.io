# EXEC

> EXEC file

Transfers control to another operating system program. Control returns to the .bas immediately and the system command is executed parallel and independent to SmallBASIC. File name is case sensitive in Linux.

See `run` for starting an external program and wait until program finished execution.

```
                ' Select your editor for testing
exec "kate"     ' Editor KDE
'exec "gedit"   ' Editor Gnome
'exec "Notepad" ' Editor Windows

print "This line will be printed immediately without delay"
```

