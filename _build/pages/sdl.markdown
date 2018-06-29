# SDL

## How to use better looking fonts in the Windows version

1. Envy font

- Download <http://download.damieng.com/fonts/original/EnvyCodeR-PR7.zip>

- Unzip and copy "Envy Code R.ttf" and "Envy Code R Bold.ttf"
  into the same folder as sbasicg.exe.

2. Adobe Source Code Pro

- Download <http://dl.1001fonts.com/source-code-pro.zip>

- Unzip and copy SourceCodePro-Regular.ttf and SourceCodePro-Bold.ttf
  into the same folder as sbasicg.exe.

Note: if all of the above are present, the envy font takes precedence.

You need to restart SmallBASIC for the new font to be displayed.

## How to use better looking fonts in the Linux version

- Download the Envy or Source Code Pro fonts as per above instructions
- Copy the .ttf files to ~/.fonts.
- Invoke the following command:

$ sudo fc-cache -fv

You can select then select one if the following using the -f command line argument:

```
"Envy Code R"
"Source Code Pro"
"Ubuntu Mono"
"DejaVu Sans Mono"
"FreeMono"
"Liberation Mono"
"Courier New"
```

For example:

```
sbasicg -f "Courier new"
sbasicg --font="Liberation Mono"
```

## Keyboard shortcuts

```
[Ctrl] + [c] Break running program
[Ctrl] + [m] Show menu
[Ctrl] + [backspace] Back to launcher
[Ctrl] + [pageup] Page up scrolled display
[Ctrl] + [pagedown] Page down scrolled display
[Ctrl] + [up-arrow] Line up scrolled display
[Ctrl] + [down-arrow] Line down scrolled display
[Ctrl] + [p] Screen dump
```

## How to help design a better looking editor color theme

There are a number of color themes available in the text editor. You can switch between themes by pressing ALT+t while editing a file. When SmallBASIC starts, the last theme is read from the settings.txt file (under %APPDATA%/SmallBASIC in windows and ~/.config/SmallBASIC in linux) and when it exits the current settings are written back to the file.

The steps below should give just enough functionality to help design a better looking theme. Sorry, it's a bit of a convoluted process.

1. Start SmallBASIC, then click to edit a .bas file, then press ALT+t four times. You are now looking at the modifiable theme.
2. Exit SmallBASIC (Alt+f4).
3. Copy settings.txt into a separate file (say settings.new), then open settings.new in a programming editor
in linux:
$ cd ~/.config/SmallBASIC
$ cp settings.txt settings.new
4. Repeat: Make any changes to the hex values (see below) in settings.new, copy settings.new to settings.txt, and then restart SmallBASIC to inspect the changes.
in linux:
$ cp settings.new settings.txt && sbasicg -e foo.bas
5. Once you have something looking fantastic, email me your settings and I'll include them in the next release.

--- settings.txt ---
529,173,640,480,100,0,1,0
c8cedb,a7aebc,484f5f,a7aebc,a7aebc,00bb00,2e3436,888a85,000000,4d483b,000000,2b313a,0083f8,ff9d00,31ccac,c679dd,0083f8
...

Offsets for the above color hex values

```
0 - color
1 - selection_color
2 - number_color
3 - number_selection_color
4 - cursor_color
5 - syntax_comments
6 - background
7 - selection_background
8 - number_selection_background
9 - cursor_background
10 - match_background
11 - row_cursor
12 - syntax_text
13 - syntax_command
14 - syntax_statement
15 - syntax_digit
16 - row_marker
```
