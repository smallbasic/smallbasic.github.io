# FUNC

> FUNC foo (a, b)

Declares a function. Return a value by assigning a variable with the same name as the function or by using `RETURN`.

### Example 1:

```
' Main program
print MyAddFunction(10,20)

' Function definition
FUNC MyAddFunction(a,b)
  local c   'c is just known inside this function
  c = a + b
  MyAddFunction = c
END
```

### Example 2: Using return

```
' Main program
print MyAddFunction(10,20)

' Function definition
FUNC MyAddFunction(a,b)
  local c   'c is just known inside this function
  c = a + b
  return c
END
```

