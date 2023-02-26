# ENV

> ENV expr

Adds a variable to the current environment variable-table.

ENV can be used as SUB for setting and deleting Environment Variables and ENV can be used as a FUNCtion for returning a particular Environmet Variable or the whole set of them into an array.

### Example 1: Setting and getting Evironment Variables

```
SB1 = 5
SB2 = "My evironment variable"

'Set Environmet Variables
ENV("SB1=" + SB1)
ENV("SB2=" + SB2)
ENV("SB3=6")
ENV("SB4=\"test\"")

' Get Environment Variables
print ENV("SB1")
print ENV("SB2")
print ENV("SB3")
print ENV("SB4")
```

### Example 2: Querry all Environment Variables

```
AllEnv = ENV("")

for a in AllEnv
    print a
next
```

### Example 3: (Linux) Querry DESKTOP_SESSION

```
print ENV("DESKTOP_SESSION")    'i.e will print "plasma" if using KDE
```

### Example 4: Delete a Environment Variable (doesn't work in Linux)

```
ENV("SB1=")   ' Deletes SB1
```

### Example 5: Using ENV and CHAIN to create a eval-function

```
' Dedicated to MGA.
' s is any legal SmallBASIC Math Expression as String, e.g. "1 + 2 / 4"
Func eval(s)
  Chain "Env " + Enclose("SBEVAL=") + " + Str(" + s + ")"
  eval = Val(Env("SBEVAL"))
End Func

' now run few demos:
? eval("1+2") 
? eval("Rad(45) * 2") 
? eval("PI / 2 + PI")
? eval("0b1111 * Pow(2, 4)")
? eval("Sin(2) * Tan(4) / Cos(6)")
? eval("1 + 2 / 4")
? eval("6 * (Pow(2, 4) * 8)")
? eval("Rad((45 * 3) - 20) * 2")
```


### General suggestions using Environment Variables

1. Never use names which are already used by the system or another process, such as "PATH", "HOME", "PWD", etc.
   You should check which variable names are already in use.
2. Use short and unique names, such as: "SB1", SB2" or "SBv1", "SBv2", etc.
   It will keep the environment-variables-table readable, and will save space in the table.
3. Don't create more variables then you need. Reuse any variable which is not used.
   i.e. if "SB1" is unused anymore, then reuse it.
4. On some systems the environment-variables-table is unique for each session (Linux for example) and this may be a bit confusing.
5. Environment variables may or may not be case sensitive, i.e. "SB1" may be different then "sb1" on some systems (Linux for example).

