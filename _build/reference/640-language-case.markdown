# CASE

> CASE expr

Branch condition for a SELECT statement.

<pre>

' * See also IF...THEN...ELSE keywords.
' * Currently CASE is not supporting QB style expressions (e.g. CASE IS > 1).
 
x = 0 ' try using different values for x, such as 1, 2, "1", "ABC", etc
Select Case x
Case 0: Print "x = 0"
Case Len("a"): Print "x = 1"
Case 2, 3: Print "x = 2 or x = 3"
Case 4, 5, 6: Print "x >= 4 and x <= 6"
Case Else
  Print "Else: x = "; x
End Select

</pre>

