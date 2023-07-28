# CSS Color Names

SmallBASIC uses the standard colors 1 to 15, which might be quite limiting. To define your own colors
the functions RGB und RGBF can be used. A nice source of predefined colors are the standard CSS colors used for website creation.
A list of the colors and there names can be found [here](https://www.w3schools.com/colors/colors_groups.asp]). To make it easier to
deal with the color names SmallBASIC provides a unit.

## Download the unit

The unit can be downloaded or copy pasted from the [SmallBASIC Github website](https://github.com/smallbasic/smallbasic.plugins/blob/master/units/crgb.bas).
Please save the unit in the same directory as your basic file. The file [crgb_test.bas](https://github.com/smallbasic/smallbasic.plugins/blob/master/units/crgb_test.bas)
can be used to display all colors and there names.

## Using the unit

```Freebasic
Import crgb as c

Color c.Black, c.Lime
Cls

Color c.Black, c.Tomato
Print " Standard CSS Tomato background color "

Color c.Black, c.LightSteelBlue
Print " Standard CSS LightSteelBlue background color "

rect 200, 200, 400, 400 COLOR c.DeepPink filled
```

