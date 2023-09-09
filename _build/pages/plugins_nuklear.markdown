# Nuklear - Create your own graphical user interface

## About the SmallBASIC Nuklear plugin

Nuklear is a graphical user interface toolkit written in C and licensed under public domain. It was designed as a simple embeddable user interface for application. The SmallBASIC Nuklear plugin provides bindings to the Nuklear library. More information about Nuklear can be found at Github [Nuklear](https://github.com/Immediate-Mode-UI/Nuklear)

The Nuklear plugin is part of the release of SmallBASIC for Windows and Linux.

## Using the plugin

The Nuklear plugin can be used by importing it with `import nuklear`. Because Nuklear creates a OpenGL window, it is not compatible with the SDL or FTKL version of SmallBASIC. Instead it should be started using the console version of SmallBASIC.

In Linux call:

```sbasic NuklearTest.bas```.

or if you are using the AppImage:

```SmallBASIC-Console_12.24-x86_64.AppImage NuklearTest.bas```

If you are working in Windows, then start your program with:

```sbasic.exe NuklearTest.bas```

## Creating a window

The following code shows how to create your first "Hello World" window.

```smallbasic
option predef grmode 640x480    ' Set window size

import nuklear as nk            ' Import Nuklear plugin

while 1
	if nk.windowBegin("Hello World", 0, 0, "100%", "100%") then     ' Create window
		' Render GUI elements and do other useful thinks
	endif
	nk.windowEnd()              ' Free window
	nk.waitEvents()             ' Pause until event
wend
```

With `nk.windowBegin()` a window will be created, if not already present. Additionally the window content will be clear. After successfully calling this function, all the GUI elements can be placed and the responses to user input can be performed. Once `nk.windowEnd()` is called, all the elements get rendered. `nk.waitEvents()` is used to pause the program until an event occurs. Without `nk.waitEvents()` the next iteration of the while-loop would immediately start.

## Placing a button

```smallbasic
option predef grmode 640x480

import nuklear as nk

ClickCounter = 0

while 1
    if nk.windowBegin("Button", 0, 0, "100%", "100%") then

        nk.layoutRow("dynamic", 30, 1)
        if nk.button("You clicked me " + ClickCounter + " times") then
           ClickCounter++
        endif

    endif
    nk.windowEnd()
    nk.waitEvents()
wend
```

Before you can add a button, you have to define a layout which can hold the GUI elements. This is done with `nk.layoutRow("dynamic", 30, 1)`. In this case, a row layout is created.  The width of every row is adapted dynamically to the size of your window, the height is 30px and one element can be placed per row. The button is created with `nk.button()`. If the button is clicked, the if-statement will be entered. Place all the code inside the if-statement or call a sub-routine which deals with a pressed button.

## Displaying two radio buttons

```smallbasic
option predef grmode 640x480

import nuklear as nk

radio = {value: "A"}

while 1
	if nk.windowBegin("Radio Buttons", 0, 0, "100%", "100%") then

		nk.layoutRow("dynamic", 90, 2)
        nk.radio("Radio Button A", radio)
		nk.radio("Radio Button B", radio)

		if(radio.value = "A") then
			' Do something useful
		endif

	endif
	nk.windowEnd()
	nk.waitEvents()
wend
```
The current value of the radio buttons will be stored in _radio.value_. The initial value of _radio.value_ is "A" setting "Radio Button A" active. The if-statement will be entered, when "Radio Button A" is selected.

Because `nk.layoutRow("dynamic", 90, 2)` is this time set to "2" two elements are placed in one row. You can try and set it to "1". You will see, that then one radio button per line is displayed.

## Dynamic rows vs. static rows

```smallbasic
option predef grmode 640x480

import nuklear as nk

radio = {value: "A"}

while 1
    if nk.windowBegin("Radio Buttons", 0, 0, "100%", "100%") then

        nk.layoutRow("static",  90, 310, 2)   ' fix sized elements
        nk.radio("Radio Button A", radio)
        nk.radio("Radio Button B", radio)

        nk.layoutRow("dynamic", 90, 2)        ' dynamic sized elements
        nk.radio("Radio Button C", radio)
        nk.radio("Radio Button D", radio)

        if(radio.value = "A") then
            ' Do something useful
        endif

    endif
    nk.windowEnd()
    nk.waitEvents()
wend
```

This example is similar to the previous one. But now four radio buttons, two in one line, are displayed. The first two buttons A and B are arrange with the row layout "static". The row has a height of 90px and a fixed width of 310px. Radio button A and B will each have a fixed width of 155px. Buttons C and D are arranged using "dynamic" row layout. The row spans the width of the window at a height of 90px. Button C and D have a width of 50% each.

If you run this example and change the size of the window with the mouse, you can see, how the width of the two rows change.


## Show input boxes with labels - More flexible row layout

```smallbasic
option predef grmode 640x480

import nuklear as nk

FirstName = {value: ""}
Surname  = {value: ""}

while 1
    if nk.windowBegin("Input box with labels", 0, 0, "100%", "100%") then

        nk.layoutRowBegin("static", 25, 2)  ' Static row -> fixed width
            nk.LayoutRowPush(92)            ' Next element will have a width of 92px
            nk.label("First Name:")
            nk.LayoutRowPush(371)           ' Next element will have a width of 371px
            nk.edit("field", FirstName)
        nk.layoutRowEnd()

        nk.layoutRowBegin("dynamic", 25, 2) ' Dynamic row -> width depends on window size
            nk.LayoutRowPush(0.15)          ' Next element will have a width of 15%
            nk.label("Surname:")
            nk.LayoutRowPush(0.60)          ' Next element will have a width of 85%
            nk.edit("field", Surname)
        nk.layoutRowEnd()

    endif
    nk.windowEnd()
    nk.waitEvents()
wend
```

A label is created in Nuklear with `nk.label("MyLabel")` and a input box with the command `nk.edit("field", EditFieldValue)`. The string of the input box is stored in _EditFieldValue.value_.

In the example above the width of each element was defined in two different ways. With `nk.layoutRowBegin("static", 25, 2)` two elements per row will be placed. The width of each element is defined in pixel by the command `nk.LayoutRowPush(pixels)`. With `nk.layoutRowBegin("dynamic", 25, 2)` two elements per row will be placed. The width of each element is defined in percent by the command `nk.LayoutRowPush(percent)`, i.e. 0.15 means 15%. When you run the above example and change the size of the window with the mouse, you will see, that the width of the elements in the first line stays always the same, and in the second line the width is adapted to the width of the window.

When using `nk.layoutRowBegin(...)` the end of the definition for a row has to be marked by `nk.layoutRowEnd()`.

## Display a menu

Caution: `menuItem()` is not yet working probably. This will be fixed with the next release.

```smallbasic
option predef grmode 640x480

import nuklear as nk

while 1
	if nk.windowBegin("Menu", 0, 0, "100%", "100%") then

		nk.menubarBegin()
            nk.layoutRow("dynamic", 20, 1)
            if nk.menuBegin("Menu", nil, 100, 80) then
                nk.layoutRow("dynamic", 20, 1)
                if(nk.menuItem("Item A")) then
                    ' Menu item clicked - do something
                endif
                if(nk.menuItem("Item B")) then
                    ' Menu item clicked - do something
                endif
                if(nk.menuItem("Item C")) then
                    ' Menu item clicked - do something
                endif
                nk.menuEnd()
            endif
        nk.menubarEnd()

	endif
	nk.windowEnd()
	nk.waitEvents()
wend
```
The example above will display a menu with one entry called "Menu". When clicked, a sub menu is displayed with the entries "Item A", "Item B", "Item C". The if-statements will be executed, when the corresponding entry was clicked by the user.

### Draw basic shapes

```smallbasic
option predef grmode 640x480

import nuklear as nk

color rgb(128,54,0), 1

while 1
    if nk.windowBegin("Draw Example", 2, 2, "100%", "100%") then
        [x, y, w, h] = nk.windowGetBounds()
        nk.line(x + 10, y + 40, x + 50, y + 40, x + 50, y + 80)
        nk.curve(x + 50, y + 80, x + 80, y + 40, x + 100, y + 80, x + 80, y + 80)
        nk.polygon("line", x + 100, y + 150, x + 60, y + 140, x + 70, y + 70)
        nk.circle("line", x + 130, y + 140, 50)
        nk.ellipse("fill", x + 30, y + 150, 20, 40)
        nk.arc("fill", x + 150, y + 80, 40, 3 * PI / 2, 2 * PI)
        nk.rectMultiColor(x + 95, y + 50, 50, 50, "#ff0000", "#00ff00", "#0000ff", "#000000")
        nk.text("DRAW TEXT", x + 15, y + 75, 100, 100)
    endif
    nk.windowEnd()
    nk.waitEvents()
wend
```



## Reference of supported commands

### BUTTON

> Button({Title | Color})

Title (String): Title of the button  
Color (String): Color of the button, i.e. "#ff0000"  

Creates a button with a title or filled with a color. Function returns _True_ or _False_ depending if the button was clicked.

### ARC

> ARC(x, y, r, start, end)

x,y: Position of center of the arc  
start, end: Start and end angle of the arc  

Draws an arc. _start_ and _end_ are first and last angle in radians.

### CHECKBOX

> Checkbox(Name, checkboxValue)

Name (String): Name of the checkbox  
checkboxValue: actual value of the checkbox  

Creates a checkbox with the name _Name_. State of the checkbox is stored in _checkboxValue_.

```smallbasic
checkA = {value: false}
...
nk.Checkbox("Checkbox A", checkA)

if(checkA.value = true) then
    ' Do something
endif
```

### CIRCLE

> Circle(x, y, r)

x,y: Position of the circle in pixel  
r: radius of the circle in pixel  

Draws a circle. See example "Draw basic shapes".

### COLORPICKER

> Colorpicker(color)

color: color of the colorpicker  

Creates a colorpicker. The color picked by the user is stored in color.value as a string.

```smallbasic
colorPicker = {value: "#ff0000"}
...
nk.colorPicker(colorPicker)

```

### COMBOBOX

> combobox(comboValue)

comboValue (map): settings of combobox  

Creates a combobox. The number of the selected combobox is stored in _comboValue.value_.

```smallbasic
comboA = {value: 1, items: ["A", "B", "C"]}
nk.combobox(comboA)
```

### CONTEXTUALBEGIN

> contextualBegin(sizeX, sizeY, triggerX, triggerY, triggerW, triggerH)

sizeX, sizeY: Size of the menu  
triggerX, triggerY, triggerW, triggerH: Trigger area in pixel  

Creates an contextual menu. Right-click in the trigger area will open a menu.

```smallbasic
[x, y, w, h] = nk.widgetBounds()
if nk.contextualBegin(100, 100, x, y, w, h) then
    nk.layoutRow("dynamic", 30, 1)
    nk.contextualItem("Item A")
    nk.contextualItem("Item B")
    nk.contextualEnd()
endif
```

### CONTEXTUALEND

> contextualEnd()

Ends the definition of a contextual menu. See `contextualBegin()`.

### CONTEXTUALITEM

> contextualItem(Name)

Name (String): Name of the item

Adds an item to a contextual menu. See `contextualBegin()`.

### CURVE

> curve(ax, ay, ctrl0x, ctrl0y, ctrl1x, ctrl1y, bx, by)

Draws a curve. See "Draw basic shapes".

### EDIT

> edit(Style, editValue)

Style (String): "simple", "field", "editor", "box"  
editValue: Stores the actual text  

Creates an input box. The content of the input box is stored in _editValue.value_.

```smallbasic
editA = {value: ""}
...
nk.edit("field", editA)
```

### ELLIPSE

> ellipse(DrawMode, x, y, rx, ry)

DrawMode: 0 = line, 1 = solid  
x,y: Position in pixel  
rx, ry: radii in pixel  

Draws an ellipse. See "Draw basic shapes".

### GROUPBEGIN

> groupBegin(Name, Style)

Name (String): Name of the goup  
Style (String): "", "border"  

Groups several elements. The group can be surrounded by a border.

```smallbasic
nk.groupBegin("Group 1", "border")
    nk.layoutRow("dynamic", 30, 1)
    nk.label("Radio buttons:")
    nk.layoutRow("dynamic", 30, 3)
    nk.radio("A", radio)
    nk.radio("B", radio)
    nk.radio("C", radio)
    nk.layoutRow("dynamic", 30, 1)
    nk.selectable("Selectable A", selectA)
    nk.selectable("Selectable B", selectB)
nk.groupEnd()

```

### GROUPEND

> groupEnd()

Ends the definition of a group. See `groupBegin()`.

### LABEL

> label(Name [, align, color, "wrap"])

name (string): name of the label  
align (string): "centered", "right", "left"  
color (string): hex color, i.e "#ff0000"  

Creates a label.

```smallbasic
nk.label("Left label")
nk.label("Centered label", "centered")
nk.label("Right label", "right")
nk.label("Colored label", "left", "#ff0000")
nk.label("A very long wrapped label - The quick brown fox jumps over the ...", "right", "wrap")
```

### LAYOUTROW

> layoutRow("dynamic", height, numberOfElements)

> layoutRow("static",  height, width, numberOfElements)

height: height of the element in pixel  
numberOfElements: number of elements in a row  
width: width of an element in pixel  

Creates a dynamic or static row. See "Dynamic rows vs. static rows"

### LAYOUTROWPUSH

> layoutRowPush(width)

width: width of the element in pixel  

Next element will have the width _width_. Use in combination with `layoutRowBegin()`. If row layout is "static", then _width_ is in pixel. If row layout is "dynamic" _width_ is in percent, i.e. 0.15 means 15%. See "Show input boxes with labels - More flexible row layout".

### LAYOUTROWBEGIN

> layoutRowBegin({"static" | "dynamic"}, height, numberOfElements)

height: height of the element in pixel  
numberOfElements: number of elements in a row  

Starts a layout section were several elements per row can have different width. Use  in combination with `layoutRowPush()`. See "Show input boxes with labels - More flexible row layout".

### LAYOUTROWEND

> layoutRowEnd()

Ends a layout section which was started with `layoutRowBegin()`. See "Show input boxes with labels - More flexible row layout".

### LINE

> line(x1, y1, x2, y2 [, ... , x40, y40])

x,y: coordinate pairs of the line segments.  

Draws a polyline. See "Draw basic shapes".

### MENUBARBEGIN

> menuBarBegin()

Starts the definition of a menu. See example "Display a menu".

### MENUBAREND

> menuBarEnd()

Ends the definition of a menu. See example "Display a menu".

### MENUBEGIN

> clicked = menuBegin(entry, nil, height, width)

entry (String): name of the menu-entry  
height: height of the submenu in pixel  
width: width of the submenu in pixel  
nil: unused at the moment, set alway to nil  
clicked: returns true if item was clicked, otherwise false  

Insert a menu entry. See example "Display a menu".

### MENUEND

> menuEnd()

Ends a menu entry. See example "Display a menu".

### MENUITEM

> clicked = menuItem(name)

name (String): Name of a submenu item  
clicked: returns true if item was clicked, otherwise false  

Creates a submenu entry. See example "Display a menu".

### POLYGON

> polygon(drawMode, x, y [x2, y2, ..., x40, y40])

drawMode:  0 = line, 1 = solid  
x,y: coordinate pairs of the line segments  

Draws a polygon. See example "Drawing basic shapes"

### PROGRESS

> progress(progressValue, maxValue [, modifiable])

progressValue: the actual progress value  
maxValue: Maximum progress value  
modifiable: true or false (default: false)  

Displays a progress bar. The length of the bar is given by _progressValue.value_. Set _modifiable_ to true, if you want to use the progress bar as a slider to change the value.

```smallbasic
progress.value = 5
...
nk.progress(progress, 10, false)
```
### PROPERTY

> property(name, minValue, propertyValue, maxValue, stepSizeByClick, stepSizeByMoving)

name (String): Name of the input box  
minValue: Minimum value  
propertyValue: Value for storing the actual value  
maxValue: Maximum value  
stepSizeByClick: Stepsize when clicked with the mouse  
stepSizeByMoving: Stepsize when click + hold + moving the mouse  

Displays an input box for numbers. The actual value is stored in _propertyValue.value_.

```smallbasic
property = {value: 6}
...
nk.property("Property", 1, property, 10, 0.25, 0.5)
```

### RADIO

> radio(Name, radioValue)

Name (String): Name of the radio button  
radioValue: actual value of the radio button  

Displays a radio button. The value is stored in _radioValue.value. See example "Displaying two radio buttons"

### RECTMULTICOLOR

> rectMultiColor(x, y, width, height, color1, color2, color3, color4)

x,y: Position of the rectangle in pixel  
width, height: Width and height in pixel  
color1 to color4 (string): hex color of the for corners of the rectangle  

Displays a rectangle with smooth color blending. See example "Draw basic shapes"

### SELECTABLE

> selectable(Name, selectValue)

Name (String): Name of the item  
selectValue: value of the item  

Creates a list of items, which can be selected similar to a checkbox. The actual value of the selectable is stored in _selectValue.value_

```smallbasic
selectA = {value: false}
selectB = {value: true}
...
nk.layoutRow("dynamic", 30, 1)
nk.selectable("Selectable A", selectA)
nk.selectable("Selectable B", selectB)
```

### SLIDER

> slider(minValue, sliderValue, maxValue, stepSize)

minValue: minimum value of the slider  
sliderValue: actual value if the slider  
maxValue: maximum value of the slider  
stepSize: step size of the slider when moving with the mouse  

Displays a slider. The slider position is given by _sliderValue.value_

```smallbasic
sliderValue  = {value: 5}
...
nk.slider(1, sliderValue, 10, .5)
```

### SPACING

> spacing(numberOfRows)

numberOfRows: height in rows of the element  

Adds an empty element. Use to define spacings between elements.

### TEXT

> text(text, x, y, width, height)

text (String): text  
x,y: position in pixel  
width: width of the text element  
height: height of the element  

Prints text. See example "Drawing basic shapes"

### TEXTINPUT

not supported yet. Use `edit()`.

### TOOLTIP

> tooltip(TooltipValue)

TooltipValue (String): Text of the tooltip

Prints a tooltip.

```smallbasic
edit = {value: "Edit text"}
...
nk.layoutRow("dynamic", 30, 1)
if nk.widgetIsHovered() then
    nk.tooltip("Test tooltip")
endif
k.edit("box", edit)
```

### TREEPOP

> treePop()

Adds an element to a tree. See command `treePush()`

### TREEPUSH

> treePush(type, name)

type (String): type of tree element ("tab" or "node")  
name (String): name of tree element  

Creates a tree.

```smallbasic
nk.layoutRow("dynamic", 30, 1)
if nk.treePush("tab", "Tree Tab") then
    if nk.treePush("node", "Tree Node 1") then
        nk.label("Label 1")
        nk.treePop()
    endif
    if nk.treePush("node", "Tree Node 2") then
        nk.label("Label 2")
        nk.treePop()
    endif
    nk.treePop()
endif
```

### WINDOWEND

> windowEnd()

Ends the rendering of a window.

### LINEWIDTH

> lineWidth(width)

width: width of the line.

Sets the line width.

###  POLLEVENTS

> pollEvents()

Polls events.

### WAITEVENTS

> waitEvents([millis])

millis (optional): wait milliseconds  

Pause the program execution until an event occurs. If _millis_ is set, wait _millis_ milliseconds.

### SWAPBUFFERS

> swapBuffers()

Swap drawing buffers.

### WIDGETBOUNDS

> [x, y, w, h] = widgetBounds()

x,y: position of the widget  
w,h: width and height of the widget  

Returns the position and the dimensions of a widget.

```smallbasic
edit = {value: "Edit text"}
...
nk.layoutRow("dynamic", 30, 1)
[x, y, w, h] = nk.widgetBounds()
k.edit("box", edit)
```

### WIDGETISHOVERED

> result = widgetIsHovered()

result: true or false  

Returns true, if a widget is hovered. See command `tooltip()`.

### WINDOWBEGIN

> windowBegin(Name, x, y, w, h [,flag1, ...])

Name (String): Name of the window  
x, y: Position of the rendered area inside the window in pixel  
w, h: Dimension of the rendered area  
flag1 to flag8 (String): Window flags  

Creates a window and starts rendering. w and h can be given in different ways:

- "400" -> in pixel
- "50%" -> 50% of the window
- "100% - 10" -> 100% of the window minus 10 pixel

Flags can be: "border", "movable", "scalable", "closable", "minimizable", "no_scrollbar", "title", "scroll_auto_hide", "background", "scale_left", "no_input".

### WINDOWGETBOUNDS

> [x, y, w, h] = windowGetBounds()

x,y: position of the rendered area  
w,h: width and height of the rendered area  

Returns the position and the dimensions of the rendered area within the window.
