# CHDIR

> CHDIR dir

Changes the current working directory to `dir`. In Windows `\` needs to be replaced by `\\`

See CWD to get the current working directory.

### Example 1: Linux

```
print cwd
chdir "/usr/bin"
print cwd
```

### Example 2: Windows

```
print cwd
chdir "C:\\"
print cwd
```
