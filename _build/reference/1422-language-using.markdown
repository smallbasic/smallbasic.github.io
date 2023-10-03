# USING

> PRINT USING

PRINT USING uses the FORMAT function to display numbers and strings.

See PRINT for more information. USG and USING are equivalent.

### Example

```
a = 1000
b = 2000
PRINT USING "#,###.##"; a                    
PRINT USING "#,###.## "; a; b                ' <- Format is applied to all variables         
PRINT USING "a = #####.00  b = #####"; a; b  ' <- One formated string with placeholders for two variables

' Output: 1,000.
' Output: 1,000. 2,000.             
' Output: a =  1000.00  b =  2000   
```


