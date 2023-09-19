# CASE

> CASE expr

Branch condition for a SELECT statement.

See SELECT for more information and examples.

### Example

```
x = 1                 ' Change to see what happens
select case x
    case 1
        print "x is 1"
    case 2,3,4
        print "x is 2,3 or 4"
    case else
        print "x is not 1, 2, 3 or 4"
end select
```



