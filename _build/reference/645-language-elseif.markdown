# ELSEIF

> ELSEIF

Alternative condition in an IF statement.

### Example 1

~~~
foo = 2
if foo == 1
  print "one"
ELSEIF foo == 2
  print "two"
endif
~~~

### Example 2: using IF ... ELSE ... IF instead of ELSEIF

~~~
foo = 2
if foo == 1
  print "one"
else
  if foo == 2
    print "two"
  endif
endif
~~~


