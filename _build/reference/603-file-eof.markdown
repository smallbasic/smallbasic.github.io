# EOF

> EOF (fileN)

Returns true if the file pointer is at end of the file. For COMx and SOCL VFS returns true if the connection is broken.

### Example 1: Reading data from a file

```
' create a text file
open "MyDemoFile.txt" for output as #1

for i = 1 to 10
    print #1, i 
next

close #1

' open text file and print content line by line
open "MyDemoFile.txt" for input as #1

while(!eof(1))   ' eof works only without #
    input #1, c
    print c
wend

close #1
```

### Example 2: Reading from a TCP/IP socket

```
rem Print a date string like '29 SEP 2018 09:31:49 ACST'
func get_time
  local today = julian(date)
  local start = timer
  local t_hour, t_min, t_sec, t_str
  timehms start, t_hour, t_min, t_sec
  rem TODO, format should support multiple arguments
  t_str = format(" ##:", t_hour) + format("##:", t_min) + format("##", t_sec)
  return datefmt("dd mmm yyyy", today) + t_str
end

while 1
  open "SOCL:8080" as #1
  while (not eof(1))
    lineinput #1, s
    if (s == "time")
      print #1, get_time
    else
      print #1, "unknown command"
    endif
  wend
  close #1
wend
```
