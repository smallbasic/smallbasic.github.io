Android
=======

> Using Location, Sensor and Text to speech services. Applies to version 0.12.8 (and above)

To use the following services, your program must start with the following two lines:

```
option predef load modules
import android
```

The first line tell SmallBASIC to dynamically load runtime modules. The second line imports the android module.

## Location

GPS_ON

```
android.gps_on()
```

Instructs the system to commence recording location information. Note: This relies on the device location services being enabled by the user.

GPS_OFF

```
android.gps_off()
```

Turns off recording of location information.

LOCATION

```
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

```
const SensorAccelerometer = 0
const SensorMagneticField = 1
const SensorGyroscope = 2
const SensorLight = 3
const SensorProximity = 4
android.sensor_on(n)
```

Enables the given sensor (currently only one may be enabled at a time). Throws an exception if the given sensor is not available (for example, not all devices have a gyroscope).

SENSOR_OFF

```
android.sensor_off()
```

Disables any active sensor.

SENSOR

```
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

```
android.tts_pitch(n)
```

Sets the voice pitch (default is 1.0).

TTS_RATE

```
android.tts_rate(n)
```

Sets the rate of speaking (default is 1.0)

TTS_LANG

```
android.tts_lang(s)
```

Sets the locale, for example "en", "de", "fr" for English, German, France. May cause the system to download the language codec if not already installed.

TTS_OFF

```
android.tts_off()
```

Turns off text to speech output.

SPEAK

```
android.speak(text)
```

Performs text to speech (default is ENGLISH).

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

Note: the tool to convert source code to QR codes is here: https://github.com/smallbasic/SmallBASIC/tree/master/web/qrcode

## Playing music

PLAY("file:///sdcard/VoiceRecorder/recordings/hello.mp3")

Use the PLAY command with the prefix "file://" to play an audio track. For supported formats, see:

<https://developer.android.com/guide/appendix/media-formats.html>

## Release history

[Android changelog](android_changelog.html)

