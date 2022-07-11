# Distribution Tool for SmallBASIC

Package your SmallBASIC program with all the file needed and distribute the package to your friends.
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

- Download the newest release of the Distribution tool for Windows (zip file) [Download](https://github.com/Joe7M/smallbasic.DistributionTool/releases)
- Extract the zip file and start DistributionTool.exe
- _Source Directory_: Directory where your SmallBASIC program and all the assets are located
- _Destination Directory_: Directory where the final packaged program should be saved.
- _Name of Basic File_: The name of your basic file. If you have serveral basic files, then give the one which sould be started.
- _Name of Program (without .exe)_: The name of the final executabel file. Please don't add .exe. This will be done automaticly.
- Package Version:
  - _Windows - Package Directory_: All files are copied to a directory. You will find a .exe file for executing your program and a DATA folder
    with all necessary files. Please don't rename or delete the DATA folder.
  - _Windows - Self Extracting Archive_: A self extracting archive (using 7z) will be created. After running the archive exe a folder similar to
    Windows - Package Directory will be created.
- SmallBASIC Version:
  - _SDL2 (sbasicg)_: choose if your program is written for the SDL version of SmallBASIC
  - _Console (sbasic)_: choose if your program is witten for the console version (i.e. when using plugins like raylib or nuklear)
- Click the button _Package my Program_

### Linux

- Download the newest release of the Distribution tool for Linux (AppImage file) [Download](https://github.com/Joe7M/smallbasic.DistributionTool/releases)
- Start the AppImage file (might be necessary to make it executable: _chmod a+x DistributionTool*.AppImage_)
- _Source Directory_: Directory where your SmallBASIC program and all the assets are located
- _Destination Directory_: Directory where the final packaged program should be saved.
- _Name of Basic File_: The name of your basic file. If you have serveral basic files, then give the one which sould be started.
- _Name of Program (without .exe)_: The name of the final executabel file. Please don't add .exe. This will be done automaticly.
- Package Version:
  - _Windows - Package Directory_: All files are copied to a directory. You will find a .exe file for executing your program and a DATA folder
    with all necessary files. Please don't rename or delete the DATA folder.
  - _Windows - Self Extracting Archive_: A self extracting archive (using 7z) will be created. After running the archive exe a folder similar to
    Windows - Package Directory will be created.
- SmallBASIC Version:
  - _SDL2 (sbasicg)_: choose if your program is written for the SDL version of SmallBASIC
  - _Console (sbasic)_: choose if your program is witten for the console version (i.e. when using plugins like raylib or nuklear)
- Click the button _Package my Program_
