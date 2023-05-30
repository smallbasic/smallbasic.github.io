# LOF

> l = LOF (fileN)

Returns the length `l` of a file with the file handle `fileN` in bytes. For other devices, returns the number of available data.

### Example 1: Length of a file

```
' create a text file
open "MyDemoFile.txt" for output as #1

for i = 1 to 10
    bputc #1, i 
next

close #1

' open text file and print content byte by byte
open "MyDemoFile.txt" for input as #1

FileLength = LOF(1)       ' lof works only without #

for ii = 1 to  FileLength 
    c = bgetc(1)
    print c
next

close #1
```

### Example 2: Get available data for a socket connection

```
open "SOCL:10000" as #1     ' Open socket at port 10000

while (eof(1))              ' Loop until connection is closed

    l = lof(1)              ' Querry how much data is in the queue
    if(l) then              ' if data is available
        s = INPUT(l, #1)    ' get all data
        print s
    endif

wend

close #1
```


