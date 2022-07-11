# Distribution Tool for SmallBASIC

Package your SmallBASIC program with all the files needed and share the package with your friends.
The packages for Windows contain an exe-file for starting your program. The Linux AppImage can be directly executed.

The following packages can be created:
- Distribution Tool for Windows:
  - Package as a directory for Win64
  - Self extracting zip file for Win64
- Distribution Tool for Linux
  - Package as a directory for Win64
  - Self extracting zip file for Win64
  - AppImage for Linux
  
![Screenshot of Distribution Tool](https://github.com/Joe7M/smallbasic.DistributionTool/raw/main/screenshot/screenshot.png)

## How to use

### Windows

- Download the newest release of the Distribution Tool for Windows (zip file) [Download](https://github.com/Joe7M/smallbasic.DistributionTool/releases)
- Extract the zip file and start _DistributionTool.exe_
- _Source Directory_: Directory where your SmallBASIC program and all the assets are located
- _Destination Directory_: Directory where the final packaged program should be saved.
- _Name of Basic File_: The name of your basic file. If you have several basic files, then give the one which should be started.
- _Name of Program (without .exe)_: The name of the final executable file. Please don't add .exe. This will be done automaticlly.
- Package Version:
  - _Windows - Package Directory_: All files are copied to a directory. You will find a .exe file for executing your program and a DATA folder
    with all necessary files. Please don't rename or delete the DATA folder.
  - _Windows - Self Extracting Archive_: A self extracting archive (using 7z) will be created. After running the archive exe a folder similar to
    Windows - Package Directory will be created.
- SmallBASIC Version:
  - _SDL2 (sbasicg)_: choose if your program is written for the SDL version of SmallBASIC
  - _Console (sbasic)_: choose if your program is written for the console version (i.e. when using plugins like raylib or nuklear)
- Click the button _Package my Program_

### Linux

- Download the newest release of the Distribution Tool for Linux (AppImage file) [Download](https://github.com/Joe7M/smallbasic.DistributionTool/releases)
- Start the AppImage file (it might be necessary to make it executable: _chmod a+x DistributionTool*.AppImage_)
- _Source Directory_: Directory where your SmallBASIC program and all the assets are located
- _Destination Directory_: Directory where the final packaged program should be saved.
- _Name of Basic File_: The name of your basic file. If you have several basic files, then give the one which should be started.
- _Name of Program (without .exe)_: The name of the final executable file. Please don't add .exe. This will be done automaticlly.
- _Category (for Linux)_: Choose a category for your program. When creating an AppImage the category will be used.
- Package Version:
  - _Windows - Package Directory_: All files are copied to a directory. You will find a .exe file for executing your program and a DATA folder
    with all necessary files. Please don't rename or delete the DATA folder.
  - _Windows - Self Extracting Archive_: A self extracting archive (using 7z) will be created. After running the archive exe a folder similar to
    Windows - Package Directory will be created.
  - _Linux - AppImage_: An executable AppImage will be created.
- SmallBASIC Version:
  - _SDL2 (sbasicg)_: choose if your program is written for the SDL version of SmallBASIC
  - _Console (sbasic)_: choose if your program is written for the console version (i.e. when using plugins like raylib or nuklear)
- Click the button _Package my Program_

### Assets

If your program needs assets like images or sounds, then please place all the assets in the same folder as your basic file or in a subfolder. Don't use absolute paths to load the assets. Instead of _C:\MyProgram\assets\image.png_ please use relative paths like assets\image.png or ./assets/image.png.

### Plugins

The official plugins (i.e. raylib, nuklear) are include in the package. If you have your own plugin please copy it to the same folder as your basic file.
