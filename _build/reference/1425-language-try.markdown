# TRY

> TRY

__TRY__

The TRY statement introduces a TRY/CATCH block.

__CATCH [var | expr]__

The CATCH statement is used to CATCH an run-time error. This is typically used with errors raised when calling a file system command that cannot be completed, for example attempting to open a non-existent file.

The CATCH statement has two modes. You can supply a variable argument to store the error string. Alternatively you can supply an expression. When the raised error matches the (String) expression, the error will be caught.

When using the expression mode, you can supply a succession of CATCH statements to handle various error messages separately.

__END TRY__

The END TRY statement marks the end of a TRY/CATCH block.


### Example 1: Opening a non-existing file for reading

```
try
    ' DON'T use existing file for demo.
    open "try demo.tmp" for input  as #1
catch err
    print err; " "
    ' Some error handling could be implemented here
    ' i.e: if(err = "...") then ...
end try

print "This point is reach, even if opening the file was not possible"
```

### Example 2: Advanced error handling for opening files

~~~

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
    Case Else: ? "opens(): Bad open mode at line " + Progline: Stop
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
~~~

### Example 3: Open COM-Port

```
try
  open "com2000:" AS #1
catch err
  ? "in catch: open failed";err
end try
```
