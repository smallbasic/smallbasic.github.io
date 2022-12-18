# COMMAND

> COMMAND

SmallBASIC startup command line options.


### SDL version (GUI):

Running the following line from the command line:

```
LINUX:   sbasicg -r test.bas "abc xyz fileName"
WINDOWS: sbasicg.exe -r test.bas "abc xyz fileName"
```

When "test.bas" is:

```
? COMMAND
```

Will print "abc xyz fileName"

Note: Run 

```
LINUX:   sbasicg -e test.bas
WINDOWS: sbasicg.exe -e test.bas
```

to enable 'Edit' mode again.

### Non-graphical console version (cygwin or linux):

Running the following line from the command line:

```
LINUX:   sbasic test.bas "abc xyz fileName"
WINDOWS: sbasic.exe test.bas "abc xyz fileName"
```

When "test.bas" is:

```
?  COMMAND
```

Will print "abc xyz fileName"

