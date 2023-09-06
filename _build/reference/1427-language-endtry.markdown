# END TRY

> END TRY

The END TRY statement marks the end of a TRY/CATCH block. For more information see TRY.

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
