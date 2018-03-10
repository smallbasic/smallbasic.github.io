### Language

> CATCH [var | expr]

The CATCH statement is used to CATCH an run-time error. This is typically used with errors raised when calling a file system command that cannot be completed, for example attempting to open a non-existent file. The CATCH statement has two modes. You can supply a variable argument to store the error string. Alternatively you can supply an expression. When the raised error matches the (String) expression, the error will be caught. When using the expression mode, you can supply a succession of CATCH statements to handle various error messages separately.



