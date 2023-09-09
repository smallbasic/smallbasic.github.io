# PEN

> PEN ON|OFF

Enables/Disables the pen/mouse/tap mechanism. See function `n = PEN(value)` for information on how to read data from tap, mouse or pen.

### Example

```smallbasic
pen on

print "Press left mouse button or tab screen. Press q to quit."

while(1)          
    if(pen(3)) then
        PosX = pen(4)
        PosY = pen(5)
        locate 1,0: print "Click/tap at position: " + PosX + " , " + PosY
    endif
    
    k = inkey()
    if(len(k) == 1 AND k == "q") then end
    
    showpage
    delay(20)
wend

pen off
```


