**Summary**

TRY/CATCH is used to trap errors allowing a program to recover without having to be restarted.

**TRY**

The TRY statement introduces a TRY/CATCH __BLOCK.__

**CATCH [var | expr]**

The CATCH statement is used to CATCH an run-time error. This is typically used with errors raised when calling a file system command that cannot be completed, for example attempting to open a non-existent file.

The CATCH statement has two modes. You can supply a variable argument to store the error string. Alternatively you can supply an expression. When the raised error matches the (String) expression, the error will be caught.

When using the expression mode, you can supply a succession of CATCH statements to handle various error messages separately.

**END TRY**

The __END TRY__ statement marks the end of a TRY/CATCH block.

**THROW**

The THROW command (previously known as __RTE__) is used to initiate a catch-able error. If there is no surrounding TRY/CATCH block, THROW can be used to abort the program.
 
**Example**

@try@
@ open "com2000:" AS #1@
@catch err@
@  ? "in catch: open failed";err@
@end try@

**Try/Catch in other languages**

"C++":http://www.cplusplus.com/doc/tutorial/exceptions
"Javascript":https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Statements/try...catch
"Visual Basic":http://msdn.microsoft.com/en-AU/library/fk6t46tz.aspx

**History**

The TRY/CATCH mechanism was introduced in version 0.11.15.
