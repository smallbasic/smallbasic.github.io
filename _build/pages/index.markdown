# Welcome to SmallBASIC

> one more basic

SmallBASIC is a fast and easy to learn BASIC language interpreter ideal for everyday calculations, scripts and prototypes. SmallBASIC includes trigonometric, matrices and algebra functions, a built in IDE, a powerful string library, system, sound, graphic commands and communication via serial or sockets along with structured programming syntax.

```smallbasic
' Example for using functions in SmallBASIC

s = AddStrings("My", "String")
print s

func AddStrings(a, b)
    return a + b
end
```

## Multi-platform

SmallBASIC is released for Windows, Linux and Android. It can be build from source for many other POSIX compliant operating systems including Raspberry Pi OS for the Raspberry Pi. Thanks to the build in IDE programs can be written on your Android powered tablet or mobile phone and executed immediately ([Downloads](/pages/download.html)).

Your program can be bundled with all necessary libraries to create executable files for Windows (exe-files) or Linux (AppImage). For Android a signed pkg can be created and for example distributed using Google play ([Distribute your program](/pages/distributiontool.html)).

Additionally you can start programming with the online version of SmallBASIC in your browser right now: [Start online](/online/sbasic.html).

## Editors, IDE and SmallBASIC versions

SmallBASIC comes in three different flavors for the desktop. The SDL version offers a simple but efficient IDE and is perfect for working with graphics. The FLTK version has a great IDE. The console version doesn't offer an IDE and is text-only but works perfect with plugins like raylib or nuklear ([Downloads](/pages/download.html)).

No matter which SmallBASIC version you prefer, external editors like Visual Studio Code, Geany, Sublime Text or KDE Kate can be setup for syntax highlighting or code execution ([Setup external editors](/language_support.html)).

Instructions on how to use the editor in the SDL and Android version can be found in the article [Android](/pages/android.html)

## Units

Units are sets of functions, procedures and constants bundled in a BASIC-library and can be imported in your program. Units use their own namespace and therefore are separated from your program.

```smallbasic
' Example for importing the CSS color-name unit

Import crgb as c

Color c.Black, c.Tomato
Print " Standard CSS Tomato background color "
Color c.Black, c.LightSteelBlue
Print " Standard CSS LightSteelBlue background color "

rect 200, 200, 400, 400 COLOR c.DeepPink filled
```
## Plugins

Plugins are libraries written in C which extent the functionality of SmallBASIC. SmallBASIC offers an API to write your own plugins. The following plugins are part of the release version of SmallBASIC: raylib (2D and 3D game development), nuklear (GUI programming), clipboard, gifencoder and WebSockets. You can also import a plugin for the Raspberry Pi to use the GPIO ports and some additional hardware like displays or temperature sensors.

```smallbasic
' Example how to use raylib to open a window and print text.

import raylib as rl
import raylibc as c

const screenWidth = 800
const screenHeight = 450

rl.InitWindow(screenWidth, screenHeight, "raylib [core] example - basic window")
rl.SetTargetFPS(60) 

while (!rl.WindowShouldClose())
    rl.BeginDrawing()
        rl.ClearBackground(c.RAYWHITE)
        rl.DrawText("Congrats! You created your first window!", 190, 200, 20, c.LIGHTGRAY)
    rl.EndDrawing()
wend
rl.CloseWindow()
```

## More information

Read more in the short [user guide](/pages/guide.html) or in the [SmallBASIC handbook](/pages/vade.html). See the documentation of all SmallBASIC commands in the [language reference](/pages/reference.html) or browse additional articles in the [article section](/pages/articles.html).


## News

### SmallBASIC version 12.26 has been released for Windows, Linux and web browser

::: date
| March 26, 2023
:::

For details see: [Latest release](https://github.com/smallbasic/SmallBASIC/releases/tag/12_26). Please report any issues to either the forum, email or github issues page.

### SmallBASIC version 12.24 has been released for Windows, Linux and web browser

::: date
| June 20, 2022
:::

For details see: [Latest release](https://github.com/smallbasic/SmallBASIC/releases/tag/v12.24). Please report any issues to either the forum, email or github issues page.


### New article: "Language Support" provided by Joe7M

::: date
| February 15, 2022
:::

For details see: [Language Support](/pages/language_support.html)


### SmallBASIC version 12.23 has been released

::: date
| August 31, 2021
:::

For details see: [Latest release](https://github.com/smallbasic/SmallBASIC/releases/tag/v12.23). Please report any issues to either the forum, email or github issues page.

### SmallBASIC version 12.20 has been released

::: date
| January 8, 2021
:::

This release includes new loadable modules with support for [RAYLIB](https://www.raylib.com/), [Nuklear](https://github.com/Immediate-Mode-UI/Nuklear) and WebSockets. For details see: [release notes](https://github.com/smallbasic/SmallBASIC/releases/tag/v12.20). Please report any issues to either the forum, email or github issues page.

### SmallBASIC version 12.19 has been released

::: date
| July 16, 2020
:::

For details see: [release notes](https://github.com/smallbasic/SmallBASIC/releases/tag/12_19). Please report any issues to either the forum, email or github issues page.


### New teaching resource: "Programming SmallBASIC" provided by Gerard Thomas Lab&egrave;rnia

::: date
| April 11, 2020
:::

For details see: [Articles](/pages/articles.html)

### SmallBASIC version 0.12.18 has been released

::: date
| March 16, 2020
:::

For details see: [release notes](https://github.com/smallbasic/SmallBASIC/releases/tag/0_12_18). Please report any issues to either the forum, email or github issues page.

### SmallBASIC version 0.12.17 has been released

::: date
| December 22, 2019
:::

For details see: [release notes](https://github.com/smallbasic/SmallBASIC/releases/tag/0_12_17). The windows package includes sbasici.exe which is a recreation of the previous FLTK version. Please report any issues to either the forum, email or github issues page.

### New discussion forum

::: date
| October 29, 2019
:::

The Retrogamecoding and Basicprogramming Forum is scheduled for closure on 4th of November 2019. A new forum has been created at www.syntaxbomb.com. Click the **Discuss** link above and join the discussion!

### Cool new sample program, news on progress

::: date
| June 2, 2019
:::

[Read more](/posts/2019-06-02.html)

### SmallBASIC version 0.12.14 has been released

::: date
| November 22, 2018
:::

[Read more](/pages/changelog.html)

### SmallBASIC version 0.12.13 has been released

::: date
| September 13, 2018
:::

[Read more](/posts/2018-09-13.html)

![](images/lsystem.png "Fun with lsystems")

[Samples](/pages/samples.html)

### Web site updated

::: date
| March 29, 2018
:::

[Read more](/posts/2018-29-03.html)

### SmallBASIC version 0.12.10 has been released

::: date
| December 24, 2017
:::

[Read more](/posts/2017-24-12-1.html)
