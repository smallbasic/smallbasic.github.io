# USG

> PRINT USG

PRINT USG uses the FORMAT function to display numbers and strings.

See PRINT for more information. USG and USING are equivalent.

### Example

```
a = 1000
b = 2000
PRINT USG "#,###.##"; a                    
PRINT USG "#,###.## "; a; b                ' <- Format is applied to all variables         
PRINT USG "a = #####.00  b = #####"; a; b  ' <- One formated string with placeholders for two variables

' Output: 1,000.
' Output: 1,000. 2,000.             
' Output: a =  1000.00  b =  2000   
```




