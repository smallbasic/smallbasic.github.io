# WINDOW

> WINDOW [x1, x2, y2, y1]

Specifies "world" coordinates for the screen. The WINDOW command allows you to redefine the corners of the display screen as a pair of "world" coordinates. The coordinates of the upper-left corner of the screen is given by `[x1, y1]`, the lower-left corner by `[x2, y2]`.

The world space defined by WINDOW is disabled by a WINDOW command without parameters.

### Example

```
' Coordinate system with corners:
' upper-left = [-20,-10]
' lower-right= [ 20, 10] 
x1 = -20
y1 = -10
x2 =  10
y2 =  20

window x1, x2, y2, y1

rect -20, -10 STEP 1, 1, 14 filled    ' Yellow:  upper-left
rect  19, -10 STEP 1, 1, 13 filled    ' Magenta: upper-right
rect  19,   9 STEP 1, 1, 12 filled    ' Red:     lower-right
rect -20,   9 STEP 1, 1, 10 filled    ' Green:   lower-left
circle 0, 0, 1, 1, 15 filled          ' White:   center
```

## WINDOW sub-commands (non-standard)

WINDOW is also overloaded as a function, returning a system object which provides access to the following sub-commands.

### alert(message, title)

Display an alert window. The title of the window is `title` and the context is `message`. 

```
w = window()
w.alert("This is an alert", "title")
```

### ask(message, title)

Display a prompt window to retrieve a user selection. The choices are "Yes" and "No". The title of the window is `title` and the context is `message`. The answer is stored in the window-object variable `answer`: `0` for "Yes" and `1` for "No".

```
w = window()

w.ask("Yes or no?", "Question")

if w.answer == 0 then
    print "Yes"
else 
    print "No"
endif
```

### graphicsScreen1(), graphicsScreen2()

Select graphics mode screen 1 or 2 for output. When switching to a different screen, the context of the previous screen is stored in RAM. When switching back to the previous screen, the context will be restored.

```
w = window()

w.graphicsScreen1()                      ' Set output to screen 1
rect 100,100 STEP 100,100, 15 filled

w.graphicsScreen2()                      ' Set output to screen 2
rect 150,150 STEP 100,100, 14 filled

' Switch between both screens, no need to redaw the rectangles
while 1
    b = !b
    if b then 
        w.graphicsScreen1()
    else
        w.graphicsscreen2()
    endif
  delay(500)
wend
```

### insetTextScreen(x1, y1, x2, y2)

Insert an area for text output from position `[x1, y1]` to position `[x2, y2]`

```
w = window()
? "How does this look?"
w.insetTextScreen(5,10,90,90)
for i = 0 to 200
  ? "This is in the text screen"
next i
pause
```

### menu(option1 [, option2, ..., optionN)

Displays a popup menu with the entries `option1` to `optionN`. INKEY will return the number of the selected option starting with `0`.

```
w = window()

w.menu("option1", "option2", "option3")

select case asc(inkey)
    case 0
      print "one"
    case 1
      print "two"
    case 2
      print "three"
    case else
      print "unk"
end select
```

### message(str)

Displays a status message `str` at the bottom of the screen.

```
w = window()
w.message("Click to continue. ")
```

### setFont(size, unit, bold, italic)

Sets the font size to `size`. `unit` can be set to "em" to make size relative to the existing size. Any other value will cause size to be avaluated as pixels. `bold` can be set to `0` or `1` to enable or disable bold font style. `italic` can be set to `0` or `1` to enable or disable italic font style.

```
w = window()

w.setFont(15, "px", 0, 0)
print "Fixed size 15px"

w.setFont(2, "em", 0, 0)
print "Relative size 15px * 2"

w.setFont(15, "px", 1, 0)
print "Fixed size 15px bold"

w.setFont(15, "px", 0, 1)
print "Fixed size 15px italic"

w.setFont(15, "px", 1, 1)
print "Fixed size 15px bold italic"
```

### setLocation(x, y)

Sets the location of the window on the screen. The upper-left corner of the window will be at position `[x, y]` in pixel.

```
w = window()
w.setLocation(100, 100)
```


### setSize(w, h)

Sets the width `w` and height `h` in pixel of the SmallBASIC window.

```
w = window()
w.setSize(800, 680)
```

### showKeypad()

Raises the virtual keypad on android.

```
w = window()
w.showKeypad()
```

### hideKeypad()

Hides the virtual keypad on android.

```
w = window()
w.hideKeypad()
```


### textScreen()

Select the text mode for output. Text mode can display more text but is slow.

```
w = window()
w.textScreen()
for i = 0 to 1000
  ? "hello " + i
next for
```

### theme

Returns the active window colour theme.

```
w = window()
const theme = w.theme
const colBkGnd = theme.background
const colText  = theme.text5
const colFile  = theme.text2
const colDir   = theme.text3
const colText2 = theme.text4
const colNav   = theme.text1
const colNav2  = theme.text6
```
