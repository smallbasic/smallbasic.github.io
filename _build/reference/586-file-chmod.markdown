# CHMOD

> CHMOD file, mode

Change permissions of a file. The string `file` holds the file name and follows OS file naming conventions. `mode` provides the file permission and must be compatible with system call chmod()'s 'mode' parameter.

See ACCESS to get information on file permissions.

## Linux

`mode` is a number best represented in octal: 0oUGO with U: User; G: Group; O: Other 

U, G and O are each defined the following way:

| Value | Permission  |
|:-----:|:-----------:|
| 0     | no          |
| 1 	  | x (execute) |
| 2 	  | w (write)   |
| 3 	  | w + x       |
| 4 	  | r (read)    |
| 5 	  | r + x       |
| 6 	  | r + w       |
| 7 	  | r + w + x   |

### Example

```
' Make myfile available to anyone (read/write)
CHMOD "myfile.bas", 0o666

' Make myfile available to anyone (execute/read/write)
CHMOD "myfile.bas", 0o777

' Make myfile available to user (read/write)
' All others only read
CHMOD "myfile.bas", 0o644
```

## Windows

in Windows the read-only flag can be set with `mode = 1` and unset with `mode = -1`

### Example

```
' Make myfile read-only
CHMOD "myfile.bas", 1

' Make myfile read and write
CHMOD "myfile.bas", -1
```
