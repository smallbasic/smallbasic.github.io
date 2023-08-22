# SUB

> SUB foo ([ [BYREF] var1, [BYREF] var2, ..., [BYREF] varN])

Declare a sub procedure `foo`. The optional parameters `var1` to `varN` can be all data types supported by SmallBASIC. Sub procedures do not return a value but can return argument values when declared as BYREF. A sub procedure ends with the keywords END or END SUB. The keyword LOCAL can be used to restrict the scope of a variable to the sub procedure only. Sub procedures can be nested within a sub procedure.

With SUB (and FUNC) you can divide your program into many logical, independent and reusable blocks, instead of writing a long "spaghetti code". Instead of using GOSUB and GOTO you should prefere to use sub procedures or functions.

For more information, see FUNC, LOCAL and BYREF.

### Example 1: Passing x by value (default)

```
x = 9
routine1(x)           ' Output: 9

Sub routine1(x)
  Print x
End
```

### Example 2: Passing x by reference (BYREF x)

```
x = 9
Print x              ' Output: 9
routine2(x)          ' Output: 9
Print x              ' Output: 10

Sub routine2(Byref x)
  Print x
  x = 10
End
```

### Example 3: Passing x by reference (@x)

```
x = 9
Print x              ' Output: 9
routine3(x)          ' Output: 9
Print x              ' Output: 10

Sub routine3(@x)
  Print x
  x = 10
End
```

### Example 4: Use the LOCAL keyword for local variables

```
x = 9
routine4(x)         ' Output: 9 
Print x             ' Output: 9

Sub routine4(y)
  Local x
  Print y
  x = 12            ' x is local, the global variable x will not be changed
End Sub
```

### Example 5: Nested sub procedures

```
x = 9
routine5(x)         ' Output: 100 (Passing 'x' by value to nested procedures)
Print x             ' Output: 9

Sub routine5(x)
  local x
  x = 100
  routine6(x)
  Sub routine6(x)
    Print x
  End Sub
End Sub
```


