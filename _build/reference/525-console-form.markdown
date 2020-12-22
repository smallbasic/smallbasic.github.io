# FORM

> FORM(map)

Creates a form object from a MAP variable. This provides access to the following sub-commands:

---------- -------------------------------
doEvents() Process system events for mouse and keyboard handling.
close()    Closes the active FORM.
refresh(n) n=1 Copy the UI state into the FORM input variables. n=0 Update the UI state using the FORM input variables.
---------- -------------------------------

The form MAP may contain the following properties

------ ---------------
value  The value from the active input field.
inputs Array of inputs.
focus  Index to the focused input.
------ ---------------

`Inputs` is an array of type MAP, each element may contain the following properties

--------------- ---------------
x               X coordinate.
y               Y coordinate.
width           Input width.
height          Input height.
value           The internal value associated with the input.
label           The display label for the input.
name            The name of the input.
type            The type of input, see below.
help            Listbox or single line text input help text.
backgroundColor Background color.
color           Forground color.
isExit          Whether clicking the input exits the current program.
isExternal      Whether the `link` field opens in an external browser.
resizable       Whether the field can be resized.
visible         Whether the input field is visible.
selectedIndex   The selected item in a listbox or choice.
length          Length of an TEXT input field.
noFocus         The input cannot receive focus.
onclick         SUB to invoke when clicked.
--------------- ---------------

The type attribute can be one of the following

------- --------------
button  Push button.
label   Display label.
link    Hyperlinked text.
listbox Listbox.
choice  Dropdown listbox.
text    Single or multi-line text input.
image   Image button.
------- --------------

Example
-------

```
f.handleKeys = 0
' create some buttons
button1.y = 120
button1.label = "Button1"
button1.value = "valudofButton1"
button1.backgroundcolor = rgb(255,0,0)
button1.onclick = HelloWorld 'this prints on load
button2.x = -1
button2.y = 120
button2.label = "Button2"
button2.value = "valueofButton2"
button3.value = "cats"
button3.x = -1
button3.y = 120
button3.background = 223344
b4.type = "choice"
b4.value = "cats|dogs|Fish|cats|dogs|Fish|cats|dogs|Fish|cats|dogs|Fish"
b4.selectedIndex = 2
b4.x = -1
b4.y = 120
b5.type = "list"
b5.value = "cats|dogs|Fish|cats|dogs|Fish|cats|dogs|Fish|cats|dogs|Fish|end|lol"
b5.x = -1
b5.y = 120
b5.height = 120
b6.type = "text"
b6.value = "cats"
b6.length=30
b6.x = -1
b6.y = 120
b6.width = 50
b6.noFocus = 0
' add buttons to the form
f.inputs << button1
f.inputs << button2
f.inputs << button3
f.inputs << b4
f.inputs << b5
f.inputs << b6
f.backgroundcolor = "green"
' at this stage 'f' is just a plain user defined structure (map)
' after calling FORM, 'f' becomes a system form object with three special functions
' doEvents, close and refresh (see sokoban.bas for refresh)
f = form(f)
' the string version of the form is JSON  (see https://en.wikipedia.org/wiki/JSON)
TSAVE "f.frm", f
while 1
  ' pump the system event queue
  f.doEvents()
  ' process the event
  in$ = inkey
  at 0,0
  if len(in$)>1 then
    flag= asc(left(in$,1))
    keychar =right(in$,1)
  n= asc(keychar)
    if (flag == 1)
      ? "Ctrl    : ";keychar ; "   "
    else if (flag == 2)
      ? "Alt    : "; keychar
    else if (flag == 3)
      ? "Ctrl+Alt: "; keychar ; "   "
    else
      ? "Arrow: "; n ; "   "
    end if
  else
    vkey = asc(in$)
    if (vkey == 8) then
      ? "backspace!"
    else if (vkey == 127) then
      ? "delete !"
    else
      ? " key=           "; in$; " "; vkey
    endif
endif
if b6.value <> "cats" then ? b6.value
  if (len(f.value) > 0) then
    print f.value; "                  "
  end if
wend
f.close()
func HelloWorld
? "hello world"
end
```
