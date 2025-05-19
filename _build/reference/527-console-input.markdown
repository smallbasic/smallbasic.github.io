# INPUT

> INPUT [prompt,|;] var[, var [, ...]]

Reads text from keyboard and stores it in the variable `var`. The string `prompt` is printed on the screen. If `prompt` is followed by a `;`, a question mark and a space are printed additionally. If you want to input two or more variables, the input needs to be separated with `,`.

### Example 1: Using a single var

```
input "How old are you?", age
print age
```

### Example 2: Using multiple vars

```
input "Input three numbers: ", a, b, c   ' Input i.e. 1,2,3
print a, b, c
```



