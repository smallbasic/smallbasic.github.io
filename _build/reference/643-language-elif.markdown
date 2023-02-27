# ELIF

> ELIF

Short for ELSEIF.

### Example 1

~~~
foo = 2
if foo == 1
  print "one"
ELIF foo == 2
  print "two"
fi
~~~

### Example 2: using IF ... ELSE ... IF instead of ELIF

~~~
foo = 2
if foo == 1
  print "one"
else
  if foo == 2
    print "two"
  fi
fi
~~~


