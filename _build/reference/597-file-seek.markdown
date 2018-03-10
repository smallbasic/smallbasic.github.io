### File

> SEEK #fileN; pos

Sets file position for the next read/write.

<pre>

Const FILE = "RANDOM.TMP"
Const RLEN = 50 ' record-length in bytes
' left justify string in buffer. s is string; l is buffer-length.
Def lset(s, l) = Left(s + Space(l), l)
' append records to demo file:
Open FILE For Output As #1
For record = 1 To 7
  Read s
  Print #1, lset(s, RLEN); ' end with ; to avoid new-line char
Next
Const TOTAL_RECORDS = Lof(1) / RLEN
Close #1
' 7 demo records:
Data "OPEN: Open file for sequential input/output."
Data "FREEFILE: Returns an unused file handle."
Data "SEEK: Sets file position for next read/write."
Data "EOF: True if file pointer is at end of file."
Data "LOF: Returns the length of file in bytes."
Data "CLOSE: Close a file."
Data "COPY: Copy file to a new file."
' retrieve and display demo records using SEEK:
Open FILE For Input As #1
Repeat
  Color 7, 0: Locate 1, 1
  Input "Enter record # (1.." + TOTAL_RECORDS + ") to retrieve: ", n
  
  If n >= 1 And n <= TOTAL_RECORDS Then
    Locate 3, 1: Print "Rec #"; n; ": "; 
    Seek #1, (n - 1) * RLEN ' seek to record position (base 0)
    Color 15, 3: Print Input(RLEN, 1);
  Endif
Until Isstring(n)
Close #1

</pre>

