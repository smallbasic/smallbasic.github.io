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

## Programming Made Easy for All

SmallBASIC is available for various operating systems, including
Windows, Linux, and Android. You can even build it from source to run
on many other POSIX-compliant systems, such as Raspberry Pi OS for the
Raspberry Pi. With its built-in Integrated Development Environment
(IDE), you can write programs on your Android-powered tablet or mobile
phone and run them instantly. If you want to get started, you can
download SmallBASIC from our ([Downloads](/pages/download.html)) page.

SmallBASIC makes it easy to bundle your program with all the necessary
libraries, creating executable files for Windows (exe-files) or Linux
(AppImage). For Android, you can create a signed package (pkg) and
distribute it through platforms like Google Play. Learn more about
distributing your program on our ([Distribution](/pages/distributiontool.html)) page.

If you prefer an online experience, you can start programming with the
web-based version of SmallBASIC in your browser right now.
Just click on [Start online](/online/sbasic.html) to begin coding.

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
