# EXEC

> EXEC file

Transfers control to another operating system program.


~~~

Const IS_LINUX = (Left(HOME, 1) = "/")  ' Check if it's Linux system
Const IS_WINDOWS = Not IS_LINUX
Const FILE_NAME = "demo.bas"  ' demo file name

' Print header before each mission:
Sub header(text)
  ? Cbs("\\n\\n" + Cat(0) + Cat(3) + Enclose(text, " ") + Cat(0) + Chr(7))
  Pause
End Sub

' Create demo SmallBASIC file:
code << "Color 15, 1: ? " + Enclose("Hello World") + ": Pause" ' append line
Tsave FILE_NAME, code

' CHAIN(source)
'
'  Compile and run the given source. Source can be a file name, a line of code 
'  or an array of code. Use ENV to share variables with the parent process.
header "Press a key to Chain another SB program and return afterwards..."
Chain FILE_NAME ' Chain only executes another SmallBASIC code.

' RUN(command)     ' invoked as a COMMAND
' x = RUN(command) ' invoked as a FUNC, returning the results of the sub process
'
'  With both of these, control returns to the .bas once system 'command' 
'  has completed.
header "Press a key to Run another program and return afterwards..."
Select Case 1
  Case IS_LINUX:   Run "gedit " + FILE_NAME
  Case IS_WINDOWS: Run "Notepad " + FILE_NAME
End Select
? "OK."

' EXEC(command)
'
'  Invoked as a COMMAND, control returns to the .bas immediately and the
'  system command does it's own thing external to SmallBASIC:
header "Press a key to Execute another program in the background..."
Select Case 1
  Case IS_LINUX:   Exec "gedit"
  Case IS_WINDOWS: Exec "Notepad"
End Select
? "Done.";
Pause

~~~

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
