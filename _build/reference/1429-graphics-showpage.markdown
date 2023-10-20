# SHOWPAGE

> SHOWPAGE ([n])

This command is used to display pending graphics operations allowing for smooth animations. If SHOWPAGE is used, the internal SmallBASIC graphics update mechanism is set to manual mode. To enable automatic mode again, call SHOWPAGE with the optional parameter `n = 1`. This is useful, if the FORM command is used to display GUI elements. 

### Example

```
for x = 10 to 100
    cls
    rect x, 10, x + 200, 200 filled
    showpage
    delay(20)
next
```
