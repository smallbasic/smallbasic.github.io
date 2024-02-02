# OPEN

> OPEN file [FOR {INPUT|OUTPUT|APPEND}] AS #fileN

Makes a file, device or network connection available for sequential input, sequential output.

* `file`  - A string expression that follows OS file naming conventions.
* `fileN` - A file-handle (integer 1 to 256).

### Open a file

`open "test.txt" for INPUT as #1`

| Expression | Description                                 |
|------------|---------------------------------------------|
| INPUT      | Sequential input (reading from file)        |
| OUTPUT     | Sequential output ( writing to file)        |
| APPEND     | Sequential output, beginning at current EOF |

If an existing file is opened for output, the file will be deleted and an empty file will be created.
The files are always opened as shared. You can use FREEFILE to get the next unused file-handle. Use PRINT,
INPUT, BGETC and BPUTC to read from or write to a file or device.

#### Open a COM port (RS232)

You can open a connection to a device using the serial port with `open "COMn:speed" AS #1`, where `n` is the number of the port
and `speed` is the baud rate. To open the first serial port with a baud rate of 19200 use: `open "COM1:19200" as #1`. In Windows
COM1 and in Linux /dev/ttys1 would be opened.

#### Open a TCP/IP socket

You can open a connection to a device using a TCP/IP socket with `open "SOCL:IP:PORT" AS #1`, where `IP` is a valid host name or IP address
and `port` is an open port.

`open "SOCL:192.168.178.76:8080" as #1`

If you omit the host name or IP address in the `SOCL:` string passed to the OPEN command, SmallBASIC will listen for connections from another host/process.

`open "SOCL:8080" as #1`

### Open an image

Use the prefix `HTTP:` with the `OPEN` command to open an image file over the network. You can then pass the file number to the `IMAGE` command. This returns an system object which can then be used to manipulate images in the graphical version of SmallBASIC.

`open "http://img2.wikia.nocookie.net/__cb20150113215904/farmville/images/9/92/Lumberjack_Gnome-icon.png" as #1`

### Open a HTTP connection

Use the prefix `HTTP:` with the `OPEN` command to open a network HTTP connection. You can then use the file number with the `TLOAD` command to read the data.

`open "http://api.duckduckgo.com/?q=Cars&format=json" as #1`

### Example 1: Open a file:

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

### Example 2: Open a socket for listening (server)

```
open "SOCL:10000" as #1     ' Open socket at port 10000

while (!eof(1))             ' Loop until connection is closed

    l = lof(1)              ' Querry how much data is in the queue

    if(l) then              ' if data is available
        s = INPUT(l, 1)     ' get all data
        print s
    endif

wend

close #1
```

### Example 3: Open a socket as client

```
open "SOCL:192.168.1.10:10000" as #1     ' Connect to server

print #1, "Hello world"                  ' Send string to server

close #1
```

### Example 4: Open a COM port (RS232)

```
open "COM1:19200" as #1    ' Open COM1  with 19200 bauds

while (!eof(1))             ' Loop until connection is closed

    l = lof(1)              ' Querry how much data is in the queue

    if(l) then              ' if data is available
        s = INPUT(l, 1)     ' get all data
        print s
    endif

wend

close #1
```

### Example 5: Open an image over network

```
' open some random image I found on the net
open "http://img2.wikia.nocookie.net/__cb20150113215904/farmville/images/9/92/Lumberjack_Gnome-icon.png" as #1

i = image(#1)
i.show(100,50)
```

### Example 6: Connect to an HTTP server

```
print "DuckDuckGo Search"
while 1
  print '<=== when cycle around need to isolate input prompt
  input "(Just enter quits) Term? ", queryTerm
  if trim(queryTerm)="" then ? "Cheers!":end  '<=== need a way out
  url = "http://api.duckduckgo.com/?q=" + trim(queryTerm) + "&format=json"
  open url as #1
  if (eof(1)) then
    throw "Connection failed: " + url
  fi

  dim results
  tload #1, results
  json = array(results)
  num_results = len(json.RelatedTopics)
  for i = 0 to num_results - 1
    if (isarray(json.RelatedTopics(i).topics)) then
      num_topics = len(json.RelatedTopics(i).Topics)
      for t = 0 to num_topics - 1
        print cat(1); "  "; json.RelatedTopics(i).Topics(t).FirstURL; cat(0)
        print "  "; json.RelatedTopics(i).Topics(t).text
      next t
    else
      print cat(1); "  "; json.RelatedTopics(i).FirstURL; cat(0)
      print "  "; json.RelatedTopics(i).Text
    endif
  next i
  Close #1  '<===== oh this helps!
wend
```
