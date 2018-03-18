## Android ChangeLog ##
::: siteSub ::
[Home](/pages/index.html) > [Articles](/pages/articles.html)
:::

**0.12.11 30 Dec, 2017**

- Fix issue with image save() command to ensure resulting array has correct dimensions
- Fix issue with display driver escape ESCm (reset scroll position)
- Fix potential crash when passing non string arguments to some built-in string funcs

**0.12.10 24 Dec, 2017**

- ANDROID: Fix crash when exporting from IDE
- ANDROID: Fix exit when navigating to non-permitted path
- COMMON: Add support code arrays declared over multiple lines
- COMMON: Assign multiple variables from an ARRAY (1)
- COMMON: Can now declare an empty array with: a=[]
- COMMON: FUNC can now use RETURN statement as synonym for FUNCNAME=result (1)
- COMMON: Fix FUNC call as pseudo class method (1)
- COMMON: Fix inline local variable declaration for complex assignments
- COMMON: Fix issue with INPUT command
- COMMON: Fix line number count when using multi-line strings
- COMMON: Fix potential infinite loop using the MAX command
- COMMON: Fix square bracket access to 2D arrays
- COMMON: Implemented Maxint system constant (1)
- COMMON: Implemented Nil system constant (1)
- COMMON: Implemented OPTION AUTOLOCAL runtime option (2)
- COMMON: MID, LEFT, RIGHT, REPLACE, INSTR, RINSTR no longer error on invalid pos input
- COMMON: Now errors when using a keyword as part of a MAP variable
- COMMON: Minor performance optimisations
- COMMON: REPLACE str argument can now be a number type
- COMMON: SUB can now use RETURN statement (1)
- COMMON: VAL command now ignores any input trailing non digit chars
- UI: The FORM command now reports an error when IMAGE input fails to load

(1) See 2048.bas for examples\
(2) OPTION AUTOLOCAL causes all variables used only inside a SUB or FUNC\
    to have local scope.

**0.12.9 April 15, 2017**

- Allow input of special characters
- Added share command
- Fix '?' key input using gboard
- Select alternative font
- Allow array access via [] characters
- Can now attach SUB/FUNCs as MAP fields
- Clear out of scope CATCH variables
- Create MAP from single line JSON without ARRAY command
- Fix internal error handling long string variables
- Python style here-document
- Update parameter handling for performance
- Added "Save-As" option to the file menu (thanks Josip)
- CIRCLE drawing is now anti-aliased
- Fixed cursor when displaying the popup while editing
- Added menu widget (three vertical dots)
- Improved CIRCLE performance

**0.12.8 October 22, 2016**

- Added android TTS handling
- Added android SENSOR handling
- Added android LOCATION handling
- Added sound. Play .WAV files using PLAY("file://" + path)
- Fixed regression with array parsing
- Updated error message when calling built-in FUNC without assigning the result
- Fixed TAB to use character positions not pixels
- Fixed issue with nested try/catch
- Fixed NOSOUND
- Fixed error handling for invalid JOIN input
- Fixed SPLIT to include final empty position

**0.12.7 September 17, 2016**

- Updates to improve performance and stability
- Fixed issues with various keywords
- See "desktop release notes page":http://smallbasic.sourceforge.net/?q=node/1246 for details.

**0.12.6 May 15, 2016**

- Updates to improve performance and stability
- Fixed issues with various keywords
- See "desktop release notes page":http://smallbasic.sourceforge.net/?q=node/1246 for details.

**0.12.5 February 13, 2016**

- Fix POINT to return correct values
- Added "Desktop shortcut" menu option

**0.12.4 February 1, 2016**

- Fix pause and resume handling, see http://smallbasic.sourceforge.net/?q=node/1377
- Added caching of online samples to avoid reloading over the network
- Pressing the back button from an online sample now returns to the samples home page
- The shell program now does case-less .bas file sorting

**0.12.1 November 29, 2015**

- Fix image drawing for large images
- Fix PAINT infinite loop
- Fix crash with online command if site is down
- Fix over scroll issue with line number widget
- Fix file manager .bas file case sensitivity
- Fix editor markup on map fields that look like keywords
- Fix scanner inserting line-no bytecode for empty or comment lines
- Fix editor run error message display time length
- Implemented calling IMAGE with another image variable

**0.12.0 October 26, 2015**

- Added built-in editor
- Fix display output before DELAY
- Fix LET when assigning a value to a MAP/ARRAY field
- Fix TSAVE with try/catch
- Fix PRINT 1/1000 and other floating point rounding issues
- Fix problem with 59 char INPUT prompt
- Removed obsolete/unimplemented keywords WSPLIT, PLOT2, UNLOADLIB
- Added multi-item case selection

**0.11.17 March 22, 2015**

- Now uses the Light Holo theme to display menus and messages.
- Fixed exit crash with android 5 devices.
- Updated to freetype version 2.5.5 and NDK version r10d
- Improved graphics and runtime performance.
- Source code view displays line numbers
- Source code view displays error information for program error line
- Line drawing now uses antialiasing to produce smoother looking lines.
- Improved syntax error messages
- Updated the PAUSE statement to allow waiting until a system event has occurred
- Improved INPUT widget including clipboard handling.
- Update INKEY to return ALT, CTRL, ALT+CTRL key information
- Added timer func support.
- Refactor FORM handling to use system object
- Update IMAGE handling
- Added WINDOW system object to control the ansiwidget

See the "Release notes":http://smallbasic.sourceforge.net/?q=node/1246 article for more information

**0.11.11 July 28, 2014**

- Fix build to use correct processor optimisations
- Fix rotation crash
- Updated display handling for long clickable links
- Updated system menu
- Text size now based on system settings

**0.11.10 July 19, 2014**

- Add missing SD card read/write permissions
- Updated FRE command. -10 = Total RAM, -11 = Used, -12 = Free

**0.11.9 July 17, 2014**

- Fix crash in android 4.4 (tested by Joey and using AVD)

**0.11.8 July 16, 2014**

- Fix crash in android 4.4 (tested using AVD)
- Built with latest ADK

**0.11.7 July 12, 2014**

- Fix crash in android 4.4
- Sound now uses the music/games stream

**0.11.6 June 22, 2014**

- Implemented BEEP/SOUND. Only background play mode is supported.
- Implemented launch by URL. This allows SmallBASIC programs to be embedded in a QR code and launched from a separate QR code reader program. The URL format is smallbasic://x/CODE. CODE can URL encoded text, or BASE64 gzipped text. I'll make a web page to create the image if there is enough interest. Note, programs launched via QR codes will not be able to execute any of the FILE based commands.
- Implemented screen layout handling to adjust the display when the virtual keypad is displayed.
- Fixed potential crash evaluating "a \\ b".
- Fixed a display issue when scrolling beyond the virtual screen size.
- The printed Web Service information now includes the system IP address.
- Updated support tools; android-ndk-r9d, freetype-2.5.3, libpng-1.6.12.

**0.11.5 Jan 4, 2014**

- Replaced battery drain error with console warning.
- Console is now a graphics screen.
- Fixed minor display and event handler bugs affecting some samples programs.

**0.11.4 Dec 18, 2013**

- Built with android NDK for performance and to allow future versions to use native app features.
- Added web service for remote file edit/run.
- Can now launch bas files from Android file browser.
- Added restart command.
- Supports empty parentheses in sub/func calls.

**0.11.3 Dec 19, 2012**

- AT and PEN now work with WINDOW based coordinates. This will allow programs written
  for PalmOS to appear correctly on modern mobile screen resolutions.

**0.11.2 Dec 8, 2012**

- Added the ability to change the font size

**0.11.1 Nov 30, 2012**

- First android release, built with Mosync
