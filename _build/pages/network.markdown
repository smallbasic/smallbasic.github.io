Network programming
===================

> Accessing the network in SmallBASIC

## HTTP

Use the prefix "HTTP:" with the OPEN command to open a network HTTP connection. You can then use the file number with the TLOAD command to read the data.

```smallbasic
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

## Image

Use the prefix "HTTP:" with the OPEN command to open an image file over the network. You can then pass the file number to the IMAGE command. This returns an system object which can then be used to manipulate images in the graphical version of SmallBASIC.

```smallbasic
' open some random image I found on the net
open "http://img2.wikia.nocookie.net/__cb20150113215904/farmville/images/9/92/Lumberjack_Gnome-icon.png" as #1

' the IMAGE function creates a 'system' object, this is stored in variable "i"
' the completed 'i' variable will then have three commands - SHOW, HIDE and SAVE
i = image(#1)

' SHOW takes 0, 2, 3 or 4 arguments [x,y [,zindex [, opacity]]]
i.show(100,50)

' printing 'i' will reveal all of its properties, these can be modified directly
' before calling show
print i
pause 2

i.show(20,20,1)
print i
pause 2

i.show(201,20,1, 56)
print i
pause 2

i.show(120,20,1, 56)
print i
pause 2

i.show(40,120,1,100)
print i

' you can create a second variable using the same image handle
' this allows you to manipulate the same image with a different set of properties
j = image(#1)
j.show(10,25,0,5)
pause true
```

## Sockets

Use the prefix "SOCL:" with the OPEN command to open a network socket. You can then use the file number with other input/output commands to interact with the connection.

```smallbasic
open "SOCL:192.168.178.76:8080" as #1
print #1, "time"
lineinput #1, s
print s 
close #1
```

If you omit the host name in the SOCL: string passed to the OPEN command, SmallBASIC will listen for connections from another host/process.

```smallbasic
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

## Web server

In addition to the graphical and command line versions of SmallBASIC, there is also a web server version based on [libmicrohttpd](https://www.gnu.org/software/libmicrohttpd).

You launch the web SmallBASIC in a folder containing one or more SmallBASIC programs, you then point your browser to a URL formulated from the listening port number and the SmallBASIC program name. For example:

```smallbasic
$ ls cats.bas  # program cats.bas exists in the current folder
$ sbasicw
Starting SmallBASIC web server on port:8080
```

In your Web Browser:

```smallbasic
http://localhost:8080/cats.bas
Output from cats.bas displayed in the web browser.

```

If the SmallBASIC program includes graphical output statements these are converted to HTML5 canvas operations. Only a snapshot of the output is displayed i.e., you would only see one frame of an animation in your web browser.


