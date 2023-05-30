# LOGPRINT

> LOGPRINT ...

Prints to stderr. The syntax is the same as the command PRINT. LOGPRINT can be used to print log messages to a different output.
The nicely formated output of your program will not be messed up by the log messages.

### Example:

```
logprint "Error message goes to stderr"
print "Normal text goes to sdtout"
```

### stderr with sbasicg (SDL-version)

When starting sbasicg or sbasicg.exe from a command line, this command line will be the stderr output.
When using PRINT the text will be displayed in the program window. When using LOGPRINT the text will be
printed to the the command line window and not displayed in the program window.

### stderr with sbasic (console version)

The command line is usually stderr and stdout at the same time. Text printed with PRINT and text printed with LOGPRINT
will be displayed in the command line window.

### Redirect stderr to a file (Linux)

In Linux sdterr can be easily redirected to a file (i.e. error.txt):

Start the basic-file from a command line:

```
SDL-version    : sbasicg test.bas 2>error.txt
Console-version: sbasic test.bas 2>error.txt
```

with test.bas:

```
logprint "Error message goes to stderr"
print "Normal text goes to sdtout"
```

Afer running the program the file error.txt will appear with the content:

```
Error message goes to stderr
```





