# SmallBASIC in Visual Studio Code

_"Visual Studio Code is a source-code editor made by Microsoft for Windows, Linux and macOS.
Features include support for debugging, syntax highlighting, intelligent code completion, snippets,
code refactoring, and embedded Git. Users can change the theme, keyboard shortcuts, preferences,
and install extensions that add additional functionality._

_In the Stack Overflow 2021 Developer Survey, Visual Studio Code was ranked the most popular
developer environment tool, with 70% of 82,000 respondents reporting that they use it." 
([wikipedia](https://en.wikipedia.org/wiki/Visual_Studio_Code))_

![Example](https://github.com/Joe7M/smallbasic.vscode.syntaxcoloring/blob/main/Screenshot.png)

## Setup Syntax Highlighting and Coloring

The VSCode extension for syntax highlighting and code snippets can be downloaded from
[Github](https://github.com/Joe7M/smallbasic.vscode.syntaxcoloring/releases) as a VSIX file. To install
the extension please select this file in the VSCode extensions section
(View -> Extensions -> ... (3 dots) -> Install from VSIX)

## Setup Code Execution

In VSCode task can be configured for your project to execute commands. To create a task go to
Terminal->Configure Task. The file task.json will be displayed (stored in your project folder in the
subfolder .vscode). Replace the content of the file with the following commands:

```json
{
    // See https://go.microsoft.com/fwlink/?LinkId=733558
    // for the documentation about the tasks.json format
    "version": "2.0.0",
    "tasks": [
        {
            "label": "Execute sbasicg",
            "type": "shell",
            "command": "sbasicg",
            "args": [
                "-r",
                "${file}"
            ],
            "problemMatcher": [],
            "group": {
                "kind": "build",
                "isDefault": true
            }
        }
    ]
}
```

You have to edit the command-keyword to point to the correct location of the sbasic executable. In Linux it could be for example:
```json
"command": "sbasicg"
```
or 
```json
"command": "/home/myname/programs/sbasicg"
```
in Windows for example:
```json
"command": "C:\Program Files\SmallBASIC\sbasicg.exe"
```

You can execute the task either by "Terminal->Run Build Task" or by pressing Ctrl+Shift+B. 
