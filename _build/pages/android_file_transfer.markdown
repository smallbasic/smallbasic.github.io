# SmallBASIC File Transfer

Easy file transfer between your Android device and your desktop using WIFI.

## File Transfer in the Browser

On your Android device:

1. Enable WIFI on your mobile to access your home network.
2. In the [setup]-screen, select a font, enable extensions and give a port number, for example 5432.
3. Follow the instructions to restart SmallBASIC.
4. Open the [about]-screen to display the device IP and token.

On your desktop browser:

5. Enter http://device-ip:port. For example: http://192.168.1.5:5432.
6. You should see a login screen with "Enter your access token".
7. Enter the token as shown in the [about]-page.
8. You can now upload and download SmallBASIC files between your desktop and your mobile.

<div class="video-container">
<iframe width="1158" height="651" src="https://www.youtube.com/embed/4Daj4YflyS0" title="SmallBASIC File Transfer" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
</div>

## File Transfer in the IDE

On your Android device:

1. Enable WIFI on your mobile to access your home network.
2. In the [setup]-screen, select a font, enable extensions and give a port number, for example 5432.
3. Follow the instructions to restart SmallBASIC.
4. Open the [about]-screen to display the device IP and token.

On your desktop:

5. Start the SDL or FLTK-version of SmallBASIC
6. Navigate to the .bas file then click to begin editing.
7. Press F3, then enter the address and port as shown in the Android [about]-screen (IP-Address:PORT), for example 192.168.1.5:5432
8. Enter the token as shown in the [about]-page.
9. Once the settings are successful, you can press F4 to upload your program.

On your Android device:

10. If `EDITOR [ON]` in the three-dot menu, the uploaded program will be opened in the editor. If `EDITOR [OFF]`, the uploaded program will be executed.

At first connection after restarting SmallBASIC on your Android device, you might need to give permission for web portal access.
