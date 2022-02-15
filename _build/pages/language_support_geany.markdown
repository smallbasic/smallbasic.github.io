# SmallBASIC in Geany

> Using Geany

_"Geany is a free and open-source lightweight GUI text editor using Scintilla and GTK, including basic
IDE features. It is designed to have short load times, with limited dependency on separate packages or
external libraries on Linux. It has been ported to a wide range of operating systems, such as BSD,
Linux, macOS, Solaris and Windows. The Windows port lacks an embedded terminal window; also missing
from the Windows version are the external development tools present under Unix, unless installed
separately by the user. Among the supported programming languages and markup languages are C, C++,
C#, Java, JavaScript, PHP, HTML, LaTeX, CSS, Python, Perl, Ruby, Pascal, Haskell, Erlang, Vala and
many others." ([wikipedia](https://en.wikipedia.org/wiki/Geany))_

![Example](https://github.com/Joe7M/smallbasic.geany.syntaxcoloring/raw/main/Screenshot.png)

## Setup Syntax Highlighting and Coloring

Download the file "filetypes.freebasic" from [Gitub](https://github.com/Joe7M/smallbasic.geany.syntaxcoloring) and copy it to:

- Linux: ~/.config/geany/filedefs/
- Windows: _"Installation directory of Geany"_\data\filedefs

## Setup Code Execution

A click on the icon for compiling will execute the program. You have to setup the correct path for your sbasic-executable file (Build->Build commands)

