# ENCLOSE

> ENCLOSE (str[, pair])

Encloses a string.

```
? enclose("abc", "()")
' Result: (abc)
```

ENCLOSE defaults to double quotes if the [pair] option is not used.

~~~

test=10
myStr="myStr"
? enclose(test)
? enclose(myStr)
pause

~~~


