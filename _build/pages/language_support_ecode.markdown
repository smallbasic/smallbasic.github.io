# SmallBASIC in ecode

> Using ecode

_"ecode is a lightweight multi-platform code editor designed for modern hardware with a focus on responsiveness and performance. " ([ecode](https://github.com/SpartanJ/ecode))_

## Setup Syntax Highlighting and Coloring

When opening a .bas file in encode for the first time, you have to choose SmallBASIC as default for .bas extension instead of VisualBasic.

## Setup Code Execution

- Open a SmallBASIC file
- In the top-left corner click on the settings symbol (wrench icon)
- Add a new build-configuration
- Choose a build name, for example `sbasicg`
- In the run-section:
  - Command: `Path_to_smallbasic\sbasicg.exe`
  - Arguments: `-r ${current_doc_name}.bas`
  - If you are using Linux, then point to sbasicg or the AppImage.
  
You can run your program by pressing F5 or clicking on the run-button.