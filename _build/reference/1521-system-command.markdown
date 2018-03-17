# COMMAND

> COMMAND

SmallBASIC startup command line options.


SDL version (GUI):>
Running the following line from the command line:

~~~
sbasicg -r test.bas "abc xyz fileName"
~~~

When "test.bas" is:

~~~

?  COMMAND
Pause

~~~

Will print "abc xyz fileName"
Note: Run 
~~~
sbasicg -e test.bas
~~~
 to enable 'Edit' mode again.>
Non-graphical console version (cygwin or linux):>
(Download from: https://github.com/smallbasic/SmallBASIC)
(Build the source, then run: ./SmallBASIC/src/platform/unix/sbasic)
Running the following line from the command line:

~~~
sbasic test.bas "abc xyz fileName"
~~~

When "test.bas" is:

~~~

?  COMMAND
' if you add PAUSE keyword then press Ctrl+C to return to command prompt.

~~~

Will print "abc xyz fileName"

