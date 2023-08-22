# SmallBASIC in Sublime Text

_"Sublime Text is a shareware text and source code editor available for Windows, macOS, and Linux. 
It natively supports many programming languages and markup languages. Users can customize it with
themes and expand its functionality with plugins, typically community-built and maintained under 
free-software licenses. [...] The editor utilizes minimal interface and contains features for programmers
including configurable syntax highlighting, code folding, search-and-replace supporting
regular-expressions, terminal output window, and more. It is proprietary software, but a free 
evaluation version is available." 
([wikipedia](https://en.wikipedia.org/wiki/Sublime_Text))_

![Example](https://github.com/Joe7M/smallbasic.sublimetext.syntaxcoloring/blob/main/screenshot.png)

## Installation

The files for syntax highlighting can be downloaded from [Github](https://github.com/Joe7M/smallbasic.sublimetext.syntaxcoloring/).

Copy the files in the folder "package" to the User directory in the Sublime Text package folder.
The Sublime Text package folder can be open within Sublime Text under Preferences -> Browse Packages.

## Script execution

Please edit the file `SmallBASIC.sublime-build` to configure script execution.

### Linux 

The default file launches sbasicg (SDL-version) in Linux. sbasicg must be in the search path.

```
{
	"cmd": ["cmd", "/c", "sbasicg", "-r", "$file"],
	"selector": "source.SmallBASIC"
}
```

Replace sbasicg by sbasic if you want to launch the console version. You can also include the full path.

```
{
	"cmd": ["cmd", "/c", "sbasic", "$file"],
	"selector": "source.SmallBASIC"
}
```

### Windows

Replace sbasicg by sbasicg.exe. You can include the full path if sbasicg.exe is not in the search path.

```
{
	"cmd": ["cmd", "/c", "sbasicg.exe", "-r" "$file"],
	"selector": "source.SmallBASIC"
}
```
