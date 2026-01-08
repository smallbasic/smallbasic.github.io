# SmallBASIC in jEdit

> Using jEdit

_"jEdit is a free software text editor available under GPL-2.0-or-later. It is written in Java and runs on any operating system with Java support, including BSD, Linux, macOS and Windows. " ([wikipedia](https://en.wikipedia.org/wiki/JEdit))_

![Example](https://github.com/smallbasic/smallbasic.syntax-highlighting/raw/main/jedit/screenshot.png)

## Setup Syntax Highlighting and Coloring

- Download the file `smallbasic.xml` from [Github](https://github.com/smallbasic/smallbasic.syntax-highlighting/tree/main/jedit)
- Start jedit
- Go to `Utilities -> Global Options -> Editing -> Edit Modes`
- In the section `Add Mode` create a new mode:
  - Mode Name: 'smallbasic'
  - Select Mode File: select `smallbasic.xml`
  - File Name Glob: `*.bas`
  - First Line Glob: leave empty
- Click button `Add Mode`

Tip: In `Utilities -> Global Options -> Editing -> Edit Modes` you can remove `vbscript` from the section `Selected modes` to make SmallBASIC the standard syntax highlighting for bas files.
