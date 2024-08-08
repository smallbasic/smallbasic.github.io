# IOIO plugin

The IOIO is a board that provides a host machine the capability
of interfacing with external hardware over a variety of commonly
used protocols. The original IOIO board has been specifically
designed to work with Android devices. The newer IOIO-OTG
("on the go") boards work with both Android devices and PC's.
The IOIO board can be connected to its host over
USB or Bluetooth, and provides a high-level Java API on the host
side for using its I/O functions as if they were an integral
part of the client. ([IOIO website](https://github.com/ytai/ioio/wiki))

## How to learn coding for IOIO

For most of the protocols you can find a SmallBASIC example at
[Github](https://github.com/smallbasic/smallbasic.plugins/tree/master/ioio/samples).
Below is a list with all examples and an image how to wire.
If you are new to IOIO it is best to start with the first example.

A simple SmallBASIC cheatsheet is available at
[Github](https://github.com/smallbasic/smallbasic.plugins/tree/master/ioio).

For further information please visit the [IOIO website](https://github.com/ytai/ioio/wiki).

## How to setup SmallBASIC to use the IOIO plugin

Getting IOIO running on a PC (Linux) requires to build the plugin from source. This is not part of this document.

Using IOIO on Android is quite easy:

- Launch SmallBASIC and then click on "Setup".
- On the second screen, click to "Load extension modules".
- Restart SmallBASIC and then click "About". You should see: "Extension modules: enabled".
- If you have enabled Android developer options, make sure USB debugging is disabled.
- On your IOIO-OTG board, connect a power source to the VIN + GND.
  - IOIO should be powered by an external DC voltage source between 5V-15V.
  - 9V battery works well.
  - But it is better to connect a 5V power supply.
  - Instead of VIN + GND you can use the 2-pin JST Female Power Jack
- Connect a USB cable between your mobile or tablet and the board (use the included red adaptor plus another cable).
- You should see "IOIO Standard application - no installed apps".
- Launch "led.bas"
- You should see a prompt requesting permission for SmallBASIC to access the board. Click okay.
- You should then see a toast message: IOIO board access permitted.
- For this initial setup "led.bas" has now timed out. You should be able to re-launch "led.bas" for successful operation.

You have to connect power to the board, because it will act as an host and it will charge your Android device.

## Examples

### Digital output

#### LED

[led.bas](https://github.com/smallbasic/smallbasic.plugins/blob/master/ioio/samples/led.bas)

![](/images/ioio/ioioboard.png)
 
#### PWM

[pwm.bas](https://github.com/smallbasic/smallbasic.plugins/blob/master/ioio/samples/pwm.bas)

![](/images/ioio/PWM.png)
  
#### HD44780 text display

[hd44780.bas](https://github.com/smallbasic/smallbasic.plugins/blob/master/ioio/samples/hd44780.bas)

![](/images/ioio/HD44780.png)

### Digital input

[button.bas](https://github.com/smallbasic/smallbasic.plugins/blob/master/ioio/samples/button.bas)

![](/images/ioio/button.png)

### Analog input

[slider-pot.bas](https://github.com/smallbasic/smallbasic.plugins/blob/master/ioio/samples/slider-pot.bas)

![](/images/ioio/SliderPot.png)

### I2C

#### BH1750 - Ambient light sensor

[bh1750.bas](https://github.com/smallbasic/smallbasic.plugins/blob/master/ioio/samples/bh1750.bas)

![](/images/ioio/BH1750.png)

#### BME280 - Temperature and humidity sensor

[bme280.bas](https://github.com/smallbasic/smallbasic.plugins/blob/master/ioio/samples/bme280.bas)

![](/images/ioio/BME280.png)

#### MPU6050 - Accelerometer, gyroscope and temperature sensor

[mpu6050.bas](https://github.com/smallbasic/smallbasic.plugins/blob/master/ioio/samples/mpu6050.bas)

![](/images/ioio/MPU6050.png)

#### VEML6030 - Ambient-light sensor

[veml6030.bas](https://github.com/smallbasic/smallbasic.plugins/blob/master/ioio/samples/veml6030.bas)

![](/images/ioio/VEML6030.png)

#### SSD1306 - OLED with 128x64 monochrome pixels

[ssd1306.bas](https://github.com/smallbasic/smallbasic.plugins/blob/master/ioio/samples/ssd1306.bas)

![](/images/ioio/SSD1306.png)

### SPI

#### 1088AS - 8x8 dot matrix module

[duino-1088as.bas](https://github.com/smallbasic/smallbasic.plugins/blob/master/ioio/samples/duino-1088as.bas)

![](/images/ioio/duino1088as.png)

#### ST7789 - TFT controller

[st7789.bas](https://github.com/smallbasic/smallbasic.plugins/blob/master/ioio/samples/st7789.bas)

SPI is too slow on IOIO to drive a TFT display.

#### ST7735 - TFT controller

[st7735.bas](https://github.com/smallbasic/smallbasic.plugins/blob/master/ioio/samples/st7735s.bas)

SPI is too slow on IOIO to drive a TFT display.
