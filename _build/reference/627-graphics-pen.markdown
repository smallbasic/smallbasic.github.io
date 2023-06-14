# PEN

> n = PEN (value)

Returns pen, mouse or tap data depending on `value`.

| Value | Desription
|:-----:|:-----------------------------------------------------|
|0      | True (non zero) if there is a new pen or mouse event |
|1      | x position of last pen down, tap, mouse button down  |
|2      | y position of last pen down, tap, mouse button down  |
|3      | True if pen is down, mouse left button is pressed or tap |
|4      | Pen, tap: last/current x position, MOUSE: the current x position only if the left mouse button is pressed |
|5      | Pen, tap: last/current y position, MOUSE: the current x position only if the left mouse button is pressed |
|10     | current mouse x pos                                  |
|11     | current mouse y pos                                  |
|12     | true if the left mouse button is pressed             |
|13     | true if the right mouse button is pressed            |
|14     | true if the middle mouse button is pressed           |


PEN must be enabled prior to use of this function with `Pen ON|OFF`

### Example 1: Overview

```
Print "  Move and click the Pen or Mouse [press Esc to stop]..."
Print
Pen On
Print Using " ####x, ####y";              ' Format for x,y position
While Inkey <> Chr(27) Do                 ' Press Esc key to exit loop
  Locate 3, 0
  print "Pen|Mouse new event:  "; Pen(0)
  print
  print "Pen last down|Mouse down:";: ? Usg; Pen(1), Pen(2)
  print
  print "Pen down|Mouse Left down:  "; Pen(3)
  print
  print "Pen last/current|Mouse Left down:";: ? Usg; Pen(4), Pen(5)
  print
  print "Mouse current:";: ? Usg; Pen(10), Pen(11)
  print
  print "Mouse Left, Middle, Right down: ", Pen(12), Pen(14), Pen(13);
Wend
```

### Example 2: Get position of tap or mouse click

```
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
```

DELAY 20 ms saves CPU and battery in a loop.

### Example 3: Press a button

```
pen on

print "Press left mouse button or tab screen. Press q to quit."

button.x = 100
button.y = 100
button.w = 100
button.h = 100

while(1)

    rect button.x, button.y STEP button.w, button.h color 6 filled
          
    if(pen(3)) then
        PosX = pen(4)
        PosY = pen(5)
        
        if( (PosX > button.x) and (PosX < button.x + button.w) and (PosY > button.y) and (PosY < button.y + button.h) )
            rect button.x, button.y STEP button.w, button.h color 12 filled 
        endif
        
    endif
    
    k = inkey()
    if(len(k) == 1 AND k == "q") then end
    
    showpage
    delay(20)
wend
```

