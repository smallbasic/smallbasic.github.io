# RUN

> RUN cmdstr

Loads a secondary copy of system's shell and, executes an program, or an shell command.


~~~

' Note: RUN is different then CHAIN. RUN executes external system command,
'       while CHAIN executes SmallBASIC code (similar to EVAL function).
Const IS_LINUX = (Left(HOME, 1) = "/")  ' Check if it's Linux system
Const IS_WINDOWS = Not IS_LINUX
Const DEMOFILE = Enclose("demo.tmp")

' Print header before each RUN mission:
Sub header(text)
  ? Cbs("\\n\\n" + Cat(3) + Enclose(text, " ") + Cat(0) + Chr(7))
  Pause
End Sub

' Run a built-in shell command - as a FUNCTION:
header "Press Enter to output directory list into string..."
Select Case 1
  Case IS_LINUX:   lines = Run("ls")   ' "ls" command on Linux
  Case IS_WINDOWS: lines = Run("DIR")  ' "DIR" command on Windows
End Select
Split lines, Cbs("\\n"), lines   ' Convert string to array
For i In lines: ? i,: Next      ' Print array content

' Run a built-in shell command - as a COMMAND:
header "Press Enter to output directory list into file " + DEMOFILE + "..."
Select Case 1
  Case IS_LINUX:   Run "ls > " + DEMOFILE   ' "ls" command on Linux
  Case IS_WINDOWS: Run "DIR > " + DEMOFILE  ' "DIR" command on Windows
End Select
Tload Disclose(DEMOFILE), lines   ' load DEMOFILE into array
For i In lines: ? i,: Next        ' Print array content

' Run another program:
header "Press Enter to edit " + DEMOFILE + " in external editor..."
Select Case 1
  Case IS_LINUX:   Run "gedit " + DEMOFILE
  Case IS_WINDOWS: Run "Notepad " + DEMOFILE
End Select
? "OK."
' Run another program (which is actually SmallBASIC's IDE):
header "Press Enter to edit " + DEMOFILE + " in SmallBASIC editor..."
Select Case 1
  Case IS_LINUX:   Run "sbasicg -e " + DEMOFILE
  Case IS_WINDOWS: Run "sbasicg -e " + DEMOFILE
End Select
? "Done...";
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
Windows 10 is having none of this. Starting with it thinking it should do the Linux branch in the first decision branch.
But RUN won't even RUN "DIR > Directory.txt" (let alone give me a directory of DeskTop where I am at and running SB from.)
Append: As a way to get OS, I just tried 
? OSNAME
and learned my Operating System is SDL ??? something is wrong
also my SB version number is 0.12.1 but About menu says 0.12.2, I believe About menu.
In general:
1.
The search path for running a command (executable file) is defined in the "PATH" environment variable (unless full path to the executable is supplied). In Windows, the current directory will be searched before the directories specified in the PATH variable (but not on Linux).

~~~

Const IS_LINUX = (Left(HOME, 1) = "/") ' check if it's Linux system
' find current PATH with:
If IS_LINUX Then
  RUN "echo $PATH > path.tmp"
Else ' Windows (syntax...?)
  RUN "SET PATH > path.tmp"
Fi
Tload "path.tmp", lines
? lines
Pause

~~~

2. 
Command to execute is case sensitive on Linux (not on Windows).
3.
RUN loads a secondary command shell to execute a command. In Linux, and maybe on other systems as well, each command shell has unique environment-variables-table; which means that you cannot always share environment variables with command executed by RUN:

~~~

Const IS_LINUX = (Left(HOME, 1) = "/") ' check if it's Linux system
' This can work (verified on Linux):
' SB1 variable is set in main shell, and shared with secondary shell:
ENVIRON "SB1=67890"
If IS_LINUX Then
  RUN "echo $SB1 > test.tmp" 
Else ' Windows (syntax...?)
  RUN "SET SB1 > test.tmp" 
Fi
Tload "test.tmp", lines
? lines
Pause
' This cannot work (verified on Linux, without using the 'export' keyword):
' SB1 variable is set in secondary shell:
If IS_LINUX Then
  RUN "SB1=12345"   
Else ' Windows (syntax...?)
  RUN "SET SB1=12345" 
Fi
' Now back to main shell, so SB1 is 67890 again...:
? ENVIRON("SB1")     
Pause

~~~

4.
Using RUN with built-in shell commands, such as DIR (to show directory list), might be confusing, because the result is not always visible.
To delete a file you can try: 

~~~
RUN "DEL test.tmp"
~~~
 on Windows. 

~~~
RUN "rm test.tmp"
~~~
 on Linux. 
Then check if file is deleted from SmallBASIC with 
~~~
? EXIST "test.tmp"
~~~
.
To retrieve directory list it's better to output the data to a file:

~~~
RUN "DIR > test.tmp"
~~~
 on Windows.

~~~
RUN "ls > test.tmp"
~~~
 on Linux.

~~~
TLOAD test.tmp, lines: ? lines
~~~
 will verify that the command was executed well.
5. 
Systems commands, especially on Linux, are very powerful, and can add lots of valuable features to a SmallBASIC program. With system commands you can configure the COM port, send email (Linux at least), get lots of information about the environment, etc, etc.
But before you can actually use these features - you must learn how your system is working, and which commands are available (Read Ebook or a book to understand the basics).
