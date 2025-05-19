# SELECT

> SELECT CASE expr

Perform multiple tests on the expression `expr`. Offers a more concise syntax to writing successive IF tests.
Once a case statement is fulfilled the select-case structure will be exited and all following case statements will not be tested anymore.

See also IF ... THEN ... ELIF ... ELSE ... FI structure.

### Example 1: Basic select-case expression

```
x = 12 ' Change value to see what happens
select case x
    case 12
        print "x is 12"
    case 13,14,15
        print "x is 13,14,or 15"
    case else
        print "x is not 12,13,14,15"        
end select
```

### Example 2: Exit of a select structure once a test was successful

```
x = 2
select case x
    case 2
        print "x is 2"
    case 2
        print "This will never be printed"
end select
```

### Example 3: Use IFF to check a range

```
x = 4 ' Change value to see what happens
select case x
    case iff(x <= 4, x, x + 1)
        print "x <= 4"
    case iff(x > 4 AND x < 12, x, x + 1)
        print "4 < x < 12"     
end select
```

### Example 4: Using functions

```
func even(x) 
    local r
    if(x mod 2 == 0 AND x != 0)
        r = x
    else
        r = x + 1
    endif
    return r
end

func uneven(x) 
    local r
    if(x mod 2 != 0)
        r = x
    else
        r = x + 1
    endif
    return r
end

x = 2 ' Change value to see what happens
select case x
    case even(x)
        print "x is even"
    case uneven(x)
        print "x is uneven"
    case else
        print "x is 0"
end select
```




