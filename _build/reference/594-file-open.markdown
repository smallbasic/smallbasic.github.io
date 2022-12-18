# OPEN

> OPEN file [FOR {INPUT|OUTPUT|APPEND}] AS #fileN

Makes a file or device available for sequential input, sequential output.

* file - A string expression that follows OS file naming conventions.
* fileN - A file-handle (integer 1 to 256).

FOR

| Expression | Description                                 |
|------------|---------------------------------------------|
| INPUT      | Sequential input (reading from file)        |
| OUTPUT     | Sequential output ( writing to file)        |
| APPEND     | Sequential output, beginning at current EOF |

If an existing file is opened for output, the file will be deleted and an empty file will be created.
The files are always opened as shared. You can use FREEFILE to get the next unused file-handle. Use PRINT,
INPUT, BGETC and BPUTC to read from or write to a file or device. 

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
