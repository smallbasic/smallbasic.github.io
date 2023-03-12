# OPEN

> OPEN file [FOR {INPUT|OUTPUT|APPEND}] AS #fileN

Makes a file, device or network connection available for sequential input, sequential output.

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

With OPEN you can also open a network connection. Depending on the kind of connection the following file names can be used:

| Connection Type     | Example |
|---------------------|---------|
| URL                 | `open "http://api.duckduckgo.com/?q=Cars&format=json" as #1`
| Image               | `open "http://img2.wikia.nocookie.net/__cb20150113215904/farmville/images/9/92/Lumberjack_Gnome-icon.png" as #1` | 
| Socket              | `open "SOCL:192.168.178.76:8080" as #1` |
| Serial Port (RS232) | `open "COM1:19200" as # 1` |

More information with examples can be found in the article "Network programming".

You can open a connection to a device using the serial port with `open "COMn:speed" AS #1`, where n is the number of the port and speed is the baud rate. To open the first serial port with a baud rate of 19200 use: `open "COM1:19200" as #1`. In Windows COM1 and in Linux /dev/ttys1 would be opened.

Example to open a file:

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


