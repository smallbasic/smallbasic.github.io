---
permalink: /1443
layout: post
title:  "EXEC"
categories: system
---
System

EXEC file

Transfers control to another operating system program.

```

Const IS_LINUX = Left(HOME, 1) = "/" ' check if it's Linux system
Const FILE_NAME = "demo.bas" ' demo file name
' Create demo SmallBASIC file:
code << "Color 15, 1: ? " + Enclose("Hello World") + ": Pause" ' append line
Tsave FILE_NAME, code

' Chain: ---
Color 15, 0: ?: ? "Press a key to run another SmallBASIC program and return:"
Pause
Chain FILE_NAME ' Chain only executes another SmallBASIC code.

' Run: ---
Color 13, 0: ?: ? "Press a key to run another program and return:"
Pause
' Call the system shell to execute a program (arguments are allowed):
If IS_LINUX Then
  Run "gedit " + FILE_NAME
Else ' Windows
  Run "Notepad " + FILE_NAME
Fi

' Exec: ---
Color 14, 0: ?: ? "Press a key to execute another program and quit:"
Pause
' Execute a program directly (arguments to the program not allowed);
' Note:  EXEC ""  ' Will quit SmallBASIC (handy within the SB editor).
If IS_LINUX Then
  Exec "gedit"
Else ' Windows
  Exec "Notepad"
Fi
Pause ' < -- Will never reach this command after EXEC.

```

Apparently, RUN/EXEC have bugs in SmallBASIC version 0.12.2...:
chrisws replied on Sun, 04/24/2016 - 00:29 http://smallbasic.sourceforge.net/?q=comment/1187#comment-1187
<blockquote>
RUN/EXEC
There are three modes:
1. RUN(command) ' invoked as a COMMAND
2. v=RUN(command) 'invoked as a FUNC, returning the results of the sub process
With both of these, control returns to the .bas once system 'command' has completed.
3. EXEC(command) 'invoked as a COMMAND, control returns to the .bas immediately and the system command does it's own thing external to SmallBASIC.
...
Note: In the android version you can use v=RUN to look at interesting things in the /proc file system.
</blockqoute>
