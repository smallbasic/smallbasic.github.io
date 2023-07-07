# RETURN

> RETURN

> RETURN {var|expr}

When used with GOSUB: Execution of the program branches to the command immediately following the most recent GOSUB command. RETURN is used without `var` or `expr`.

When used with FUNC: Set the return value of a function to the value `var` or the result of the expression `expr`.

### Example 1: GOSUB

```
GOSUB my_routine
PRINT "RETURN sent me here"

END

LABEL my_routine
PRINT "I am in my routine"
RETURN
```

### Example 2: Function

```
Result = MyAddFunction(10, 20)
print Result


func MyAddFunction(a, b)
  return a + b
end
```

