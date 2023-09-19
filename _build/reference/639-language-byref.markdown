# BYREF

> BYREF

Sub/func argument declaration. Changes to the variable will be passed back to the caller.  Equivalent syntax to the `@` character.

### Example

```
sub Increment(BYREF i)
  i = i + 1
end

x = 1
Increment(x)
print x         ' output: 2
```
