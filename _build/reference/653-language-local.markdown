# LOCAL

> LOCAL var1 [, var2, ..., varn]

Declare local variables inside a SUB or FUNC. Local variables are independent of global variables of the same name.

If inside a sub or a function a local variable with the same name as an already existing global variabale is declared, the global variable can't be accessed inside that function or sub. Changing the local varibale will not change the global variable.

Local variables no longer exist once the SUB or FUNC has returned.

Use local variables insides subs or functions to make sure, that global variables with the same names are not accidentally changed.

### Example:

```
A = 1   ' global variable

print "Global variable before sub: A="; A
MySub()
print "Global variable after sub : A="; A

sub MySub()
    local A    ' Comment this line to see the effect of a local variable
    A = 2
    print "Local variable inside sub : A="; A
end
```



