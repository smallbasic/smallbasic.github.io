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

a.world = "world"
a.foo = @hello
a.foo()
```

```

func SimpleClass(i)

  sub Increment(i)
    self.x = self.x + i
  end

  sub Decrement(i)
    self.x = self.x - i
  end

  func GetX()
    return self.x
  end

  local temp
  temp.x         = i
  temp.Increment = @Increment
  temp.Decrement = @Decrement
  temp.GetX      = @GetX

  return temp
end


A = SimpleClass(1)
print A.GetX()
A.Increment(5) : print A.GetX()
A.Decrement(4) : print A.GetX()
```
