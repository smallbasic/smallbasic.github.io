# CALL

> CALL (fp)

Invoke a sub or func by address pointer.

Example 1: CALL with a subroutine pointer

```
sub MyPrint(i)
  print i
end

a = @MyPrint
call a, "test"      ' when using CALL for subroutines,
                    ' please use CALL without brakets
```

Example 2: CALL with a function pointer

```
func Increment(i, b)
  return  i + b
end

x = 1
a = @Increment
y = call(a,x,2)     ' when using CALL for functions,
                    ' please use CALL with brakets
print y
```

Example 3: CALL with a subroutine pointer and BYREF:

```
sub Increment(byref i, b)
  i = i + b
end

x = 1
a = @Increment
call a,x,2
print x
```

Example 4: Passing function pointer to a function

```
func Increment(i)
  return i + 1
end

func Decrement(i)
  return i - 1
end

func MyFunc(f, i)
  return call(f,i)
end

a = @Increment
b = @Decrement
x = 2
x = MyFunc(a,x): print x
x = MyFunc(b,x): print x
```

