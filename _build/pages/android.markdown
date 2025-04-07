Android
=======

> SmallBASIC for Android guide

The Android version of SmallBASIC comes with a built-in Integrated Development Environment
(IDE), you can write programs on your Android-powered tablet or mobile phone and run them instantly.

## Getting started

In the video below the basic steps of creating a file, opening it in the internal editor and executing
the program are shown.

<div class="video-container">
<iframe width="1160" height="653" src="https://www.youtube.com/embed/2fW7usYY_CA" title="SmallBASIC &quot;Hello World&quot;" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
</div>

Please note, that at the first start of the Android version of SmallBASIC, the editor is turned off. A tap on
a program name will start it immediately. If you want to edit the file, please turn on the editor by tapping
on the three dots in the lower right corner and choosing the entry `Editor [OFF]` to enable the editor.

## Step-by-Step Guide

![](/images/android_menu1.png "System Menu button")

The items displayed depend on whether the file browser, code editor or a running program is active.

![](/images/android_menu2.png "System Menu")

When the file browser is active you should see an "Editor" item followed by either [ON] or [OFF]. If it shows "OFF" then press the item to switch it to "ON".

Before you start editing a program you should navigate to the "SmallBASIC" folder. You can get there by pressing "[Go Up]" until you hit the root level  "/". You should then see an entry for "SmallBASIC". If there's not enough room to display the entire text it might appear as something like "storage/emulated/0/SmallBAS~". You may need to accept a permission request to allow access to this folder when you first launch SmallBASIC for the first time. Also make sure you **do not** select the internal "net.sourceforge.smallbasic" folder since this could be overwritten in a future SmallBASIC update.

![](/images/android_navigate.png "System Menu")

Now press the "[File]" link in the top left corner of the screen. This will take you to the file manager. From here you can enter a file name then press "[New]" to create it. Now press "[<<]" to exit the file manager.

![](/images/android_create_file.png "System Menu")

Your new file should be listed in the file browser. Press the file name link. You should finally see the program editor. If the keypad does not appear, press the system menu button and select "Show Keypad". For best results you may need to install a separate keyboard. "AnySoftKeyboard", "Hacker's Key" and "GBoard" all seem to work well.

Start typing out your program. When you are ready to test your program, press the system menu button then select "Run".

In the help screen, the ">" characters on the left are buttons to expand (or contract) the help item contents. In the editor, the line number display also functions as a scrollbar. If you want to write a quick experimental program you can use the "[Scratch]" option to bypass the above file name setup steps.

![](/images/android_scroll.png "System Menu")

All of the above UI elements are written in SmallBASIC, see [main.bas](https://github.com/smallbasic/SmallBASIC/blob/master/src/platform/android/app/src/main/assets/main.bas)

## Using Location, Sensor and Text to speech services.

To use the following services, your program must start with the following two lines:

```smallbasic
option predef load modules
import android
```

The first line tell SmallBASIC to dynamically load runtime modules. The second line imports the android module.

## Location

GPS_ON

```smallbasic
android.gps_on()
```

Instructs the system to commence recording location information. Note: This relies on the device location services being enabled by the user.

GPS_OFF

```smallbasic
android.gps_off()
```

Turns off recording of location information.

LOCATION

```smallbasic
l = android.location()
```

Returns a MAP variable holding the following details:

- latitude - the latitude, in degrees.
- longitude - the longitude, in degrees.
- speed - the speed if it is available, in meters/second over ground.
- accuracy - the estimated accuracy of this location, in meters.
- altitude - altitude if available, in meters
- bearing - the bearing, in degrees
- provider - whether data obtained from GPS or network

Note: the location data is updated internally at 1 second intervals.

For more details, see: <https://developer.android.com/reference/android/location/Location.html>

## Sensor

SENSOR_ON

```smallbasic
const SensorAccelerometer = 0
const SensorMagneticField = 1
const SensorGyroscope = 2
const SensorLight = 3
const SensorProximity = 4
android.sensor_on(n)
```

Enables the given sensor (currently only one may be enabled at a time). Throws an exception if the given sensor is not available (for example, not all devices have a gyroscope).

SENSOR_OFF

```smallbasic
android.sensor_off()
```

Disables any active sensor.

SENSOR

```smallbasic
s = android.sensor()
```

Returns a MAP variable holding sensor details.
x, y, z - The spatial position
light - (SensorLight)
distance - (SensorProximity)

For more details, see:

- <http://i.stack.imgur.com/skBui.jpg>
- <https://developer.android.com/reference/android/hardware/SensorEvent.html>

## Text to speech

Output data as spoken text.

Notes:
- The text to speech module takes a moment to initialise. This is performed the first time you call SPEAK.
- You may want to turn off the system setting to send TTS usage statistics to google before using this feature.

TTS_PITCH

```smallbasic
android.tts_pitch(n)
```

Sets the voice pitch (default is 1.0).

TTS_RATE

```smallbasic
android.tts_rate(n)
```

Sets the rate of speaking (default is 1.0)

TTS_LANG

```smallbasic
android.tts_lang(s)
```

Sets the locale, for example "en", "de", "fr" for English, German, France. May cause the system to download the language codec if not already installed.

TTS_OFF

```smallbasic
android.tts_off()
```

Turns off text to speech output.

SPEAK

```smallbasic
android.speak(text)
```

Performs text to speech (default is ENGLISH).

## HTTPS Web request

```smallbasic
android.request(url, [postData, authToken])
```

- `url`: The URL endpoint for the request.
- `data` (optional): Data to send in the request body. If provided, the request method is `POST` with `Content-Type: application/json`. If omitted, the request method defaults to `GET`.
- `token`: (optional): Bearer authentication token for a `POST` request.

The `REQUEST` function enables making HTTPS requests (either `POST` or `GET` methods), supporting secure connections that are not possible with the `OPEN` command.

**Note**: For desktop versions, you can utilize the `RUN` command with `curl` for similar functionality.

```
import android

const endpoint = "https://llamafile/v1/chat/completions"
const apiKey = "no-key"

func request(content)
  local post_data
  dim post_data.messages(0 to 1)
  post_data.model = "gpt-3.5-turbo"
  post_data.messages[0].role = "system"
  post_data.messages[0].content = "You are a helpful assistant"
  post_data.messages[1].role = "user"
  post_data.messages[1].content = content
  return array(android.request(endpoint, post_data, apiKey))
end 

while 1
  input "Question: ", prompt
  response = request(prompt)
  print response.choices[0].message.content
wend
```

The code snippet demonstrates how to use REQUEST to interact with a specified endpoint, providing necessary data and token for authentication.


## How to edit and run a program

### Internal editor:
- Display the menu, then click Editor [ON]
- Tap a file name in the browser.

### Desktop SmallBASIC
- Enter the port number in the setup screen.
- Connect your desktop machine and your mobile device to the same wifi network.
- Launch desktop SmallBASIC.
- Right click and select "Editor [ON]".
- Navigate to the .bas file then click the link to begin editing.
- Press F3, then enter the address shown in the android about screen (IP:PORT).
- Enter the security code, then press enter.
- Once the settings are successful, you can press F4 to upload your program again.

### File browser:
- Write and debug the program with desktop SmallBASIC.
- Copy the .bas file to your SDCard.
- Launch SmallBASIC, then navigate to the file in the built-in file browser, then tap the link to run.
- or, navigate to the file in the system file browser, then tap the link to start SmallBASIC and run the program.

### Separate editor on device:
- Write your SmallBASIC program in a separate editor on your device.
- Task switch to SmallBASIC, then run the program using the built-in file browser.

### Web Service:
- Enter the port number in the setup screen.
- Connect your desktop machine and your mobile device to the same wifi network.
- Launch a desktop browser then enter http://:
- A simple web page is displayed. Enter your SmallBASIC program then click run.

### QRcode:
- Write and debug the program with desktop SmallBASIC.
- Convert the program to an QRCode image.
- Scan the QRCode in the separate decoder program.
- Click okay to launch SmallBASIC and the encoded program.

Note: the tool to convert source code to QR codes is here: [qrcode](https://github.com/smallbasic/SmallBASIC/tree/master/web/qrcode)

## Playing music

PLAY("file:///sdcard/VoiceRecorder/recordings/hello.mp3")

Use the PLAY command with the prefix "file://" to play an audio track. For supported formats, see:

<https://developer.android.com/guide/appendix/media-formats.html>

## Release history

[Android changelog](android_changelog.html)


## Privacy Policy [](#privacy-policy)

[Privacy Policy](privacy.html)

