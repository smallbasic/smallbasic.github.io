# WINDOW

> WINDOW [x1,y2,x2,y1]

Specifies "world" coordinates for the screen.

The WINDOW command allows you to redefine the corners of the display screen as a pair of "world" coordinates. 

The world space defined by WINDOW is disabled by a WINDOW command with no parameters.

Note: the unusal coordinates are intended for Quick BASIC compatibility (possible bug).

```
window 1, 320, 320, 1
rect 0, 0, 160, 160, 1 filled
rect 160, 160, 320, 320, 2 filled
rect 160, 0, 320, 160, 3 filled
rect 0, 160, 160, 320, 4 filled
```

## WINDOW sub-commands (non-standard)

WINDOW is also overloaded as a function, returning a system object which provides access to the following sub-commands.

### alert(message, title)

Display an alert message.

```
w = window()
w.alert("This is an alert", "title")
```

### ask(message, title)

Display a prompt to retrieve a user selection.

```
w = window()
w.ask("Yes or no?", "Question")
if w.answer == 0 then
  w.alert("Yes!", "Answer")
else 
  w.alert("No", "Answer")
endif
```

### graphicsScreen1(), graphicsScreen2()

Select graphics mode screen 1 or 2 for output.

```
dim v(30)
for i = 0 to 30
  v[i] = rnd
next i

sub draw_chart(n,s)
  color 1,15: cls
  chart n, v, s, 1, 1, xmax-2, ymax-2
end

w = window()
w.graphicsScreen2(): draw_chart(1, 5)
w.graphicsScreen1(): draw_chart(2, 3)

while 1
  b = !b
  if b then w.graphicsScreen1() else w.graphicsscreen2()
  pause
wend
```
### insetTextScreen(x, y, w, h)

```
w = window()
? "How does this look?"
w.insetTextScreen(5,10,90,90)
for i = 0 to 200
  ? "This is in the text screen"
next i
pause
```

### menu(option1, option2...)

Displays a popup menu. The user response is available via INKEY.

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

Displays a status message at the bottom of the screen.

```
w = window()
w.message("Click to continue. ")
```

### setFont(size, unit, bold, italic)

Sets the font to be double in size with bold and italic.

"Unit" can be set to "em" to make size relative to the existing size, any other value will cause size to be avaluated as pixels.

```
w = window()
dim buf

sub text(s)
  local x, y, j, size, width, height
  buf << s
  y = ymax / 2
  cls
  size = 30
  for j = len(buf) - 1 to 0 step - 1
    size -= 2
    w.setFont(size, "px", 0, 1)
    width = txtw(buf[j])
    height = txth(buf[j])
    x = (xmax - width) / 2
    y -= height
    at x, y: print buf[j]
  next j
  delay 1200
end

text "A long time ago, in a galaxy far, far away..."
text "It is a period of civil war. Rebel"
text "spaceships, striking from a hidden"
text "base, have won their first victory"
text "against the evil Galactic Empire."
text "During the battle, Rebel spies managed"
text "to steal secret plans to the Empire's"
text "ultimate weapon, the Death Star, an"
text "armored space station with enough"
text "power to destroy an entire planet."
text "Pursued by the Empire's sinister agents,"
text "Princess Leia races home aboard her"
text "starship, custodian of the stolen plans"
text "that can save her people and restore"
text "freedom to the galaxy...."
```

### setLocation(x, y)

Sets the location of the window on the screen.

```
w = window()
w.setLocation(100, 100)
```


### setSize(w, h)

Sets the width and height of the SmallBASIC window.

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
