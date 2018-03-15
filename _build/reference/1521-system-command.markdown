# COMMAND

> COMMAND

SmallBASIC startup command line options.


<strong>SDL version (GUI):</strong>
Running the following line from the command line:
<pre>
sbasicg -r test.bas "abc xyz fileName"
</pre>

When "test.bas" is:
<pre>

?  COMMAND
Pause

</pre>

Will print "abc xyz fileName"
<cite>Note: Run <pre>
sbasicg -e test.bas
</pre>
 to enable 'Edit' mode again.</cite>
<strong>Non-graphical console version (cygwin or linux):</strong>
(Download from: https://github.com/smallbasic/SmallBASIC)
(Build the source, then run: ./SmallBASIC/src/platform/unix/sbasic)
Running the following line from the command line:
<pre>
sbasic test.bas "abc xyz fileName"
</pre>

When "test.bas" is:
<pre>

?  COMMAND
' if you add PAUSE keyword then press Ctrl+C to return to command prompt.

</pre>

Will print "abc xyz fileName"
