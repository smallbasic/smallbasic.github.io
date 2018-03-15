# TRY

> TRY

The TRY statement introduces a TRY/CATCH BLOCK



Note:
If this demo program crashes... then run it again. It seems that TRY / CATCH block might be unstable within a function or sub... (?)
<pre>

' See also: Home -- Articles -- TRY / CATCH
Const FILE_NAME = "try demo.tmp" ' -- DON'T use existing file for demo.
' OPEN file or device safely:
Func opens(filename, mode)
  Local fn = Freefile
  Try
    Select Case Lcase(mode)
    Case "input" : Open filename For Input  As #fn
    Case "output": Open filename For Output As #fn
    Case "append": Open filename For Append As #fn
    Case Else: ? "opens(): Bad open mode at line " + Progline: Pause: Stop
    End Select
    opens = fn ' file opened, return file-handle (integer 1 to 256)
  Catch err
    ? err; " ";
    opens = 0  ' cannot open file, return 0 (FALSE)
  End Try
End Func

' helper for demo:
Func demo(demo_number, open_mode)
  Local fn
  Color 14
  ?: ? Using " Demo #: "; demo_number;
  Color 7
  fn = opens(FILE_NAME, open_mode) ' Open file safely
  If fn Then ? "File-handle is: "; fn; " ";
  demo = fn ' return file-handle or 0 if error.
End Func

Kill FILE_NAME ' delete file before demo
fn = demo(1, "INPUT")
If fn Then Close #fn
fn = demo(2, "OUTPUT")
If fn Then
  ? #fn, "Demo 2 Works!"
  Close #fn
Fi
fn = demo(3, "APPEND")
If fn Then
  ? #fn, "Demo 3 Works!"
  Close #fn
Fi
fn = demo(4, "APPEND")
If fn Then
  lines = ["Demo 4 Works!"]
  Tsave #fn, lines
  Close #fn
Fi
fn = demo(5, "INPUT")
If fn Then
  Tload #fn, lines
  ? lines;
  Close #fn
Fi
fn = demo(6, "INPUTX")
If fn Then
  Tload #fn, lines
  ? lines;
  Close #fn
Fi
Pause

</pre>

