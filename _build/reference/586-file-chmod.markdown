# CHMOD

> CHMOD file, mode

Change permissions of a file. See also ACCESS.

* file - A string expression that follows OS file naming conventions.
* mode - Compatible with system call chmod()'s 'mode' parameter.

Linux:

mode is a number best represented in octal: 0oUGO with U: User; G: Group; O: Other 

U, G and O are each defined the following way:

| Value | Permission  |
|:-----:|:-----------:|
| 0     | 	no        |
| 1 	  | x (execute) |
| 2 	  | w (write)   |
| 3 	  | w + x       |
| 4 	  | r (read)    |
| 5 	  | r + x       |
| 6 	  | r + w       |
| 7 	  | r + w + x   |


```
' Make myfile available to anyone (read/write)
CHMOD "myfile.bas", 0o666

' Make myfile available to anyone (execute/read/write)
CHMOD "myfile.bas", 0o777

' Make myfile available to user (read/write)
' All others only read
CHMOD "myfile.bas", 0o644
```

