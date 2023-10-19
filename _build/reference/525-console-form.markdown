# FORM

> f = FORM(formMap)

Creates a form object `f` from a MAP variable `formMap`. Form object `f` gives access to the following GUI elements:

- Push button
- Label
- Hyperlinked text
- Listbox
- Dropdown listbox
- Single or multi-line text input
- Image button

In listboxes and dropdown listboxes press and hold mouse button to scroll through the items. Alternatively arrow keys can be used. Press return or space for selecting the highlighted item.

### The form object

`f = form(formMAP)` provides access to the following sub-commands of the form object `f`:

| Sub-command | Description                   |
|-------------|-------------------------------|
| doEvents()  | Process system events for mouse and keyboard handling.
| close()     | Closes the active FORM.
| refresh(n)  | `n = 1` copy the UI state into the FORM input variables `f.inputs`. `n = 0` update the UI state using the FORM input variables `f.inputs`.

The form object `f` may contain the following properties:

| Property   | Description   |
|------------|---------------|
| value      | The value from the active input field.
| **inputs** | Array of inputs.
| focus      | Index to the focused input.

### Defining the input fields

`inputs` is an array of type MAP, each element may contain the following attributes:

| Attribute       | Description
|-----------------|---------------
| x               | X coordinate.
| y               | Y coordinate.
| width           | Width.
| height          | Height.
| value           | The internal value associated with the input.
| label           | The display label for the input.
| name            | The name of the input.
| **type**        | The type of input, see below.
| help            | Listbox or single line text input help text.
| backgroundColor | Background color.
| color           | Forground color.
| isExit          | Whether clicking the input exits the current program.
| isExternal      | Whether the `link` field opens in an external browser.
| resizable       | Whether the field can be resized.
| visible         | Whether the input field is visible.
| selectedIndex   | The selected item in a listbox or choice.
| length          | Length of a TEXT input field in number of characters.
| noFocus         | The input cannot receive focus.
| onclick         | SUB to invoke when clicked.

The type attribute can be one of the following:

| Type      | Description
|-----------| --------------
| "button"  | Push button.
| "label"   | Display label.
| "link"    | Hyperlinked text.
| "listbox" | Listbox.
| "choice"  | Dropdown listbox.
| "text"    | Single or multi-line text input.
| "image"   | Image button.

### Change or read the GUI elements

Once the GUI elements are rendered on screen they can be changed for exapmle to respond to user input. By calling `f.refresh(1)` the current state of the GUI elements will be copied to the `f`. The content of `f` is rendered to screen, when calling `f.refresh(0)`. `f.inputs` is an array of MAP variables. The first element of that array is the first GUI element added to `formMap.inputs`. For example the color of the first element should be changed:

```
f.inputs[0].color = 12
f.refresh(0)
```

To get a list of all available elements of the n-th GUI element, you can simply use `print f.inputs[n]`.

### Example 1: Creating a push button using callback function

```
button.type = "button"
button.x = 120
button.y = 120
button.label = "Button"
button.backgroundcolor = rgb(60, 60, 60)
button.onclick = @ButtonClicked     ' Callback function, definition see below

formMAP.inputs << button

f = form(formMAP)

while 1
  f.doEvents()
wend

f.close()

sub ButtonClicked()
  at 0,0
  Clicked++
  print "Button clicked " + Clicked + " times"
end
```

### Example 2: Creating a push button using doEvents result

```
button.type = "button"
button.x = 120
button.y = 120
button.label = "Button"
button.backgroundcolor = rgb(60, 60, 60)
button.value = 1  ' unique value to identify the button

formMAP.inputs << button

f = form(formMAP)

while 1
  f.doEvents()
  if(f.value == 1) then
    ii++
    at 0,0
    print "Button cklicked " + ii + " times."
  endif 
wend

f.close()
```

### Example 3: Creating a label

```
l.type = "label"
l.x = 120
l.y = 120
l.label = "Label"
l.color = rgb(255, 60, 60)

f.inputs << l

f = form(f)

while 1
  f.doEvents()
wend

f.close()
```

### Example 4: Creating a link to an external website

```
l.type = "link"
l.x = 120
l.y = 120
l.label = "Link to SmallBASIC website"
l.value = "https://smallbasic.github.io"
l.isExternal = true
l.color = rgb(100, 100, 255)

f.inputs << l

f = form(f)

while 1
  f.doEvents()
wend

f.close()
```

### Example 5: Creating a listbox

```
l.type = "listbox"
l.x = 120
l.y = 120
l.height = 200
l.width = 100
l.value = "cats|dogs|fish|birds|insects"
' alternative way is to pass an array:
' l.value = ["cats", "dogs", "fish", "birds", "insects"]
l.color = rgb(255, 255, 255)
l.backgroundColor = rgb(100, 100, 100)

f.inputs << l

f = form(f)

while 1
  f.doEvents()
  
  ' Check for value of the active input field
  if (len(f.value) > 0) then
    at 0,0
    print f.value; "                  "
  end if  
wend

f.close()
```

### Example 6: Creating a dropdown listbox

```
l.type = "choice"
l.x = 120
l.y = 120
l.width = 100
l.value = "cats|dogs|fish|birds|insects"
' alternative way is to pass an array:
' l.value = ["cats", "dogs", "fish", "birds", "insects"]
l.color = rgb(255, 255, 255)
l.backgroundColor = rgb(100, 100, 100)

f.inputs << l

f = form(f)

while 1
  f.doEvents()
  
  ' Check for value of the active input field
  if (len(f.value) > 0) then
    at 0,0
    print f.value; "                  "
  end if  
wend

f.close()
```

### Example 7: Creating a text input field

```
t.type = "text"
t.x = 120
t.y = 120
t.width = 300
t.value = "Add more text"
' t.height = 100  ' if hight is not defined, single line field
t.color = rgb(255, 255, 255)
t.backgroundColor = rgb(100, 100, 100)
t.length = 50 ' number of characters

' create additionally an OK-Button to update the form object
' otherwise the text field blocks loop
b.type = "button"
b.x = 120 + t.width + 10
b.y = 120 
b.label = "OK"
b.backgroundcolor = rgb(60, 60, 60)
b.onclick = @OKButtonClicked
f.inputs << t
f.inputs << b

f = form(f)

while 1
  f.doEvents()  
wend

f.close()

sub OKButtonClicked()
   f.refresh(1)              ' Update the form object
   at 0,0
   print f.inputs[0].value   ' Text field is the first element added to the formMAP
end
```

### Example 8: Image button using callback function

In this example a callback function will be used. If you want to use the doEvents result instead,
have a look at example 2.

```
' Create a simple button and save it as png
' If you have already an image for you button,
' this part is not necessary.
circle 100,100,100 color 15 filled
ButtonImage = image(0,0,200,200)
ButtonImage.save("button.png")
cls
 
' Define image button
button.type = "image"
button.name = "button.png"
button.x = 120
button.y = 120
button.onclick = @ButtonClicked     ' Callback function, definition see below.
 
formMAP.inputs << button
 
f = form(formMAP)
 
while 1
  f.doEvents()
wend
 
f.close()
 
sub ButtonClicked()
  at 0,0
  Clicked++
  print "Button clicked " + Clicked + " times"
end
```

### Example 9: One more example

```
f.handleKeys = 0
' create some buttons
button1.y = 120
button1.label = "Button1"
button1.value = "valueofButton1"
button1.backgroundcolor = rgb(255,0,0)
button1.onclick = @HelloWorld 'this prints on load
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
