---
layout: post
title:  "EXIST"
categories: file
---
File

EXIST (file)

Returns true if file exists.

```

' Return nonexisting file or directory name (12 A..Z letters + extension)
' in the current directory; e.g. filename = tempfile("-me.tmp") 
Func tempfile(ext)
  Local i, f = Space(12) + ext
  Repeat
    For i = 1 To 12 
      f = Replace(f, i, Chr(floor((Rnd * 25.5) + 65)))
    Next
  Until Not Exist(f)
  tempfile = f
End Func
' demo:
filename = tempfile(".bak")
a << "This is a backup file: " + filename ' append one line
Tsave filename, a
Tload filename, b
? b
Pause
Kill filename ' delete demo file

```

