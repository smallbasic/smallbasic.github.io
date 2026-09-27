# Teensy User Guide

> The Teensy is a complete USB-based microcontroller development system,
in a very small footprint, capable of implementing many types of projects.
All programming is done via the USB port. SmallBASIC runs on Teensy 4.0
and Teensy 4.1.

::: articleRight ::
::: articleRightInner ::
Contents
:::

* [Setup](#Setup)
  * [Windows](#Windows)
  * [Linux](#Linux)
* [Run a SmallBASIC Program](#RunASmallBASICProgram)
* [Send a Program to the Teensy](#SendAProgramToTheTeensy)
* [Read Output from your Running Program](#ReadOutputFromYourRunningProgram)
* [Debugging the Teensy Crash Screen (LINUX)](#DebuggingTheTeensyCrashScreenLINUX)
* [Teensy Command Reference](#TeensyCommandReference)
  * [Digital Output](#DigitalOutput)
  * [Digital Input](#DigitalInput)
  * [Analog Output](#AnalogOutput)
  * [Analog Input](#AnalogInput)
  * [Serial](#Serial)
  * [I2C](#I2C)
  * [FLASH and SD card](#flashandsdcard)
  * [SSD1306 OLED](#Ssd1306Oled)
  * [Miscellaneous Commands](#MiscellaneousCommands)
  * [Unused Commands](#UnusedCommands)
* [Examples](#Examples)
:::

## Setup {#Setup}

Setup of your Teensy 4.0 or Teensy 4.1 is quite easy. First you have to
install the SmallBASIC firmware on the Teensy and then you ready to transfer
your first SmallBASIC program to the Teensy. It is not necessary to install
the teensyduino package for the Arduino IDE. Depending on your operation system
the installation procedure is slightly different. Please follow the links in
the next sections to the official Teensy website.

### Windows {#Windows}

1. Install the [Teensy loader application for Windows](https://www.pjrc.com/teensy/loader_win10.html).
3. Download the latest [SmallBASIC firmware](https://github.com/smallbasic/SmallBASIC/releases) from Github.
4. Connect the Teensy using USB and flash the firmware as described on the Teensy loader website.

### Linux {#Linux}

1. Install the [Teensy loader application for Linux](https://www.pjrc.com/teensy/loader_linux.html).
2. Apply the udev rules as describe on the Teensy loader website.
3. Download the latest [SmallBASIC firmware](https://github.com/smallbasic/SmallBASIC/releases) from Github.
4. Connect the Teensy using USB and flash the firmware as described on the Teensy loader website.

## Run a SmallBASIC Program {#RunASmallBASICProgram}

SMALLBASIC for Teensy offers four ways to upload and run a program.

1. Format a SD card using FAT32. Rename your program to `MAIN.BAS` and copy it to the SD card.
2. Upload your program as `MAIN.BAS` to the flash memory file system (i.e. use `console.bas`)
3. Include your program in the firmware. Replace `main.bas` in `src/platform/teensy` by your program and build
   the firmware.
4. Send your program via USB-serial connection to the Teensy. In Linux use ` cat YourProgram.bas > /dev/ttyACM0`
   Change `/dev/ttyACM0` to the USB-serial port of your Teensy.

When the Teensy starts up, it will check in the above indicated order for your program. If it finds
a SD card and the SD card contains a file `MAIN.BAS`, it will execute it. Otherwise it will check flash for
the file `MAIN.bas` and executes it. Otherwise it will check, if a program was included in the firmware. If no
program was included, the Teensy will switch to interactive mode and waits for a program upload via USB-serial.

While your program is running, the Teensy will check continuously if data is available at the USB-serial port.
If data is available for longer than one second, your running program will be terminated and the queued data of the
USB-serial port will be interpreted as the new program. Once the upload is finished, the new program will be executed.
If you are using the USB-serial port for communication, read the queued data within one second. Alternative, you
can turn on/off this behavior during runtime.

If an error occurred, for example a syntax error, execution will stop and you have to read the error message from
the USB-serial port.

If the execution of your program comes to an end, for example when reaching the end of the program or when `STOP` is
called, the program is terminated and the teensy switches to interactive mode.

## Send a Program to the Teensy {#SendAProgramToTheTeensy}

Using the USB serial connection you can send your program to the Teensy. You have to figure out, which serial port
is used by the Teensy. In Windows it is one of the COM-Ports, in Linux usually `/dev/ttyACM0`.

You can use a Serial Terminal of your choice, or in Linux `cat YourProgram.bas > /dev/ttyACM0`.

Alternatively, SmallBASIC comes with a simple [Serial Terminal](https://github.com/smallbasic/SmallBASIC/blob/master/src/platform/teensy/samples/SerialTerminal.bas). With the `F1` key you can specify the port, i.e `COM1` in Windows or `/dev/ttyACM0` in Linux.
With `F2` the speed can be set. With `F3` you can choose a file for upload. `F4` saves the current display buffer.
`F6` uploads the file. Pressing `F10` will end the serial monitor. 

## Read Output From Your Running Program {#ReadOutputFromYourRunningProgram}

The `PRINT` command can be used to print to the USB-serial port. To access the output, connect to the serial
port using, i.e. `PUTTY` or any other serial-port monitor / terminal. Using Linux, the easiest way is to run
`cat /dev/ttyACM0`. Alternatively, use the [SmallBASIC Serial Terminal](https://github.com/smallbasic/SmallBASIC/blob/master/src/platform/teensy/samples/SerialTerminal.bas).

## Debugging the Teensy Crash Screen (LINUX) {#DebuggingTheTeensyCrashScreenLINUX}

To find the line that failed (but no stack) run:

```
arm-none-eabi-addr2line -e smallbasic.elf ADDRESS
```

Where `ADDRESS` is the address shown in the crash screen, for example `0x17D04`

## Teensy Command Reference {#TeensyCommandReference}

Before using any Teensy related commands, the Teensy module must be imported:

```SmallBASIC
import teensy
```

### Digital Output {#DigitalOutput}

> OUT = OPENDIGITALOUTPUT(pin)

Opens the pin `pin` for digital writing. `OPENDIGITALOUTPUT` returns the object `OUT` to access the pin.

> OUT.WRITE(state)

Sets the signal level of the corresponding pin. If `state` is `0`, the pin will be set to low, otherwise to high.

#### Example

```SmallBASIC
import teensy
const PIN2 = teensy.OPENDIGITALOUTPUT(2)
PIN2.WRITE(1)
```

### Digital Input {#DigitalInput}

> IN = OPENDIGITALINPUT(pin [,mode])

Opens the pin `pin` for digital reading. `mode` specifies if the internal pullup resistor should be used.
Default setting is to use the pullup resistor. `OPENDIGITALINPUT` returns the object `IN` to access the pin.

> S = IN.READ()

Reads the current voltage state `S` of the corresponding pin. `READ` returns `0` if the signal is low or `1`
if the signal is high.

#### Example

```SmallBASIC
import teensy
const PIN2 = teensy.OPENDIGITALINPUT(2)
print PIN2.READ()
```

### Analog Output {#AnalogOutput}

> OUT = OPENANALOGOUTPUT(pin)

Opens the pin `pin` for analog writing using Pulse Width Modulation (PWM). `OPENANALOGOUTPUT` returns
the object `OUT` to access the pin.

> OUT.WRITE(value)

Sets the signal level of the corresponding pin. `value` must be an integer. If `value = 0` the output
voltage will be zero. The maximum value of `value` depends on the resolution. See table for more information.

> OUT.RESOLUTION(res)

Sets the resolution of the PWM generator. `res` must be an integer value between 2 and 15. When changing
the resolution, the frequency also needs to be adjusted. See table for more information.

> OUT.FREQUENCY(freg)

Sets the PWM frequency in Hz. `freq` is a floating point number. See table for correct settings.

> Settings for resolution and frequency

Setting according to [Teensy website](https://www.pjrc.com/teensy/td_pulse.html)

| Resolution| PWM values | Frequency in Hz |
| :--------:|:----------:|:---------------:|
| 15        |	0 - 32757  | 4577.64         |
| 14        |	0 - 16383  | 9155.27         |
| 13        | 0 - 8191   | 18310.55        |
| 12        |	0 - 4095   | 36621.09        |
| 11        |	0 - 2047   | 73242.19        |
| 10        |	0 - 1023   | 146484.38       |
| 9         | 0 - 511    | 292968.75       |
| 8         | 0 - 255    | 585937.5        |
| 7         | 0 - 127    | 1171875         |
| 6         | 0 - 63     | 2343750         |
| 5         | 0 - 31     | 4687500         |
| 4         | 0 - 15     | 9375000         |
| 3         | 0 - 7      | 18750000        |
| 2         |	0 - 3      | 37500000        |

#### Examples

```SmallBASIC
' 8 bit PWM with built-in LED

import teensy
const BuiltInLED = teensy.openAnalogOutput(13)

while(1)
  brightness++
  if(brightness > 255) then brightness = 0
  print brightness
  BuiltInLED.write(brightness)
  delay(10)
wend
```

```SmallBASIC
' 12 bit PWM with built-in LED
' For frequency settings see https://www.pjrc.com/teensy/td_pulse.html

import teensy
const BuiltInLED = teensy.openAnalogOutput(13)

BuiltInLED.Frequency(36621.09)
BuiltInLED.Resolution(12)

while(1)
  brightness++
  if(brightness > 4095) then brightness = 0
  print brightness
  BuiltInLED.write(brightness)
  delay(1)
wend
```

### Analog Input {#AnalogInput}

> IN = OPENANALOGINPUT(pin)

Opens the pin `pin` for analog reading. `OPENANALOGINPUT` returns the object `IN` to access the pin.
Default setting for resolution is 10 Bit. **Setting resolution
is currently not implemented.**

> V = IN.READ()

Reads the current voltage `V` of the corresponding pin. `READ` returns an integer between `0` and a maximum
number depending on the resolution setting. At 10 Bit `READ` returns 1023 at 3.3V.

#### Example

```SmallBASIC
import teensy
const PIN14 = teensy.OPENANALOGINPUT(14)
print PIN14.READ()
```

### Serial {#Serial}

> SERIAL = OPENSERIAL([interface] [,speed])

Opens a serial interface for serial communication. The optional parameter `interface` specifies, which
serial interface should be used. `interface = 0` will use the USB serial port. `interface = 1` will use
the first hardware serial port (RX1, TX1 on pins 0 and 1). `interface` must be between 0 and 7. Default value
for `interface` is `0`. **TODO:** include interface 8 for Teensy 4.1.

The optional parameter `speed` sets the transfer speed of the serial port. Default value for `interface > 0`
is `9600`. For `interface = 0` the speed is set by the operating system for USB-serial communication;
either 12 or 480 Mbit/sec.

> n = SERIAL.READY()

Returns the number `n` of available bytes.

> s = SERIAL.RECEIVE([n])

Reads `n` bytes from the serial interface and returns an 1D array with length `n`. Every element of the
array is one byte.
If `n` is not given or `n = 0`, `RECEIVE` will read data until a `\n` (new line) is received. The data will be
returned as a string.
If a timeout occurs, less than `n` bytes or a shorter string will be returned.

> SERIAL.SEND(s)

Sends the string `s`. **TODO:** Send an array of bytes.

#### Examples

```SmallBASIC
import teensy

const usbSerial = teensy.openSerial()
const BuiltInLED = teensy.openDigitalOutput(13)
value = 0

while(1)
  if(usbSerial.ready()) then
    s = usbSerial.receive()
    if(len(s) > 0) then
      select case s
        case "quit"
          usbSerial.send("Quit program\n")
          ' print "Quit program."
          stop
        case "led"
          value = !value
          print "LED: "; value
          BuiltInLED.write(value)
        case else
          print s
      end select
    endif
  else
    delay(10)
  endif
wend
```

```SmallBASIC
import teensy

const usbSerial = teensy.openSerial()
const BuiltInLED = teensy.openDigitalOutput(13)
value = 0

while(1)
  if(usbSerial.ready()) then
    s = usbSerial.read(2)
    print s
    if(len(s) == 2) then
      if(s[0] == 81) then     ' if first Byte is a Q
          print "Quit program."
          stop
      endif
    endif
  else
    delay(50)
  endif

  BuiltInLED.write(1)
  delay(25)
  BuiltInLED.write(0)
  delay(25)
wend
```

### I2C {#I2C}

For some I2C sensors SmallBASIC examples are already available. Please check [Github](https://github.com/smallbasic/SmallBASIC/tree/master/src/platform/teensy/samples).

> I2C = OPENI2C([interface, pinSDA, pin SCL)

Opens I2C at interface `interface` using `pinSDA` for SDA and `pinSCL` for SCL.
The default value for the optional parameter `interface` is `0`. The interface number and the corresponding pins are defined as follow:

| Interface SmallBASIC | Interface C | SDA pin | SCL pin |
|:--------------------:|:-----------:|:-------:|:-------:|
| 0                    | Wire        | 18      | 19      |
| 1                    | Wire1       | 17      | 16      |
| 2                    | Wire2       | 25      | 24      |

Using the optional parameters `pinSDA` and `pinSCL` the alternative I2C pins can be set:

| Board     | SDA | SCL |
|:---------:|:---:|:---:|
|Teensy 4.0 | 36  | 37  |
|Teensy 4.1 | 44  | 45  |

`OPENI2C` returns an I2C object `I2C` to access the interface.

> v = I2C.READ(address [, n, stop])

Reads `n` bytes from address `address`. `address` must be a valid 7 Bit I2C address. Default value for `n` is `1`.

The optional parameter `mode` can be `true` or `false`. `true` will send a
stop message, releasing the bus after transmission. `false` will send a restart, keeping the connection active. Default value is `true`.

If one bytes was read, `READ` will return an integer. If multiple bytes were
read, an 1D array of integers will be returned.

> I2C.SEND(address, data [, stop])

Sends `data` to the address `address`. `address` must be a valid 7 Bit I2C address. `data` can be:

- a single integer value from 0 to 255
- a string, where every character is interpreted as a byte
- a 1D array of integers with values from 0 to 255

The optional parameter `stop` can be `true` or `false`. `true` will send a
stop message, releasing the bus after transmission. `false` will send a restart, keeping the connection active. Default value is `true`.

> I2C.SETCLOCK(c)

Sets the I2C clock speed to `c` in Hz. Allowed values are `100000`, `400000` and `1000000`. Default value is `100000` Hz.

#### Example

```SmallBASIC
' BH1750 ambient light sensor

import teensy

const ADDRESS = 0x23

Print "Open I2C"
const I2C = teensy.OpenI2C(1)   ' use I2C pins 16 and 17
Print "Opened"

' Power down
I2C.Write(ADDRESS, 0x00)
' Power on
I2C.Write(ADDRESS, 0x01)
delay(500)

' Send "Continuously H-resolution mode" instruction
I2C.write(ADDRESS, 0b00010000)
delay(200)

while(1)
  ' Read H-resolution measurement result
  d = I2C.read(ADDRESS, 2)
  ValueHighRes = ((d[0] lshift 8) BOR d[1]) / 1.2

  ii++  
  print ii, "High resolution: " + valueHighRes + " lx"

  delay(100)
wend
```

### Flash and SD card {#flashandsdcard}

To access and manipulate files in flash memory or on sd-card the teensy file system library needs to be imported:

```smallbasic
import teensy
fs = teensy.fs
```

File names can contain absolute pathes. If you want to access flash memory, the file name must start with
`flash:`; for accessing the built in SD card the file name must start with `sd:`. A file name without
`flash:` or `sd:` will access the corresponding file in flash memory.

Examples for valid file names:

1. `flash:test.txt`
2. `flash:/dir/test.txt`
3. `sd:test.txt`
4. `sd:/dir/test.txt`
5. `test.txt`
6. `/dir/test.txt`

> result = fs.QUICKFORMAT()

Formats the flash file system. Returns `0`, if format was not successful.

> result = fs.EXISTS(name)

Checks if `name` exists. `name` can be a file or a directory. `EXISTS` returns `1` if the file or directory exists, otherwise `0`.

> result = fs.MKDIR(name)

Creates the directory `name`. Returns `0`, if creation of the directory was not successful.

> result = fs.RENAME(OldName, NewName)

Renames a file from `OldName` to `NewName`. If `NewName` contains an absolute path, the file will be moved. `RENAME` returns `0` if
not successful.

> result = fs.REMOVE(name)

Removes the file or directoy `name`. A directory must be empty. `REMOVE` returns `0` if not successful.

> result = fs.FREE()

Returns an array with total size and used size.

| Element   | Size             |
|:---------:|:----------------:|
| result[0] | total size flash |
| result[1] | used size flash  |
| result[2] | total size sd    |
| result[3] | used size sd     |

> file = fs.OPEN(FileName [,RWMode])

Opens a file `FileName` for reading or writing defined by the optional parameter `RWMode` and returns a file-object `file`. 

`RWMode` specifies read or write access:

| RWMode        | Access |
|:-------------:|:------:|
| 0             | read   |
| 1             | write  |
| not specified | read   |

Beside normal files also directories can be opened. When opening a file for writing, the file pointer will be positioned at the
end of the file.

The returned file-object `f` contains methods for file handling depending on file type and file access.

```smallbasic
import teensy
const fs = teensy.fs

const FS_READ  = 0
const FS_WRITE = 1

print "Open file for writing"
file = fs.open("flash:/test.txt", FS_WRITE)
```

> result = file.getNextFilename()

Returns the next file in a directory or `0` if there is no further file.

```smallbasic
import teensy
fs = teensy.fs

file = fs.open("flash:/")   ' Open root directory

while(1)
  s = ""
  name = file.getNextFilename()
  if(name == 0) then exit
  file2 = fs.open(name)
  if(file2.isDirectory()) then s = "/"
  file2.close()
  print name; s
wend
```

> data = file.read([n])

Reads data from a file:

1. `read()` or `read(0)` -> read until `\n` and return data as string
2. `read(1)`             -> read one byte and return as integer
3. `read(n)`             -> read `n` bytes and return as integer array

```smallbasic
import teensy
const fs = teensy.fs
const FS_READ = 0

file = fs.open("flash:/test.txt", FS_READ)
while(file.available())
  s = file.read()
  print s
wend
```

> n = file.available()

Returns the number of available bytes `n` starting from the current file position.

```smallbasic
import teensy
const fs = teensy.fs
const FS_READ = 0

file = fs.open("flash:/test.txt", FS_READ)
while(file.available())
  s = file.read()
  print s
wend
```

> file.write(data)

Writes `data` to the file. `data` can be a string, an integer, or an array of integers. Integer values must range from
`0` to `255` and will be written as bytes.

```smallbasic
import teensy
const fs = teensy.fs
const FS_WRITE = 1

file = fs.open("flash:/test.txt", FS_WRITE)
file.write("test\n")
file.close()
```

> file.truncate()

Removes content of a file (makes the file empty).

```smallbasic
import teensy
const fs = teensy.fs
const FS_WRITE = 1

file = fs.open("flash:/test.txt", FS_WRITE)
file.truncate()
file.write("test\n")
file.close()
```

> file.flush()

Data might be buffered and writing to the file is triggered by the library. Use `flush` to force writing data to the file.

> n = file.size()

Returns the file size in bytes.

> pos = file.position()

Returns the current position of the file pointer.

> file.seek(n)

Sets the position of the file pointer.

> result = file.isDirectory()

Returns `1` if the file is a directory.

> file.close()

Closes a file and force writing of the file buffer.

### SSD1306 OLED {#Ssd1306Oled}

Currently only displays with 128x64 pixels are supported. The display must be connected to the interface 0 (SDA pin 18, SCL pin 19).

To use the SSD1306 the following module must be imported:

```SmallBASIC
import ssd1306
```

> INIT()

Initializes the display. Must be called before any other ssd1306 command.

> CLEAR()

Clears the display.

> DIM(value)

Sets the display brightness. `value` must be in the range from 0 to 255. 

> FLUSH()

Updates the display and shows the result of the last drawing commands.

> DRAWCHAR(x, y, c, color, bg, size)

Draws a single character `c` at position `[x,y]` with foreground color `color`, background color `bg` and scale factor `size`.

> DRAWCIRCLE(x, y, r [, color])

Draws a circle at position `[x,y]` with radius `r` and color `color`.
Default value for `color` is white.

> DRAWLINE(x0, y0, x1, y1 [, color])

Draws a line from `[x0,y0]` to `[x1,y1]` with color `color`.
Default value for `color` is white.

> DRAWPIXEL(x, y [, color])

Draws a pixel at `[x,y]` with color `color`
Default value for `color` is white.

> DRAWRECT(x, y, w, h [, color])

Draws a rectangle with upper left corner at `[x,y]`, a width of `w`, a height of `h` and a color of `color`. Default value for `color` is white.

> DRAWROUNDRECT(x, y, w, h, r [, color])

Draws a rectangle with rounded corners with upper left corner at `[x,y]`, a width of `w`, a height of `h`, a corner radius of `r` and a color of `color`.
Default value for `color` is white.

> DRAWTRIANGLE(x0, y0, x1, y1, x2, y2 [, color])

Draws a triangle with the corners `[x0,y0]`, `[x1,y1]`, `[x2,y2]` and color `color`. Default value for `color` is white.

> FILLCIRCLE(x, y, r [, color])

Draws a filled circle at position `[x,y]` with radius `r` and color `color`.
Default value for `color` is white.

> FILLRECT(x, y, w, h [, color])

Draws a filled rectangle with upper left corner at `[x,y]`, a width of `w`, a height of `h` and a color of `color`. Default value for `color` is white.

> FILLROUNDRECT(x, y, w, h, r [, color])

Draws a filled rectangle with rounded corners with upper left corner at `[x,y]`, a width of `w`, a height of `h`, a corner radius of `r` and a color of `color`. Default value for `color` is white.

> FILLSCREEN([color])

Fills the screen with color `color`. Default value for `color` is black.

> FILLTRIANGLE(x0, y0, x1, y1, x2, y2 [, color])

Draws a filled triangle with the corners `[x0,y0]`, `[x1,y1]`, `[x2,y2]` and color `color`. Default value for `color` is white.

> INVERTDISPLAY(i)

Inverts the display according to the bool `i`.

> PRINT(s)

Prints string `s`.

> SETROTATION(r)

Sets the rotation of the display. Values for `r` can be `0`, `1`, `2`, and `3`.

> SETCURSOR(x ,y)

Sets the cursor to poition `[x,y]` in pixel.

> SETTEXTSIZE(s)

Sets the text scaling `s`.

> SETTEXTWRAP(w)

Sets the text wrap. `w = 0` disables wrapping.

> SCROLLRIGHT(start, stop)

Sets right-scrolling of the lines from `start` to `stop`

> SCROLLLEFT(start, stop)

Sets left-scrolling of the lines from `start` to `stop`

> STOPSCROLL()

Stops scrolling.

#### Example

```SmallBASIC
import teensy
import ssd1306 as display

const screenWidth = 128
const screenHeight = 64
const out = teensy.openAnalogInput(31)

display.init()
display.clear()
display.setCursor(10, 10)
display.setRotation(90)
display.invertDisplay(0)
display.setTextSize(1)
display.print(SBVER)
display.dim(10)
display.flush()
display.drawCircle(screenWidth / 2, screenHeight / 2, 24)
display.drawRect(1, 1, screenWidth - 2, screenHeight - 2)
display.drawRoundRect(2, 2, screenWidth - 4, screenHeight - 4, 20)

display.scrollRight(1, 8)
display.flush()
delay 2000

display.scrollLeft(1, 8)
display.flush()
delay 2000

display.stopScroll()

while 1
  display.setCursor(30, 30)
  display.clear()
  display.print("Temp: " + teensy.getTemp() + "c")
  display.flush()
  delay 1000
wend
```

### Miscellaneous Commands {#MiscellaneousCommands}

> t = GETTEMP()

Returns the current CPU temperature.

> s = GETCPUSPEED()

Returns current CPU speed.

> v = FREE()

Returns current free RAM. `v` is an array. First element is the
free stack, second element is the free heap.

> SETINTERACTIVE(b)

Sets the interactive mode. 

While your program is running, the Teensy will check continuously if data is available at the USB-serial port.
If data is available for longer than one second, your running program will be terminated and the queued data of the
USB-serial port will be interpreted as the new program. Once the upload is finished, the new program will be executed.
If you are using the USB-serial port for communication, read the queued data within one second. Alternative, you can turn off this behavior during runtime
setting `b` to `false`. Setting `b` to `true` will enable interactive mode.

### Unused Commands {#UnusedCommands}

The following procedures are currently not available on the Teensy:

ARC, BEEP, BLOAD, BPUTC, BSAVE, CHART, CHDIR, CHMOD, CIRCLE, DIRWALK, DRAW, 
DRAWPOLY, CLOSE, COPY, KILL, LINEINPUT, LOCK, OPEN, READ, TLOAD, TSAVE, SEEK, WRITE, INTERSECT, LINE, M3APPLY, M3IDENT, M3ROTATE, M3SCALE, M3TRANSLATION, 
MKDIR, NOSOUND, PAINT, PLAY, PLOT, POLYEXT, PSET, RECT, RMDIR, SOUND, VIEW, WINDOW, AT, LOCATE, SHOWPAGE

The following functions will return zero:

ACCESS, EOF, EXISTS, LOF, READ, FREEFILE, WRITE, PSET, ENV, RUN, TEXTHEIGHT, TXTH, TEXTWIDTH, TXTW

### Examples {#Examples}

More examples can be found at [Github](https://github.com/smallbasic/SmallBASIC/tree/master/src/platform/teensy/samples).
