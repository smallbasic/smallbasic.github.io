# RUN

> [s =] RUN cmdstr

Loads a secondary copy of the system shell and executes a program or a shell command given by the string `cmdstr`. The execution of the calling BASIC program will be stoped and control returns to the BASIC program once the system command has completed. If RUN is called as a function, the return value `s` holds the text output of the executed command as a string. 

System commands, especially on Linux, are very powerful, and can add lots of valuable features to a SmallBASIC program. With system commands you can configure the COM port, send email (Linux at least), get lots of information about the environment, etc.

In the Android version you can use `s = RUN` to look at information in the /proc file system.

See EXEC if control should return to the BASIC program immediately.

## Use RUN in Windows

In Windows (tested with Win10) you have to call the programm `cmd` which opens a command line window. The command you want to execute will be a parameter of `cmd`. Additional the parameter `/C` needs to be added to quit the command line window after execution of the command. 

### Example 1: RUN as a function

```
s = run("cmd /C dir")                              ' Execute DIR and
print s                                            ' print a list of files in the current directory

s = run("cmd /C copy rename.txt rename1.txt")      ' Copy a file (please create the file rename.txt before testing)
print s                                            ' Prints the text output of copy
```

### Example 2: RUN as procedure

```
run("cmd /C copy rename.txt rename1.txt")          ' Copy a file (please create the file rename.txt before testing)
    
run("cmd /C notepad.exe")                          ' Start Notepad and wait until Notepad was closed        
```

## Use RUN in Linux

Commands to execute are case sensitive in Linux. Each command shell has an unique environment-variables-table; which means that you cannot always share environment variables with commands executed by RUN.

### Example 1:  RUN as a function

```
s = Run("ls")                                      ' Execute ls and print a list of files in the
print s                                            ' current directory

s = run("cp rename.txt rename1.txt")               ' Copy a file (please create the file rename.txt before testing)
print s                                            ' Prints the text output of cy
```

### Example 2: RUN as procedure

```
run("cp rename.txt rename1.txt")                   ' Copy a file (please create the file rename.txt before testing)
    
run("gedit")                                       ' Start gedit (if installed) and wait until gedit was closed        
```


## Other Examples

### Example 1: Querry whether Linux or Windows is used

```
const IS_LINUX = (Left(HOME, 1) = "/")  ' Check if it's a Linux system
const IS_WINDOWS = Not IS_LINUX

print "LINUX:   " + IS_LINUX
print "Windows: " + IS_WINDOWS
```
