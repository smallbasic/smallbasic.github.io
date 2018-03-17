** How to use better looking fonts in the Windows version **

1. Envy font

- Download http://download.damieng.com/fonts/original/EnvyCodeR-PR7.zip

- Unzip and copy "Envy Code R.ttf" and "Envy Code R Bold.ttf"
  into the same folder as sbasicg.exe.

2. Adobe Source Code Pro

- Download http://dl.1001fonts.com/source-code-pro.zip

- Unzip and copy SourceCodePro-Regular.ttf and SourceCodePro-Bold.ttf
  into the same folder as sbasicg.exe.

Note: if all of the above are present, the envy font takes precedence.

You need to restart SmallBASIC for the new font to be displayed.

** How to use better looking fonts in the Linux version **

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

** Keyboard shortcuts **

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
