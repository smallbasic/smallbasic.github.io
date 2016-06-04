---
layout: post
title:  "COMMAND"
categories: system
---
System

COMMAND

SmallBASIC startup command line options.


<strong>SDL version (GUI):</strong>
Running the following line from the command line:
```
sbasicg -r test.bas "abc xyz fileName"
```

When "test.bas" is:
```

?  COMMAND
Pause

```

Will print "abc xyz fileName"
<cite>Note: Run ```
sbasicg -e test.bas
```
 to enable 'Edit' mode again.</cite>
<strong>Non-graphical console version (cygwin or linux):</strong>
(Download from: https://github.com/smallbasic/SmallBASIC)
(Build the source, then run: ./SmallBASIC/src/platform/unix/sbasic)
Running the following line from the command line:
```
sbasic test.bas "abc xyz fileName"
```

When "test.bas" is:
```

?  COMMAND
' if you add PAUSE keyword then press Ctrl+C to return to command prompt.

```

Will print "abc xyz fileName"
