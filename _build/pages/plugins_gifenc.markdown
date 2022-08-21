# Gifenc - Create animated gif images

## About the plugin

Gifenc lets you create simple animated gif images. It is based on a c library created by lecram. See Github [gifenc](https://github.com/lecram/gifenc/tree/87acd487dfa2f2a638eec751a1d6c2fff60822da)

## Using the plugin

The plugin can be used by importing it with `import gifenc`. A simple program creating a moving stripe pattern with 8 frames looks like this:


```
import gifenc as ge

const w = 120
const h = 90
const palette = [0x00, 0x66, 0x00, & ' 0 -> black
                 0xFF, 0x00, 0x00, & ' 1 -> red
                 0x22, 0xFF, 0x00, & ' 2 -> green
                 0x00, 0x00, 0xFF]   ' 3 -> blue
const bgIndex = -1 ' none
const loopCount = 0 ' infinity
const delay = 10 ' in 1/100 s

const gif = ge.create("example.gif", w, h, palette, bgIndex, loopCount)

for i = 0 to 8
  frame = []
  for j = 0 to w * h
    frame << (i * 3 + j) / 6 % 4
  next j
  ge.add_frame(gif, delay, frame)
next i

ge.close(gif)
```

_w_ and _h_ contain the width and the height of the image. _palette_ is an array of colors. Three successive values represent the red, green and blue component of the color. _bgIndex_ defines which of the colors in _palette_ should be set as a background color. If set to -1 the background is transparent. _loopCount_ defines the number of times the animation should be repeated. If set to zero, the animations will repeat endless. The _delay_ parameter  specifies how long the frame will  be shown, in hundredths of a second. For example, `delay = 100` means one second, and `delay = 25` means a quarter of a second. Each frame of the gif is stored in an 1D array with _w_ times _h_ elements. Every element defines the color index (from _palette_ ) of the corresponding pixel.

## Supported Commands

### CREATE

> gif = create(fileName, w, h, palette, bgIndex, loopCount)

**fileName** (String): file name  
**w, h**: width and height of the image in pixel  
**palette**: 1D-array containing the colors `[r1,g1,b1, r2,g2,g3, ...]`  
**bgIndex**: index of the background color  
**loopCount**: Number of loops of the animation, -1 -> endless  
**gif**: object with ID of the gif image

Creates a gif object and returns the ID.

### ADD_FRAME

> add_frame(gif, delay, frame)

**gif**: gif object with ID  
**delay**: delay in hundredths of a second  
**frame**: 1D-array containing the pixel data  

### CLOSE

> close(gif)

**gif**: gif object with ID

Closes the gif and writes it to hard drive.

