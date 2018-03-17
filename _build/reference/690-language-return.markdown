# RETURN

> RETURN

Execution branches to the command immediately following the most recent GOSUB command.


...
GOSUB my_routine
PRINT "RETURN sent me here"
...
LABEL my_routine
PRINT "I am in my routine"
RETURN


