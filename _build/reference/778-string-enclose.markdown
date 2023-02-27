# ENCLOSE

> ENCLOSE (str[, pair])

Encloses a string using the two characters in string `pair`. ENCLOSE defaults to double quotes if `pair` is not used.

### Example 1: Enclose brackets

```
print enclose("abc", "()")  ' output: (abc)
```

### Example 2: Enclose quotes using default setting

```
test=10
myStr="myStr"
print enclose(test)         ' output: "10"
print enclose(myStr)        ' output: "myStr"
```

### Example 2: Enclose letters

```
test = 10
print enclose(test, "aB")   ' output: a10B
```



