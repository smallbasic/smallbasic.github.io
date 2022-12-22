# APPEND

> APPEND a, val [, val [, ...]]

Inserts the values at the end of the specified array.


* a - An array-variable.
* val - Any value or expression

```
a = [1,2,3]
print "Before APPEND: "; a

APPEND a, 4
print "After APPEND : "; a
```

Instead of APPEND the `<<` Operator can be used.

```
a = [1,2,3]
print "Before << operaror: "; a

a << 4
print "After << operator : "; a
```
