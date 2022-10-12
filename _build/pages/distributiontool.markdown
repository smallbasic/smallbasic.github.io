# Distribution Tool for SmallBASIC

Package your SmallBASIC program with all the files needed and share the package with your friends.
The packages for Windows contain an exe-file for starting your program. The Linux AppImage can be directly executed. Android apk can be uploaded to the Google play store or transfered via USB to an android device.

The following packages can be created:

- Distribution Tool for Windows:
  - Package as a directory for Win64
  - Self extracting zip file for Win64
- Distribution Tool for Linux
  - Package as a directory for Win64
  - Self extracting zip file for Win64
  - AppImage for Linux
- Distribution Tool for Android
  - Signed Android apk 

## How to use

### Distribution Tool for Windows

![Screenshot of Distribution Tool](https://github.com/Joe7M/smallbasic.DistributionTool/raw/main/screenshot/screenshot.png)

- Download the newest release of the [Distribution Tool for Windows (zip file)](https://github.com/Joe7M/smallbasic.DistributionTool/releases)
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

### Distribution Tool for Linux

- Download the newest release of the [Distribution Tool for Linux (AppImage file)](https://github.com/Joe7M/smallbasic.DistributionTool/releases)
- Start the AppImage file (it might be necessary to make it executable: _chmod a+x DistributionTool*.AppImage_ )
- _Source Directory_: Directory where your SmallBASIC program and all the assets are located
- _Destination Directory_: Directory where the final packaged program should be saved
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

### Distribution Tool for Android

The Distribution-Tool for Android is so far only available for Linux and tested with Ubuntu 22.04 and Manjaro.

- Download the newest release of the [Distribution Tool for Android](https://github.com/Joe7M/smallbasic.DistributionTool/releases)
- Create a Distribution-Tool folder and copy the AppImage file to that folder 
- Install Java (and zip)
  - Ubuntu: `sudo apt install default-jdk`
  - Manjaro: `sudo pacman -S jdk-openjdk zip`
- Since google does not allow to package a fully configured Android SDK with the distribution tool, you have to download the [command-line tools for Linux](https://developer.android.com/studio/index.html#command-tools) and unzip the file to the Distribution-Tool folder. Beside the AppImage you should have a folder called cmdline-tools now.
- Start the AppImage file (it might be necessary to make it executable: `chmod a+x DistributionTool*.AppImage` ). It will download and setup all necessary Android SDK components.
- Create a key to sign your Android app. The key needs to be created only ones and can be used for all your apps. `keytool -genkey -v -keystore my-release-key.jks -keyalg RSA -keysize 2048 -validity 10000 -alias my-alias` will create a keystore called my-release-key.jks with a key called my-alias. Feel free to change the names.
- Create app icons. An easy way is to use an online icon creator, like [icon.kitchen](https://icon.kitchen/). Download the created icon set and unzip the file.
- If you want to transfer your newly created app to your android device, you have to [enable adb debugging](https://developer.android.com/studio/command-line/adb).

GUI-Interface

- _Application Name_: Name of the application on the Android device
- _Basic file_: Name of your basic file. If you have several basic files, then give the one which should be started
- _Source_: Directory where your SmallBASIC program and all the assets are located
- _Destination_: Directory where the final packaged program should be saved
- _Icon res_: Directory where the icons are located (needs to be a valid icon res-directory)
- _Keystore file_: Your keystore file
- _Keystore password_: Password for the keystore file
- _Key alias_: Alias of the key to be used for signing
- _Key password_: Password of the key
- _Transfer to device with adb after packaging_: When checked, the app will be installed on your Android device. The device must be connected to the computer using USB and adb debugging must be enabled on the device. (might not work when in a virtual machine).


### Assets

If your program needs assets like images or sounds, then please place all the assets in the same folder as your basic file or in a subfolder. Don't use absolute paths to load the assets. Instead of _C:\\MyProgram\\assets\\image.png_ please use relative paths like assets\\image.png or ./assets/image.png.

### Plugins

The official plugins (i.e. raylib, nuklear) are include in the package. If you have your own plugin please copy it to the same folder as your basic file.
