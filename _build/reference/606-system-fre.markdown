# FRE

> FRE (x)

Returns system memory information. eg, 0 = free memory. If a value is not supported by the operating system, `fre` will return 0. `fre()` without a parameter returns the free physical memory.

### Windows

| x   | Description                |
|:---:|----------------------------|
|  0  | free memory                |
| -1  | largest block of integers  |
| -2  | free stack                 |
| -3  | largest free block         |
| -12 | free memory same as 0      |

### LINUX and ANDROID

| x   | Description                    |
|:---:|--------------------------------|
|  0  | free memory                    |
| -10 | total physical memory          |
| -11 | used physical memory           |
| -12 | free physical memory same as 0 |

### Alternative for LINUX with kernel > 3.x and ANDROID

`fre` can be used to read the values of the file `/proc/meminfo`. In a console please type `cat /proc/meminfo`. Output should look similar to this (but more lines):

```
MemTotal:        3630512 kB
MemFree:          117204 kB
MemAvailable:     601308 kB
Buffers:           52680 kB
Cached:          1002608 kB
SwapCached:        58640 kB
Active:           857224 kB
Inactive:        1781244 kB
```

To querry with `fre` the value of the first line, use `fre(0)`, for second line `fre(1)`, and so on.

### Example

```
print "Free memory: "; fre()
print "Total RAM: "; fre(-10)
print "Used RAM: "; fre(-11)
print "Free RAM: "; fre(-12)
```




