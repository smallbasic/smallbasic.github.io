# SmallBASICPiGPIO - Plugin to use the GPIO pins of a Raspberry Pi

![Logo](https://joe7m.github.io/SmallBasicPIGPIO/images/logo_smallbasicpigpio.png)

SmallBASIC-PiGPIO is a plugin for SmallBASIC to use the GPIO connector of a Raspberry Pi. The following article will give you a short introduction of the plugin. Detailed information is available on the [project website](https://joe7m.github.io/SmallBasicPIGPIO)

## Blinking LED

In this example we will connect a LED to the Raspberry Pi and let it blink with a short SmallBASIC program.


### Wiring

The wiring of the LED is shown in the following image

![LED wiring](https://joe7m.github.io/SmallBasicPIGPIO/images/LED_wiring.png)

Depending on the type of the LED you need a certain resistor. When using the LED without a resistor, you will destroy the LED and maybe even parts of your Raspberry Pi. If you want to see your LED blinking without studying to much and you don’t expect maximum brightness, then go for a resistor with 220 Ohms or even (saver) 1000 Ohms.

Connect the resistor to pin 4 and the LED to ground of the Raspberry Pi.

### Software

To let the LED blink the following SmallBASIC program can be used.

```
import SmallBasicPIGPIO as gpio

' LED is connected to pin GPIO4
const PIN_GPIO4 = 4

' Set pin as an output
gpio.GPIO_SetOutput(PIN_GPIO4)

for ii = 1 to 5
    print(ii)
    'Set GPIO pin to high -> 3.3V
    gpio.GPIO_Write(PIN_GPIO4, 1)
    delay(500)
    'Set GPIO pin to low -> ground
    gpio.GPIO_Write(PIN_GPIO4, 0)
    delay(500)
next
```

The plugin supports Pulse Width Modulation (PWM). Using this technique the intensity of the LED can tuned as shown in the next example.

```
import SmallBasicPIGPIO as gpio

' LED is connected to pin GPIO4
const PIN_GPIO4 = 4

' Set pin as an output
gpio.GPIO_SetOutput(PIN_GPIO4)

' Duty cycle is a value between 0 and 255.
' 0 -> LED is off
' 128 -> LED half brightness
' 255 -> LED max. brightness

for DutyCycle = 0 to 255 step 20
    print(DutyCycle)
    gpio.GPIO_Pwm(PIN_GPIO4, DutyCycle)
	delay(200)
next
```

## Push Buttons

Reading the state of a push button is for many Raspberry Pi project important and really easy with SmallBASIC PiGPIO.

### Wiring

In the following image you see the wiring of a push button. When you press the button, the circuit will be closed, otherwise the circuit is open. The button is connected to pin 4 and ground of the Raspberry Pi. An internal pullup resistor will be enabled automatically.

![Button wiring](https://joe7m.github.io/SmallBasicPIGPIO/images/PushButton_wiring.png)

### Software

To read the state of the button, the following example program can be used.

```
import SmallBasicPIGPIO as gpio

const PIN_GPIO4 = 4

' Set GPIO pin 4 to INPUT. When a pin is set to input,
' the internal pullup resistor will be enabled automaticly
gpio.GPIO_SetInput(PIN_GPIO4)

repeat 
	key = inkey()
	
	' Read the state of the pin. It will return 0 or 1.
	status = gpio.GPIO_Read(PIN_GPIO4)
	locate 1,1: print(status)
	
	showpage()
	delay(50)	
	
until key <> ""
```

## OLED Display

In case the Raspberry Pi is used without a big Screen, it would be great to have a small Display to print information or even show nice graphics. The plugin supports SSD1306 compatible OLED displays (quite common and really cheap).

### Wiring

For running this example, you need a SSD1306 compatible OLED display. OLEDs with 128x64 or 128x32 pixels are supported. SmallBASICPiGPIO is using the I2C-protocol for communication.

![OLED wiring](https://joe7m.github.io/SmallBasicPIGPIO/images/ssd1306_wiring.png)

### Software

The following example shows how to use basic graphic commands to draw lines or print text.

```
import SmallBasicPIGPIO as gpio

gpio.OLED1_Open()

gpio.OLED1_SetBrightness(128)

gpio.OLED1_Cls()

gpio.OLED1_Pset(10,0)
gpio.OLED1_Line(0,0,127,63)
gpio.OLED1_RoundRect(54,26,74,38,5)
gpio.OLED1_Circle(118,10,5,1,1) 'Filled with white
gpio.OLED1_Triangle(118,30, 113,45, 123,45, 1, 1) 'Filled with white

gpio.OLED1_At(0,56)
gpio.OLED1_SetTextSize(16)
gpio.OLED1_Print("SmallBASIC")

delay(2000)
gpio.OLED1_Close()

print("Done")
```

# Supported Hardware

The SmallBASIC PiGPIO pluging supports the following hardware. Support for more sensors and displays is planned.

- LED
- Push Button
- DS18B20 Temperature Sensor
- HD44780 Text LCD Display
- SSD1306 OLED Display
- BH1750 Ambient Light Sensor
- ADS1015 and ADS1115 Voltage Sensor
- SCD30 CO2, Temperature and Humidity Sensor

# Links

- [SmallBASIC PiGPIO project website](https://joe7m.github.io/SmallBasicPIGPIO/)
- [Github repository](https://github.com/Joe7M/SmallBasicPIGPIO)
- [Feedback and discussion](https://github.com/Joe7M/SmallBasicPIGPIO/discussions)
- [SmallBASIC website](https://smallbasic.github.io/)
- [SmallBASIC forum](https://www.syntaxbomb.com/smallbasic/)


