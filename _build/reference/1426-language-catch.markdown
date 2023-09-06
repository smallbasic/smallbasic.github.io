# CATCH

> CATCH [var | expr]

The CATCH statement is used to catch a run-time error. This is typically used with errors raised when calling a file system command that cannot be completed, for example attempting to open a non-existent file.

The CATCH statement has two modes. You can supply a variable argument to store the error string. Alternatively you can supply an expression. When the raised error matches the (String) expression, the error will be caught. When using the expression mode, you can supply a succession of CATCH statements to handle various error messages separately. 

For more information see TRY.

### Example

```
try
    ' DON'T use existing file for demo.
    open "try demo.tmp" for input  as #1
catch err
    print err
    ' Some error handling could be implemented here
    ' i.e: if(err = "...") then ...
end try

print "This point is reach, even if opening the file was not possible"
```
