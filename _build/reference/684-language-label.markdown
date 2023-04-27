# LABEL

> LABEL LabelName

Defines a label with name `LabelName`. A label marks a position in the code. Use GOTO or GOSUB to continue program execution at that label. 

### Example

```
label FirstLine
    
ii++
print ii
if(ii == 10) then goto LastLine 
goto FirstLine

label LastLine
```



