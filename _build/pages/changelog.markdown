**0.12.12 (4 Feb 2018)**

- Fix issue with creating 6D arrays
- Increased default stack size

**0.12.11 (30 Dec 2017)**

- Fix issue with image save() command to ensure resulting array has correct dimensions
- Fix issue with display driver escape ESCm (reset scroll position)
- Build with SDL2-2.0.5 to avoid issues with audio using SDL2-2.0.7

**0.12.10 (25 Dec 2017)**

- COMMON: Add support code arrays declared over multiple lines
- COMMON: Assign multiple variables from an ARRAY (1)
- COMMON: Can now declare an empty array with: a=[]
- COMMON: FUNC can now use RETURN statement as synonym for FUNCNAME=result (1)
- COMMON: Fix FUNC call as pseudo class method (1)
- COMMON: Fix PROGLINE when using multi-line strings
- COMMON: Fix handling for code array passed as function argument
- COMMON: Fix inline local variable declaration for complex assignments
- COMMON: Fix issue when LOCAL used inside while loop
- COMMON: Fix issue with INPUT command
- COMMON: Fix line number count when using multi-line strings
- COMMON: Fix potential infinite loop using the MAX command
- COMMON: Fix square bracket access to 2D arrays
- COMMON: Fix var scope errors reported by cppcheck
- COMMON: Fix win32 run regression
- COMMON: Implemented Maxint system constant (1)
- COMMON: Implemented Nil system constant (1)
- COMMON: Implemented OPTION AUTOLOCAL runtime option (2)
- COMMON: LEFT, RIGHT, REPLACE, INSTR, RINSTR no longer error on invalid pos input
- COMMON: MID command now returns blank for invalid index input
- COMMON: Now errors when using a keyword as part of a MAP variable
- COMMON: Performance optimisations
- COMMON: REPLACE str argument can now be a number type
- COMMON: SUB can now use RETURN statement
- COMMON: VAL command now ignored any input trailing non digit chars
- COMMON: dirwalk callback now provides properties path,name,depth,mtime,size,dir
- COMMON: raise error when FUNC return value not assigned
- COMMON: removed experimental reference variable concept
- COMMON: update png and editor libs
- SDL: Added F8 publish command
- SDL: Debugger only shows local variables when in SUB or FUNC
- SDL: Editor now shows navigable stack trace in error message
- SDL: Fix cursor error position when running from selected text
- SDL: Moved "Live edit" mode to editor via F8 key
- SDL: PEN OFF command now hides the cursor
- SDL: Added ALT+= command
- SDL: Update ALT+. to work with error handling
- UI: The FORM command now reports an error when IMAGE input fails to load
- UI: add missing 'Select All' menu option
- UI: shell now displays size and date columns
- ANDROID: Fix crash when displaying an alert with extended ascii chars
- ANDROID: Fix crash when exporting from IDE
- ANDROID: Fix exit when navigating to non-permitted path
- ANDROID: add missing key mappings for DEL,ESC,HOME,BRK,FN(1-12)
- ANDROID: handle screen rotation

(1) See 2048.bas for examples\
(2) OPTION AUTOLOCAL causes all variables used only inside a SUB or FUNC to have local scope.\

**0.12.9 (April 15 2017)**

- ANDROID: Allow input of special characters
- ANDROID: Added share command
- ANDROID: Fix '?' key input using gboard
- ANDROID: Select alternative font
- COMMON: Fix compile warnings from clang
- COMMON: Removed debugging output from RUN (windows build)
- COMMON: Allow array access via [] characters
- COMMON: Can now attach SUB/FUNCs as MAP fields
- COMMON: Clear out of scope CATCH variables
- COMMON: Create MAP from single line JSON without ARRAY command
- COMMON: Fix internal error handling long string variables
- COMMON: Python style here-document
- COMMON: Update parameter handling for performance
- UI: Allow input of special characters
- UI: Added "Save-As" option to the file menu (thanks Josip)
- UI: CIRCLE drawing is now anti-aliased
- UI: Fixed cursor when displaying the popup while editing
- UI: Added menu widget (three vertical dots)
- UI: Editor display cursor row/col position
- UI: Improved CIRCLE performance
- UI: Show unsaved indicator following paste
- UI: Throw error when invalid .WAV passes to PLAY

**0.12.8 (October 22 2016)**

- Added android TTS handling.
- Added android SENSOR handling.
- Added android LOCATION handling.
- Added sound. Play .WAV files using PLAY("file://" + path).
- Fixed web server file handling in windows version.
- Fixed regression with array parsing.
- Updated error message when calling built-in FUNC without assigning the result.
- Fixed TAB to use character positions not pixels.
- Fixed issue with nested try/catch.
- Fixed NOSOUND.
- Fixed error handling for invalid JOIN input.
- Fixed SPLIT to include final empty position.
- Fixed Clear keyboard buffer before pause.
- Fixed cursor display with INPUT command.
- Fixed error handling when passing arg to built-in no-arg FUNCS.
- Fixed an issue with screenshots on windows caused by path handling.

**0.12.7 (September 17 2016)**

- Fixed editor cursor flicker issue
- Fixed editor display issue with escaped quotes
- Fixed editor find dialog paste support
- Fixed editor scrolling after paste
- Fixed editor stability issues with undo/redo
- Fixed error with textScreen sub-command
- Fixed infinite loop when printing FUNC with extra args
- Fixed issue with INSTR (node/1600)
- Fixed memory access issue with JOIN (node/1586)
- Fixed memory access issue with SPRINT (node/1594)
- Fixed memory issue with REPLACE
- Fixed memory leak with LINPUT command
- Fixed screen switching when program screen has different font size
- Fixed memory access issues uncovered with new test all.bas
- Fixed value of i when FOR loop body not executed (node/1611)
- Implemented editor now allows run by selection
- Implemented editor widget now remembers the undo buffer between program runs
- Implemented editor F10 option to set the command$ variable
- Implemented editor double click to select word
- Implemented var pooling
- Updated ARRAY command to handle 2d arrays
- Updated MAP handling for performance
- Updated error message formatting
- Updated welcome screen

**0.12.6 (May, 15 2016)**

- Fix to prevent const overwriting another const
- Updated MID and REPLACE for performance
- POINT(0) and POINT(1) values now reset with each program run
- POINT(-x, -y) now provides access to the base screen image. For better
- performance use the IMAGE.SAVE sub command
- Fixes for unit case sensitivity
- Fixes for RUN/EXEC
- Fixed memory handling issues with UNITs
- Fixed memory issue related to SUB/FUNC pointers
- Removed TICKSPERSEC
- Removed BALLOC, MALLOC and VADR keywords. Removed duplicate ENVIRON
- Removed system constants BPP and VIDADR, OSNAME, LINECHART, BARCHART
- Added TIMESTAMP to return the modified-datetime of a file
- Added LSHIFT and RSHIFT bit shift operators
- SBVER now includes build information
- TICKS now returns millisecond intervals
- Refactor eval() for performance
- Fixed some memory leaks in the ui handler
- Editor now restores cursor when returning from run
- Editor now displays the correct filename in the title bar
- Added "industrial" editor theme from Shian (slot 2)
- Fixed editor highlighting
- Runtime errors now show source screen with red error highlighter
- Form refresh command now takes an boolean arg, true=push ui state to vars
- The IMAGE argument can now be PNG data stored in an INT array
- The IMAGE argument can now be x,y,w,h screen corordinates
- The IMAGE argument can now be a 2-D array of POINTS
- Updated IMAGE sub-command to save 2-D array of POINT
- Added window.setFont command to set font size, bold and italic. example:
- w = window():w.setFont(10, "pt", false, true)
- TRUE is now always returned as 1
- Added file manager to main shell program
- Fixed problem with escaped chars using FORMAT
- Fixed problem with XNOR command result
- Fixed problem with IMP and EQV command result
- Fixed issues with INKEY command to allow ALT/SHIFT/CTRL states to be returned
- Fixed capslock handling
- Fixed issues with TRY/CATCH
- Fixed using POINT to retrieve IMAGE data
- Fixed issues with CHAIN
- Fixed TLOAD to work correctly with TRY/CATCH
- Fixed XPOS and YPOS to return 0 based values
- Fixed compiler checking for redundant symbols, for example: let a = 1 2 3
- Added editor command F3+F4 - export to mobile SmallBASIC
- Added editor command ALT+. to change cursor positioning.

**0.12.5 (February 13, 2016)**

See android release notes page

**0.12.4 (February 1, 2016)**

See android release notes page

**0.12.2 (December 10 2015)**

- Implemented loading recent files via ALT+1 .. ALT+9, Display list ALT+0
- Fix potential editor crash with empty support widget
- Fix potential crash with debug target
- Fix restore path to only function when no other arguments supplied

**0.12.1 (November 29 2015)**

- Fix editor display issue with keyword completion
- Fix editor case insensitive search
- Fix image drawing for large images
- Fix PAINT infinite loop
- Fix keyboard handling for non-us keymaps
- Fix Ctrl+Home editor keystroke handler
- Fix crash with online command if site is down
- Fix over scroll issue with line number widget
- Fix screen dump invalid file name for online files
- Fix file manager .bas file case sensitivity
- Fix editor markup on map fields that look like keywords
- Fix scanner inserting line-no bytecode for empty or comment lines
- Implemented editor F2 command to display online help
- Implemented calling IMAGE with another image variable
- Implemented restoring the last folder when re-launching

**0.12.0 (October 27 2015)**

- Update PEN(3) to work more like FLTK
- Fix LET when assigning a value to a MAP/ARRAY field
- Fix display output before PEN
- Fix BOLD and ITALIC font display
- Fix TSAVE with try/catch
- Added context menu edit keyword completion
- Editor line number widget can be used for scrolling
- Updated editor help display

**0.11.20 (September 09 2015)**

Editor fixes:\
- Now displays an i-beam/edit cursor
- Fixed highlighting for numbers and keywords
- Pressing F1 key for keywords surrounded by punctuation now works correctly
- Fixed page scrolling with up/down arrow keys
- Pressing tab at the bottom no longer jumps to the top
- The editor context menu now includes additional items
- Added editor bookmark/breakpoint handling

Added a basic debugger:\
- Debugging relies on a network socket for communication between the two processes.
- You may need to accept a firewall warning to allow this communication.
- The default listening port number is 4000. This can be changed with a startup option, for example:
  sbasic -p 4001\

To debug a program:\
- Turn on editing. Display the context menu (right mouse click), then click the "Editor" option. It should
it show "Editor [ON]" when you next re-display the context menu.
- Navigate to a .BAS file, then click the file name. This should display the program in the editor.
- Press F5. A new window should appear.
- Press F6 to step thru each program line, or press F7 to continue
- Press ESC to end the debugging session.
- To set a breakpoint, press Ctrl+T (C-t) on the desired program line.
- The breakpoint doubles as a bookmark. Press (C-g) to goto the next bookmark/breakpoint line.
- Now when you press F7 in a debug session, the program will pause at the breakpoint line.

Debugger limitations:\
- The variables/stack data is currently unnamed.
- The bytecode includes redundant line information for full comment lines

**0.11.19 (August 19 2015)**

- Fix display output before DELAY
- Fix LET command problem found in 32bit linux
- Removed obsolete/unimplemented keywords WSPLIT, PLOT2, UNLOADLIB
- Made a few minor performance improvements
- Fixed PRINT 1/1000 and other floating point rounding issues
- Fixed problem with 59 char INPUT prompt
- Added missing PEN(12) support
- Added multi-item case selection (suggestion by James Grimaldi)
- SDL: Updated display of file anchor links
- SDL: Fix drag-drop from explorer to launch programs
- SDL: Added missing IDE editor

Example for multi-item case selection:

```
select case "Cool"
 case "null", 1,2,3,4,5,6,7,8,"Cool","blah"
 case "not cool"
   throw "epic fail"
  case else
   throw "FAIL"
end select
```

**0.11.18**

Windows:

- Pressing the [Backspace] key will now re-display the launcher when a program has completed.
- The startup font size is now based on logical point size of 11 points. You may need to change your Zoom setting to account for this change.
- The window title now correctly displays the BASIC program file name.
- Fixed a regression with returning system memory information (Command FRE)
- Workaround for incorrect mouse cursor displayed at startup when double clicking in explorer to start.

**0.11.17**

Android:

- Now uses the Light Holo theme to display menus and messages.
- Fixed exit crash with android 5 devices.
- Updated to freetype version 2.5.5 and NDK version r10d

Desktop:

New SDL2 port is ready

General:

- Improved graphics and runtime performance.
- Source code view displays line numbers
- Line drawing now uses antialiasing to produce smoother looking lines. You can turn this feature off by placing the following statement at the start of your program:

~~~
Option Predef Antialias OFF
~~~

- Improved syntax error messages
- Updated the PAUSE statement to allow waiting until a system event has occurred. This allows you to pause execution until there is a touch or mouse event, without any CPU usage overhead. To use this feature, pass TRUE as the PAUSE argument, i.e. PAUSE TRUE.
- Improved INPUT widget including clipboard handling.
- Update INKEY to return ALT, CTRL, ALT+CTRL key information
- Added timer func support. When called as a function, the TIMER keyword accepts two arguments: a timeout value (in milliseconds) and the name of a call back FUNC. Note the timeout value only provides approximate millisecond precision.

```
Sub timer_func
    print "Timer called: ", Timer
End

Timer(5000, timer_func)
Print "Starting..."

While 1
  Pause 1
  Print "paused..."
Wend
```

- Refactor FORM handling to use system object

```
REM create a form widget
input1.x = n
input1.y = n
input1.width = n
input1.height = n
input1.value
input1.label
input1.type  - [label|link|listbox|choice|text|button|image
input1.name - file name for image button type
input1.backgroundColor
input1.color
input1.visible
input1.selectedIndex
input1.length
input1.noFocus
input1.onclick = func

REM creates a form object
f.input << input1
var f = form(f)

REM
f.value = "text"
f.focusColor = "green"

REM push messages through the system event queue
f.doEvents()

REM close the form
f.close()
```

Please refer to examples: memoryTest.bas, calc.bas, sokoban.bas\

- Update IMAGE handling.

There are two supported image formats PNG and XPM. PNG images can to be
loaded using the OPEN command, or by passing the filename string as an argument
to the Image creator function. XPM images can also optionally be passed as a string
argument to the Image creator function.

```
REM Use the OPEN statement to open the image file
Open "1234.png" as #1

REM create an IMAGE object
i = Image(#1)

REM Display the image - passing optional x, y, zindex, opacity attributes
i.Show([x, y [, zindex [, opacity]]])

REM change the image attributes
i.x = 100
i.y = 10
i.offsetTop = 1
i.offsetLeft = 1
i.width = 100
i.height = 100
i.zindex = 0
i.opacity = 0

REM display the image with current attributes
i.Show()

REM hide the image
i.Hide()

... print the image details
PRINT i

REM create an XPM image
ar << "30 30 770 2"
ar << "  	c None"
ar << ". 	c #5B3015"
...
ar << ". + @ # $ @ % & * = - ; > , ' ) ! ~ { ] ^ / ( _ : < [ } | 1 "
...
i2 = image(ar)
i2.x=15
i2.y=15
i2.zindex=1
i2.show()
```

- Added WINDOW system object to control the ansiwidget\

```
REM create a window object
w = Window()

REM Create a status message
w.status("Hello")

REM draw into an inset screen
w = window()
w.insetTextScreen(5,10,90,90)
for i = 0 to 200
  ? "This is in the text screen"
next i

REM display in the text based screen
w.textScreen()
print "This is the text mode screen"

REM switch between graphics screens
w = window()
print "on screen1... pausing"
pause
w.graphicsScreen2()
print "on screen 2.... pausing..."
pause
w.graphicsScreen1()
print "back to 1"

REM  display an alert
local wnd = window()
local msg = "You must restart SmallBASIC for this change to take effect"
wnd.alert(msg, "Restart required")

REM Display a menu
local w = window()
w.menu("one", "two", "three")

REM Display the keypad
local w = window()
w.showKeypad()
```

**0.11.16**

This release includes language and performance improvements.

Variables:

The MAP variable type combines the features of previously separate "User Defined Structures" and "Associated Array" variables. The MAP provides value-key pair access along with array or dotted notation. The MAP can be initialized from a String variable using the ARRAY command. The ARRAY command supports JSON (Javascript object notation) syntax.

The MAP can be converted back into a JSON string using the STR command. You can test whether a variable is a MAP using the ISMAP command.

The ARRAY command can be used to process web services results. For example: https://raw.githubusercontent.com/smallbasic/SmallBASIC/master/samples/distro-examples/devio/google.bas

The REF variable type is a "reference" to another variable (like a pointer in c). You create a reference by assigning a variable with the BYREF keyword (or @ symbol). For example LET c = @ b. You can test whether a variable is a reference using the ISREF command.

Commands:

The IMGW and IMGH commands have been replaced with the single IMAGE command. IMAGE takes a file pointer and returns a system object allowing full control of the image placement. Note: In this release only the language aspect has been implemented. This feature will be completed in the next build.

Added the SHOWPAGE command. This command is used to display pending graphics operations allowing for smooth animations.

Added TRY/CATCH support - see http://smallbasic.sourceforge.net/?q=node/1229

Compiler:

- It is now possible to use unary-operators on array elements, for example a(0)++.
- Handling of round brackets with FUNC calls has been fixed.
- Renamed command "#UNIT-PATH:" to "UNITPATH"
- Renamed command "#INC:" to "INCLUDE"
- Fixed/implemented INCLUDE command.
