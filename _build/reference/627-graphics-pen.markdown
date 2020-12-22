# PEN

> PEN (0..14)

Returns the PEN/MOUSE data.

Values:

- -----------------------------------------------------
0 True (non zero) if there is a new pen or mouse event
1 PEN: last pen down x; MOUSE: last mouse button down x
2 Same as 1 for y
3 True if the PEN is down; MOUSE: mouse left button is pressed
4 PEN: last/current x, MOUSE: the current x position only if the left mouse button is pressed (like PEN is down)
5 PEN(4) for y
- -----------------------------------------------------

Mouse specific:

-- --------------------
10 current mouse x pos
11 current mouse y pos
12 true if the left mouse button is pressed
13 true if the right mouse button is pressed
14 true if the middle mouse button is pressed
-- --------------------

PEN must be enabled prior to use of this function. Pen ON|OFF

~~~
Print "  Move and click the Pen or Mouse [press Esc to stop]..."
Print
Pen On
Print Using " ####x, ####y"; ' format for x,y position
While Inkey <> Chr(27) Do ' press Esc key to exit loop
  Locate 3, 0
  ? "Pen|Mouse new event:  "; Pen(0)
  ?
  ? "Pen last down|Mouse down:";: ? Usg; Pen(1), Pen(2)
  ?
  ? "Pen down|Mouse Left down:  "; Pen(3)
  ?
  ? "Pen last/current|Mouse Left down:";: ? Usg; Pen(4), Pen(5)
  ?
  ? "Mouse current:";: ? Usg; Pen(10), Pen(11)
  ?
  ? "Mouse Left,Middle,Right down: ", Pen(12), Pen(14), Pen(13);
Wend

~~~

DELAY say 20 ms saves CPU and battery in a loop like the above reply. It also helps after a mouse click to not over report the same click again and again.

~~~

rem game loop example
pen on
quit=0
x = pen(4)
y = pen(5)
repeat
  if pen(0) then
    rem mouse down - get click coordinates
    x = pen(1)
    y = pen(2)
    logprint "pointer down: x=" + x + " y=" + y
    rem process more events until mouse is released
    mouse_down = true
    while mouse_down
      n = pen(0)
      x_down = pen(4)
      y_down = pen(5)
      if (x_down != -1 && y_down != -1) then
        x = x_down
        y = y_down
        logprint "pointer moved [down]: x=" + x + " y=" + y
      else
        mouse_down = false
      end if
    wend
    logprint "pointer up: x=" + x + " y=" + y
  else
    if (x != pen(4) && x != pen(5)) then
      x = pen(4)
      y = pen(5)
      logprint "pointer moved [up]: x=" + x + " y=" + y
    else
      rem other system event, most likely a keypress
      k = inkey
      if (k > 0) then
        logprint "key event: k=" + k
        if (len(k)=1 and asc(k)=27) or k="q" then quit=1
      end if
    end if
  end if
until quit
pen off

~~~

