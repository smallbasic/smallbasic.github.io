# IMAGE

> IMAGE [#handle | fileName | http://path-to-file.png | image-var | array of pixmap data]

The IMAGE statement provides access to extended support for image manipulation. There are two supported image formats: PNG and XPM (see below).

### Image access

Create via open file handle

```smallbasic
Open "circle.png" For Output As #1
i = Image(#1)
```

Create via file name


```smallbasic
i = Image("circle.png")
```


Create via URL (note only works with HTTP not HTTPS)

```smallbasic
i = Image("http://pngimg.com/uploads/tesla_car/tesla_car_PNG26.png")
```

Create via screen scrape (x, y, width, height)

```smallbasic
i = Image(10, 10, 100, 100)
```

Create via another image variable

```smallbasic
k = Image(...)
i = Image(k)
```

Create via 2D array

```smallbasic
'Create image array a1 without transparency
dim a1(100, 200)
For y = 0 To 99
  For x = 0 To 199
    r += 5: g += 10: b += 15
    a1(y, x) = rgb(r%255, g%255,b%255)
  Next
Next

'Create image array a2 with transparency
'Transparency is a value between 0 and 255
'0 is fully transparent; 255 is solid
dim a2(100, 200)
r = 255: g = 255: b = 255
For y = 0 To 99
  alpha = 5
  For x = 0 To 199
    alpha += 0.1
    transparency = round(alpha) * 10
    a2(y, x) = (transparency lshift 24) - rgb(r,g,b)    
  Next
Next

'Create and display images
i1 = Image(a1)
i2 = Image(a2)

i1.show(20,20)
i2.show(0,0)
```


Create via array of [X_PixMap](https://en.wikipedia.org/wiki/X_PixMap) data

```smallbasic
im << "16 18 4 1"
im << "@ c #547B43"
im << "  c #ffffff"
im << "+ c none"
im << "x c #ff0000"
im << "@@@@@@@+++++++++"
im << "@    @++++++++++"
im << "@   @+++++++++++"
im << "@   @++@++++++++"
im << "@    @@+++++++++"
im << "@     @+++@+++++"
im << "@     @++@@++++@"
im << "@ xxx  @@  @++@@"
im << "@  xxx    xx@@ @"
im << "@   xxx  xxx   @"
im << "@    xxxxxx    @"
im << "@     xxxx     @"
im << "@    xxxxxx    @"
im << "@   xxx  xxx   @"
im << "@  xxx    xxx  @"
im << "@ xxx      xxx @"
im << "@              @"
im << "@@@@@@@@@@@@@@@@"
i = Image(im)
```

### Show command

zIndex controls whether the image will be displayed over or under another image. Images with higher zIndex values are drawn over the top of images with lower zIndex values. Opacity controls whether to display the image as solid or semi-transparent. Opacity values range from 1-100, with higher opacity values making the image less transparent. The default is 100 resulting in a solid image. When calling the show command a second time with new coordinates, the image will move to the new position.

```smallbasic
i.show([x,y [,zindex [,opacity]]])
```

### Hide command

The hide command hides the image from display

```smallbasic
 i.hide()
```

### Draw command

The draw command draws the image immediately to the screen. Calling the draw command a second time with new coordinates, will draw the same image a second time at the new position to the screen.

```smallbasic
 i.draw([x,y [,opacity]])
```

### Save command

The save command saves the image data into the given file handle, file name or array

```smallbasic
dim png
i.save(png)
```

### Clip command (console version only)

Reduces the size of the image.

```smallbasic
png.clip(left, top, right, bottom)
```

### Filter command (console version only)

Calls the supplied callback function on each pixel

```smallbasic
func colorToAlpha(x)
  return x
end
png.filter(use colorToAlpha(x))
```

### Paste command (console version only)

Paste the given image into this image at the given x, y location

```smallbasic
png2 = Image(w, h)
png2.paste(png1, x, y)
```

### Example 1

```smallbasic
Const CSI_EL = Chr(27) + "[K"  ' EL - Erase in Line (clear to end of line).
Sub title(txt) 
  Locate 0, 0: Color 7, 0: ? CSI_EL; txt;
End Sub

' Draw a demo image with text on screen:
title("Draw a demo image")
Pset 100, 100
Circle Step 0, 0, 50 Color 7 Filled
Circle Step 0, 0, 35 Color 1 Filled
text = "Hello"
At Point(0) - Txtw(text) \ 2, Point(1) - (Txth(".") \ 2)
Color 14, 1: Print text;
Pause

title("Create image from screen")
i = Image(50, 50, 102, 102)  ' Create image from screen (x, y, width, height)
i.Show(350, 50)              ' Show the image at location (x, y)
Pause
title("Hide the image")
i.Hide()                     ' Hide the image
Pause

title("Save the image to 2-D array (y, x) of pixels")
i.Save(a)                    ' Save the image to 2-D array (y, x) of pixels
i2 = Image(a)                ' Create a new image from the 2-D array
i2.Show(200, 90)             ' Show the new image at location (x, y)
Pause

title("Modify the colors of the 2-D array (y, x)")
For y = 0 To Ubound(a, 1)    ' Modify the colors of the 2-D array (y, x)
  For x = 0 To Ubound(a, 2)
    a(y, x) += 100
  Next
Next
i2 = Image(a)                ' Create a new image from the modified 2-D array
i2.Show(350, 50)             ' Show the new image at location (x, y)
Pause

title("Copy the top-left of the 2-D array (y, x)")
half_y = Ubound(a, 1) / 2    ' Copy the top-left of the 2-D array (y, x)
half_x = Ubound(a, 2) / 2
Dim a2(half_y, half_x)
For y = 0 To half_y
  For x = 0 To half_x
    a2(y, x) = a(y, x)
  Next
Next
i2 = Image(a2)               ' Create a new image from the top-left 2-D array
i2.Show(200, 90)             ' Show the new image at location (x, y)
Pause

' Note: 'zindex' is probably order of layers - above/under other image(s).
title("Show original image using zindex & opacity")
i.Show(400, 100, 1, 50)      ' Show original image (x, y, zindex, opacity)
Pause
i3 = Image(i)                ' Create a new image from original image
i3.Show(440, 130, 0)         ' Show the new image (x, y, zindex)
Pause

' Note: file name is case sensitive on Linux.
title("Save & Load original image as a PNG file")
Open "circle.png" For Output As #1
i.Save(#1)                   ' Save original image as a PNG file
Close #1
Open "circle.png" For Input As #1
i4 = Image(#1)               ' Load image from a PNG file
Close #1
i4.Show(600, 20)             ' Show loaded image (x, y)
Pause

```

### Example 2

```smallbasic

' Notes: 
' 1. Using POINT and PSET is a much slower option then using:
'    i = IMAGE(x, y, width, height) and i.Show(x, y) - (See Part-1).
'
    ' 2. The 2-D array that holds the image, a(y, x), must be equilateral, e.g.
'    a(2 To 6, 1 To 5), etc; Using a(1 To 5, 1 To 6), for example, is wrong.
'
' 3. It's possible to use POINT or RGB commands (alpha is not supported 
'    in this case) to create the 2-D array that holds the image, a(y, x).

Const CSI_EL = Chr(27) + "[K"  ' EL - Erase in Line (clear to end of line).
Sub title(txt) 
  Locate 0, 0: Color 7, 0: ? CSI_EL; txt;
End Sub

' Draw a demo image with text on screen:
title("Draw a demo image")
Pset 100, 100
Circle Step 0, 0, 50 Color 7 Filled
Circle Step 0, 0, 35 Color 1 Filled
text = "Hello"
At Point(0) - Txtw(text) \ 2, Point(1) - (Txth(".") \ 2)
Color 14, 1: Print text;
Pause

title("Create 2-D image array from screen using POINT")
Dim a(49 To 152, 48 To 151)  ' Create 2-D image array from screen using POINT
For y = 49 To 152
  For x = 48 To 151
    a(y, x) = Point(x, y) 
  Next
Next
Pause

title("Show the 2-D array (slow) using PSET")
For y = 49 To 152            ' Show the 2-D array (slow) using PSET
  For x = 48 To 151
    Pset x + 150, y + 85, a(y, x) 
  Next
Next
Pause

title("Show the image (fast) using SHOW")
i = Image(a)                 ' Convert the 2-D array (y, x) of pixels to image
i.Show(350, 230)             ' Show the image (fast) at location (x, y)
Pause

```

### Example 3

```smallbasic

' Notes:
' 1. You may load an existing XPM image file, the same way you load PNG image
'    file; Or you may store the XPM data within the source code (DATA keyword
'    can help with this...).
'
' 2. XPM is a text image file, as opposed to PNG which is a binary image file.
'    XPM supports high quality images, for more details and options see: 
'    https://en.wikipedia.org/wiki/X_PixMap

' In this example we use the simple and handy XPM2 format (as opposed to the 
' latter and more standard C format, XPM3);
' Create the XPM image array:
' a << "! XPM2"     ' (We Don't use this header line in SmallBASIC 0.12.6)
a << "110 200 3 1"  ' Width=110, Height=200, Colors=3, Character-Per-Pixel=1
a << "a c #FF0000"  ' Character "a" is RGB(0xFF, 0x00, 0x00) - RED
a << "b c NONE"     ' Character "b" is transparency color (NONE)
a << "c c #0000FF"  ' Character "c" is RGB(0x00, 0x00, 0xFF) - BLUE
For i = 1 To 200    ' Create an image of exactly 110x200 (x,y) pixels
  a << String(30, "a") + String(50, "b") + String(30, "c")
Next i
Color 1, 7: Cls
i = Image(a)                 ' Convert the XPM array to image
i.Show(150, 50)              ' Show the image at location (x, y)
At 150 - 100, 50 - 30 
Print "This is XPM image with transparency!"
Pause

' More about XPM2 - from https://en.wikipedia.org/wiki/X_PixMap:
' --------------------------------------------------------------
' XPM2 simplifies the format by removing all C codes. An example:
' ! XPM2
' 48 4 2 1
' a c #FFFFFF
' b c #000000
' abaabaababaaabaabababaabaabaababaabaaababaabaaab
' abaabaababaaabaabababaabaabaababaabaaababaabaaab
' abaabaababaaabaabababaabaabaababaabaaababaabaaab
' abaabaababaaabaabababaabaabaababaabaaababaabaaab
' This is an XPM2 file with width 48, height 4, 2 colors, and 1 character per
' pixel.
' One tool is known to use only a to p for 16 colors, switching to aa up to dp
' for 64 colors, but still reading single character encodings for 64 colors;
' compare Base64.
'
' With more colors the codes use more characters, e.g. aa up to pp for
' 16 x 16 = 256 colors. This is less useful for text editors, because a string
' ab could be actually the middle of two adjacent pixels dabc.
' Spaces are allowed as color code, but might be a bad idea depending on the
' used text editor.
' Without control codes, space, and quote (needed in XPM1 and XPM3)
' 128 - 33 - 2 = 93 ASCII characters are available for single character color
' codes.
'
' Simplified example: 90 US-ASCII characters could be arranged into nine 
' non-overlapping sets of 10 characters. Thus unambiguous strings of nine 
' characters could set the color of each pixel by its XPM palette index with 
' up to 109 = 1000000000 colors (compare to GIF, which supports only 256).
' For XPM2 it is clear how many lines belong to the image - two header lines, 
' the second header line announcing the number of color codes (2 lines in the 
' example above) and rows (height 4 in the example above), 
' e.g. 2 + 2 + 4 = 8 lines.

```

### Example 4

```smallbasic

Color 7, 1: Cls              ' (for recognizing transparency color)
' --- [1]
Restore Demo_XPM_Image       ' Create a demo XPM image array
For i = 1 To 12
  Read s
  a << s
Next i
i = Image(a)                 ' Convert the XPM array to image
i.Show(10, 10)               ' [1] Show the image at location (x, y)
Open "SB.png" For Output As #1
  i.Save(#1)                 ' Save XPM image as a PNG file
Close #1

' --- [2]
i = Image("SB.png")          ' Load image from PNG file, using a "file name"
i.Show(30, 30)               ' [2] Show loaded image (x, y)

' --- [3]
Open "SB.png" For Input As #1
  i = Image(#1)              ' Load image from PNG file, using a file number
Close #1
i.Show(50, 50)               ' [3] Show loaded image (x, y)

' --- [4]
Open "SB.png" For Input As #1  ' Load image from PNG file into 1-D array of
  l = Lof(1)                   '  PNG byte data (integers)
  Dim a(1 To l)                ' (It's much faster to allocate space first)
  For i = 1 To l Do a(i) = Bgetc(1)
Close #1
i = Image(a)                 ' Create an image from the 1-D array
i.Show(80, 80)               ' [4] Show loaded image (x, y)

' --- [5]
Import Base64                ' (See Base64 Encoder/Decoder UNIT above, or
                             '  in: Home -- Code library -- Units section)
Restore Base64_encoded_PNG   ' Load image from Base64 encoded PNG data
s = ""                       '  into 1-D array of PNG byte data (integers)
For i = 1 To 3
  Read d
  s += d
Next i
a = base64.Decode_Base64(s)  ' Decode Base64 PNG string to 1-D array
i = Image(a)                 ' Create an image from the 1-D array
i.Show(100, 100)             ' [5] Show loaded image (x, y)

' --- [6]
Restore Demo_XPM_Image       ' Save XPM image array as XPM file
Dim a(1 To 12)
For i = 1 To 12 Do Read a(i)
Tsave "SB.xpm", a
Tload "SB.xpm", a2           ' Load image from XPM file into array of strings
i = Image(a2)                ' Convert the XPM array to image
i.Show(120, 120)             ' [6] Show loaded image (x, y)

' --- [7]
Open "http://smallbasic.sourceforge.net/images/logo.png" For Input As #1
  i = Image(#1)              ' Load PNG image from web (you must be on-line)
Close #1
i.Show(150, 150)             ' [7] Show loaded image (x, y)

Pause
End

' Note: you may use the Base64 Encoder/Decoder UNIT above to convert PNG file
'       into Base64 encoded string (large file takes time to convert!).
'       It allows you to store the PNG file within the source code.
Label Base64_encoded_PNG  ' (With transparency color)
Data "iVBORw0KGgoAAAANSUhEUgAAABUAAAAJAQAAAAD1eFrbAAAAAnRSTlMAAHaTzTgAAAA"
Data "oSURBVHgBHcdBAQAwDMJA6qI/LLSOkDU5kzZYXhck8mKPMK3vsvOxe3i6Bu6pAW2gAA"
Data "AAAElFTkSuQmCC"

Label Demo_XPM_Image
Data "21 9 2 1"     ' Width=21, Height=9, Colors=2, Character-Per-Pixel=1
Data ". c NONE"     ' Character "." is transparency color (known as "NONE")
Data "o c #FFFFFF"  ' Character "o" is RGB(0xFF, 0xFF, 0xFF) - WHITE
Data "....................."
Data "...ooooo...ooooooo..."
Data "..oo...oo..oo....oo.."
Data "..oo.......oo....oo.."
Data "...ooooo...ooooooo..."
Data ".......oo..oo....oo.."
Data "..oo...oo..oo....oo.."
Data "...ooooo...ooooooo..."
Data "....................."
```

### Example 5

```smallbasic

' Dedicated to johnno56

Const CSI_EL = Chr(27) + "[K"  ' EL - Erase in Line (clear to end of line).
Sub title(txt)
  Locate 0, 0: Color 7, 0: ? CSI_EL; txt;
End Sub

' Draw a demo image with text on screen:
title("Draw a demo image")
Pset 100, 100
Circle Step 0, 0, 50 Color 7 Filled
Circle Step 0, 0, 35 Color 1 Filled
text = "Hello"
At Point(0) - Txtw(text) \ 2, Point(1) - (Txth(".") \ 2)
Color 14, 1: Print text;
Pause

i = Image(50, 50, 102, 102)  ' Create image from screen (x, y, width, height)
Color 7, 0: Cls              ' Erase the demo image.

' Note:
' 1. zIndex parameter is used for the IMAGE sub-command SHOW, its syntax is:
'    SHOW([x,y [,zindex [,opacity]]])
'
' 2. 'zindex' is the order of layers, i.e. under or above other image layers.
'    I'm not aware of any limits for how many image layers can be used.
'
' 3. Using 'zindex' is simple, for example: layer 0 is above layer -1;
'    layer -8 is below layer -7; layer 11 is above layer 10; etc.

' In this example we show 9 images on different layers:
Dim i2(1 To 9)
For layer = 1 To 9
  i2(layer) = Image(i)   ' Copy the demo image to new image
  t = i2(layer)          ' Use temporay variable to hold image (for Show)
  ' Change the 'x' and 'y' properties of t image:
  t.x = 50 + layer * 35
  t.y = 50 + layer * 25
  At t.x + 100, t.y: Color 7, 0  ' (for display text info)
  ' Change the 'zIndex' property of t image:
  Select Case layer
  Case 1: t.zIndex =  0  : ? " Using layer # 0"
  Case 2: t.zIndex = -2  : ? " Using layer # -2 (below layer -1)";
  Case 3: t.zIndex = -1  : ? " Using layer # -1 (below layer 0)";
  Case 4: t.zIndex =  3  : ? " Using layer # 3  (above layer 2)";
  Case 5: t.zIndex =  2  : ? " Using layer # 2  (above layer 1)";
  Case 6: t.zIndex = -9  : ? " Using layer # -9 (below layer -8)";
  Case 7: t.zIndex = -7  : ? " Using layer # -7 (below layer -6)";
  Case 8: t.zIndex = -3  : ? " Using layer # -3 (below layer -2)";
  Case 9: t.zIndex =  4  : ? " Using layer # 4  (above layer 3)";
  End Select
  title("IMAGE # " + layer + ": " + Str(t))  ' Print image properties
  t.Show()   ' Show image (x, y, zindex)
  Pause
Next layer

```

### Base64 decoder for example 4

```smallbasic

REM Purpose:   A Base64 Encoder/Decoder UNIT.
REM File name: base64.bas
REM Unit name: base64
REM Version:   1.0.1  21/05/2016
REM Author:    Christian d'Heureuse; shian (See License below)

' Notes:
' 1. Translated from VBasic to SmallBASIC (shian).
'
' 2. Useful for IMAGE keyword, and for any binary-to-text encoding/decoding.
'    Base64 is often used to embed binary data in source code.
'
' 3. Since this is a translated code, I did not add much comments about the
'    encoding/decoding method... So for more details about it see:
'    https://en.wikipedia.org/wiki/Base64
'
' 4. License:
'    - A Base64 Encoder/Decoder. This module is used to encode and decode data
'      in Base64 format as described in RFC 1521.
'    - Home page: www.source-code.biz.
'    - Code from: http://www.source-code.biz/snippets/vbasic/12.htm
'    - License: GNU/LGPL (www.gnu.org/licenses/lgpl.html).
'    - Copyright 2007: Christian d'Heureuse, Inventec Informatik AG, Switzerland.
'    - This module is provided "as is" without warranty of any kind.
'

' -- Start Demo code --- --- --- --- --- --- --- --- --- --- ---
'
' Import base64                  ' (Import from another .bas file)
'
' Const FILE = "SB.png"          ' (Change it to any other file name)
'
' ' Example using a "file name":
' s = base64.Encode_Base64(FILE) ' Encode 1-D bytes-array to Base64-string
' a = base64.Decode_Base64(s)    ' Decode Base64-string to 1-D bytes-array
'
' i = Image(a)                   ' Convert 1-D bytes-array to image
' i.Show(10, 10)                 ' Show image at location (x, y)
' Showpage
'
' ' Example using a file # (opened for input):
' Open FILE For Input As #1
' s = base64.Encode_Base64(1)    ' Encode 1-D bytes-array to Base64-string
' Close #1
' a = base64.Decode_Base64(s)    ' Decode Base64-string to 1-D bytes-array
'
' i = Image(a)                   ' Convert 1-D bytes-array to image
' i.Show(30, 30)                 ' Show image at location (x, y)
' Showpage
'
' ' Example using 1-D bytes-array (a):
' s = base64.Encode_Base64(a)    ' Encode 1-D bytes-array to Base64-string
' a = base64.Decode_Base64(s)    ' Decode Base64-string to 1-D bytes-array
'
' i = Image(a)                   ' Convert 1-D bytes-array to image
' i.Show(50, 50)                 ' Show image at location (x, y)
' Showpage
'
' Pause
'
' -- End Demo code --- --- --- --- --- --- --- --- --- --- --- ---

Unit base64
Export Encode_Base64, Decode_Base64

' Initialize the helper maps (this code executes only once at load time).
Dim Map1(0 To 63)
Dim Map2(0 To 127)
i = 0
' Set Map1
For c = 65	To  90: Map1(i) = c: i++: Next  ' Asc("A") To Asc("Z")
For c = 97	To 122: Map1(i) = c: i++: Next  ' Asc("a") To Asc("z")
For c = 48	To  57: Map1(i) = c: i++: Next  ' Asc("0") To Asc("9")
Map1(i) = 43 : i++  ' Asc("+")
Map1(i) = 47 : i++  ' Asc("/")
' Set Map2
For i = 0 To 127 Do Map2(i) = 255
For i = 0 To  63 Do Map2(Map1(i)) = i

' Encodes a 1-D bytes array (integers) into Base64 format string.
' No blanks or line breaks are inserted.
' Parameters:
'   InData    1-D bytes array containing the data bytes to be encoded;
'             or, "File_Name" string to load into 1-D bytes array;
'             or, File-Number (opened-for-input) to load into 1-D bytes array.
' Returns:    a string with the Base64 encoded data (that you can embed in
'             your source code).
Func Encode_Base64(InData)
  Local Out                   ' (As Byte)
  Local ODataLen, OLen, ILen  ' (As Long)
  Local ip0, ip, op           ' (As Long)
  Local i0, i1, i2            ' (As Byte)
  Local o0, o1, o2, o3        ' (As Byte)
  Local s, i, fn, f           ' as SmallBASIC...

  If Isarray(InData) Then     ' 1-D bytes array (integers) supplied
    ILen = Len(InData)
  ' Make life easier by loading 1-D bytes array from file:
  Else
    f = Isnumber(InData)      ' Set flag to close file
    If f Then                 ' An opened file # (For Input) supplied
      fn = InData
    Else                      ' A "filename" supplied
      fn = Freefile
      Open InData For Input As #fn
    Fi
    ILen = Lof(fn)
    Dim InData(1 To ILen)     ' (It's much faster to allocate space first!)
    For i = 1 To ILen Do InData(i) = Bgetc(fn)
    If Not f Then Close #fn   ' (Don't close file if File # supplied)
  Fi

  If ILen = 0 Then Encode_Base64 = "": Exit Func
  ODataLen = (ILen * 4 + 2) \ 3   ' Output length without padding
  OLen = ((ILen + 2) \ 3) * 4     ' Output length including padding
  Dim Out(0 To OLen - 1)
  ip0 = LBound(InData)
  ' Encode base64 bytes array (See Wikipedia for this...):
  While ip < ILen
    i0 = InData(ip0 + ip): ip++
    If ip < ILen Then i1 = InData(ip0 + ip): ip++ Else i1 = 0
    If ip < ILen Then i2 = InData(ip0 + ip): ip++ Else i2 = 0
    o0 = i0 \ 4
    o1 = ((i0 Band 3) * 0x10) Bor (i1 \ 0x10)
    o2 = ((i1 Band 0xF) * 4)  Bor (i2 \ 0x40)
    o3 = i2 Band 0x3F
    Out(op) = Map1(o0): op++
    Out(op) = Map1(o1): op++
    Out(op) = Iff(op < ODataLen, Map1(o2), 61): op++  ' 61 is Asc("=")
    Out(op) = Iff(op < ODataLen, Map1(o3), 61): op++  ' 61 is Asc("=")
  Wend
  s = "": For i In Out Do s += Chr(i)  ' Bytes-to-String
  Encode_Base64 = s
End Func

' Decodes a string from Base64 format.
' Parameters
'   s         a Base64 String to be decoded.
' Returns:    a 1-D array containing the decoded data bytes (integers).
Func Decode_Base64(s)
  Local IBuf, Out       ' (As Byte array)
  Local i0, i1, i2, i3  ' (As Byte)
  Local b0, b1, b2, b3  ' (As Byte)
  Local o0, o1, o2      ' (As Byte)
  Local OLen, ip, op    ' (As Long)
  Local ILen = Len(s)   ' (As Long)
  Local i               ' as SmallBASIC...
  If (ILen Mod 4) Or (ILen = 0) Then  ' Data error
    Throw "Length of Base64 encoded input string is not a multiple of 4."
  Fi
  Dim IBuf(0 To ILen - 1)
  For i = 1 To ILen Do IBuf(i - 1) = Asc(Mid(s, i, 1))  ' String-to-Bytes
  While ILen > 0
    If IBuf(ILen - 1) <> 61 Then Exit Loop  ' 61 is Asc("=")
    ILen--
  Wend
  OLen = (ILen * 3) \ 4
  Dim Out(0 To OLen - 1)  ' 1-D bytes array
  ' Decode base64 bytes array (See Wikipedia for this...):
  While ip < ILen
    i0 = IBuf(ip): ip++
    i1 = IBuf(ip): ip++
    If ip < ILen Then i2 = IBuf(ip): ip++ Else i2 = 65  ' 65 is Asc("A")
    If ip < ILen Then i3 = IBuf(ip): ip++ Else i3 = 65  ' 65 is Asc("A")
    If i0 > 127 Or i1 > 127 Or i2 > 127 Or i3 > 127 Then
      Throw "Illegal character in Base64 encoded data."  ' Data error
    Fi
    b0 = Map2(i0)
    b1 = Map2(i1)
    b2 = Map2(i2)
    b3 = Map2(i3)
    If b0 > 63 Or b1 > 63 Or b2 > 63 Or b3 > 63 Then
      Throw "Illegal character in Base64 encoded data."  ' Data error
    Fi
    o0 = (b0 * 4) Bor (b1 \ 0x10)
    o1 = ((b1 Band 0xF) * 0x10) Bor (b2 \ 4)
    o2 = ((b2 Band 3) * 0x40) Bor b3
    Out(op) = o0: op++
    If op < OLen Then Out(op) = o1: op++
    If op < OLen Then Out(op) = o2: op++
  Wend
  Decode_Base64 = Out
End Func
```

You may create a PNG image + transparency color with an external image editor, and then you may also decode it as a Base64 PNG string (to store it within the source code).
Another useful option is to use XPM image format (See Part-3 above) with transparency color, instead of color number you just write NONE, like this:

```smallbasic
a << "x c NONE"  ' Character "x" is transparency color
```

### Console version example

The following creates a plist file and composite sprite sheet which can be used with cocos2d development

```smallbasic
const backgnd = 0xFF5A5D39
const shadow = 0xFF080c08

const alpha = 0x5a5d39
const alphaShadow = 0x80080c08

dim tileset
tileset << ["eating e0000.png",       13]
tileset << ["eating n0000.png",       13]
tileset << ["eating ne0000.png",      13]
tileset << ["eating nw0000.png",      13]
tileset << ["eating s0000.png",       13]
tileset << ["eating se0000.png",      13]
tileset << ["eating sw0000.png",      13]
tileset << ["eating w0000.png",       13]
tileset << ["headshaking e0000.png",  11]
tileset << ["headshaking n0000.png",  11]
tileset << ["headshaking ne0000.png", 11]
tileset << ["headshaking nw0000.png", 11]
tileset << ["headshaking s0000.png",  11]
tileset << ["headshaking se0000.png", 11]
tileset << ["headshaking sw0000.png", 11]
tileset << ["headshaking w0000.png",  11]
tileset << ["running e0000.png",      11]
tileset << ["running n0000.png",      11]
tileset << ["running ne0000.png",     11]
tileset << ["running nw0000.png",     11]
tileset << ["running s0000.png",      11]
tileset << ["running se0000.png",     11]
tileset << ["running sw0000.png",     11]
tileset << ["running w0000.png",      11]
tileset << ["stopped0000.png",         7]
tileset << ["walking e0000.png",      11]
tileset << ["walking n0000.png",      11]
tileset << ["walking ne0000.png",     11]
tileset << ["walking nw0000.png",     11]
tileset << ["walking s0000.png",      11]
tileset << ["walking se0000.png",     11]
tileset << ["walking sw0000.png",     11]
tileset << ["walking w0000.png",      11]

func colorToAlpha(x)
  if (x == backgnd) then return alpha
  if (x == shadow) then return alphaShadow
  return x
end

sub print_include()
  local j, pattern, count, out, varname
  out << "#pragma once"
  for j = 0 to len(tileset) - 1
    x = 0
    y = 0
    [pattern, count] = tileset[j]
    varname = translate(pattern, "0000.png", "")
    varname = translate(varname, " ", "_")
    varname = upper(varname)
    pattern = translate(pattern, "0000", "%04d")
    out << "const char *" + varname + "_PNG = \"" + pattern + "\";"
    out << "const int   " + varname + "_PNG_SIZE = " + count + ";"
  next j
  tsave "Classes/horse.h", out
end

sub print_plist(byref images)
  local plist, i

  dim plist
  plist << "<?xml version=\"1.0\" encoding=\"UTF-8\"?>"
  plist << "<!DOCTYPE plist PUBLIC \"-//Apple//DTD PLIST 1.0//EN\" \"http://www.apple.com/DTDs/PropertyList-1.0.dtd\">"
  plist << "<plist version=\"1.0\">"
  plist << "<dict>"
  plist << "  <key>texture</key>"
  plist << "    <dict>"
  plist << "      <key>width</key>"
  plist << "      <integer>" + w + "</integer>"
  plist << "      <key>height</key>"
  plist << "      <integer>" + h + "</integer>"
  plist << "    </dict>"
  plist << "    <key>frames</key>"
  plist << "    <dict>"
  for i = 0 to len(images) - 1
    png = images[i]
    plist << "      <key>" + png.name + "</key>"
    plist << "      <dict>"
    plist << "        <key>x</key>"
    plist << "        <integer>" + png.x + "</integer>"
    plist << "        <key>y</key>"
    plist << "        <integer>" + png.y + "</integer>"
    plist << "        <key>width</key>"
    plist << "        <integer>" + png.width + "</integer>"
    plist << "        <key>height</key>"
    plist << "        <integer>" + png.height + "</integer>"
    plist << "        <key>offsetX</key>"
    plist << "        <real>0</real>"
    plist << "        <key>offsetY</key>"
    plist << "        <real>0</real>"
    plist << "        <key>originalWidth</key>"
    plist << "        <integer>" + png.width + "</integer>"
    plist << "        <key>originalHeight</key>"
    plist << "        <integer>" + png.height + "</integer>"
    plist << "      </dict>"
  next i
  plist << "    </dict>"
  plist << "  </dict>
  plist << "</plist>
  tsave "Resources/horse.plist", plist
  tsave "linux-build/bin/Debug/MobileCup/Resources/horse.plist", plist
end

sub main(byref tileset)
  local i, j, x, y, pattern, count, images, composite, width, height
  dim images

  width = 0
  height = 0

  for j = 0 to len(tileset) - 1
    x = 0
    y = 0
    [pattern, count] = tileset[j]
    for i = 0 to count
      png = image("images/horse/" + format(pattern, i))
      png.clip(5, 5, 5, 5)
      png.filter(use colorToAlpha(x))
      png.name = format(pattern, i)
      png.x = x
      png.y = height
      x += png.width + 1
      y = iff(png.height > y, png.height, y)
      images << png
    next i
    width = iff(x > width, x, width)
    height += y
  next j

  composite = image(width, height)
  for i = 0 to len(images) - 1
    png = images[i]
    composite.paste(png, png.x, png.y)
  next i

  composite.save("Resources/horse.png")
  composite.save("linux-build/bin/Debug/MobileCup/Resources/horse.png")
  print_plist(images)
  print_include()
end

main(tileset)
```

