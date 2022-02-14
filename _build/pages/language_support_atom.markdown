# SmallBASIC in Atom

_"Atom is a free and open-source text and source code editor for macOS, Linux, and Microsoft Windows with
support for plug-ins written in JavaScript, and embedded Git Control. Developed by GitHub, Atom is a desktop
application built using web technologies. Most of the extending packages have free software licenses and are
community-built and maintained. Atom is based on Electron (formerly known as Atom Shell),a framework that
enables cross-platform desktop applications using Chromium and Node.js.Atom was initially written in
CoffeeScript and Less, but much of it has been converted to JavaScript._

_Atom was released from beta, as version 1.0, on 25 June 2015. Its developers call it a "hackable text editor
for the 21st Century", as it is fully customizable in HTML, CSS, and JavaScript." 
([wikipedia](https://en.wikipedia.org/wiki/Atom_(text_editor)))_

![Example](https://github.com/Joe7M/smallbasic.atom.syntaxcoloring/blob/main/Screenshot.png)

## Setup Syntax Highlighting and Coloring

The Atom package for syntax highlighting and code snippets can be installed with the build in package manager.
Go to "Edit->Preferences->Install". Search for "lang-smallbasic" and install the package.

## Setup Code Execution

To execute the bas-file, a package for command execution needs to be installed. Please search for
"atom-shell-commands" and install it. Next you have to open the atom config-file "Edit->Config". Insert the
following code into "config.cson":
```cson
"atom-shell-commands":
    commands: [
      {
        name: "run"
        command: "C:/Users/Joe7M/Documents/SmallBASIC/bin/sbasicg.exe"
        arguments: [
          "-r"
          "{FileName}"
        ]
        options:
          cwd: "{FileDir}"
          keymap: "f8"
          save: true
      }
    ]
```
Afterwards your config.cson file should look similar to this:
```cson
"*":
  "atom-shell-commands":
    commands: [
      {
        name: "run"
        command: "C:/Users/Joe7M/Documents/SmallBASIC/bin/sbasicg.exe"
        arguments: [
          "-r"
          "{FileName}"
        ]
        options:
          cwd: "{FileDir}"
          keymap: "f8"
          save: true
      }
    ]
  core:
    telemetryConsent: "no"
  "exception-reporting":
    userId: "xxxx-xxxx-xxxx-xxxx"
  "exec-in-cmd":
    terminal: "konsole"
  welcome:
    showOnStartup: false
```
Please edit the following line to match your system, for example in Windows:
```cson
command: "C:/Users/Joe7M/Documents/SmallBASIC/bin/sbasicg.exe"
```
please use "/" in Windows instead of the usual "\\".

In Linux:
```cson
command: "/home/Joe7M/SmallBASIC/bin/sbasicg"
```

With 
```cson
keymap: "f8"
```
you can choose the key to execute the script.

After successful installation you can start the SmallBASIC file by pressing F8 or by "Packages->Atom Shell Commands->run"
