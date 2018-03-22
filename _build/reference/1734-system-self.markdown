# SELF

> SELF

Pseudo class instance variable

The SELF variable works with MAP variables. You can assign a reference to a FUNC or SUB to a MAP variable. When you call the SUB or FUNC the SELF variable provides access to values from the enclosing MAP variable. This provides pseudo class/object functionality.

Note: 'MAP' is the name given to the dictionary/hashmap variable variant.

Example:

```
SUB hello
print "hello " + self.world
END
a.world="world"
a.foo=@hello
a.foo()
```

