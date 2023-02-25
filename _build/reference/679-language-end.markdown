# END

> END

Declares the END of a SUB, a FUNC or the program.

### Example 1: Sub

```
sub MySub(a)
    print a + 10
end

MySub(10)
```

### Example 2: Func

```
func MyFunc(a)
    return a + 10
end

Result = MyFunc(10)
print Result
```

### Example 3: End of the program

```
while(1)
    ii = ii + 1
    print ii
    
    if(ii == 5) then
        end             ' end program
    endif
    
    delay(500)
wend
```
