# RETURN

> RETURN

When used with GOSUB: Execution branches to the command immediately following the most recent GOSUB command.

When used with FUNC: returns the value.

### Example 1:

```
GOSUB my_routine
PRINT "RETURN sent me here"

END

LABEL my_routine
PRINT "I am in my routine"
RETURN
```

```
Result = MyAddFunction(10, 20)
print Result


func MyAddFunction(a, b)
  return a + b
end
```

