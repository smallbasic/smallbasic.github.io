---
permalink: /630
layout: post
title:  "RGBF"
categories: graphics
---
Graphics

RGBF (r, g, b)

Returns the RGB color codes for the specified values. Takes values 0..1 for each of the color.


The return value is a negative 24bit value to by used by drawing functions.

```

' gray() accepts the same values as Rgb(), i.e. 0..255:
Func gray(r, g, b)
  Local Const RGBF_SCALE = 1 / 255
  Local n
  
  n = Sum(r * 0.30, g * 0.59, b * 0.11) ' gray=(30% red + 59% green + 11% blue)
  n *= RGBF_SCALE ' scale 0..255 palette to 0..1 (for Rgbf)
  gray = Rgbf(n, n, n)
End

Print "An example for printing colors in gray-scale:"
Print
For i = 0 To 255 Step 15 Do
  r = 90: g = i: b = i
  Color   Rgb(r, g, b): Print " Color -> ";
  Color gray(r, g, b): Print " in Gray  "
Next
Pause

```

Hi shian,
I am curious why the percents are 30% red, 59% green, 11 % blue. I see that they have to add to 100%  but why not 33% on each of RGB. Is it something to do with green and yellow appearing lighter than the other colors and that yellow is created by mixing red and green. This calls for an experiment.
Hi MGA,
This is simply how the BIOS Interrupt 0x10, Function 0x10, Subfunction 0x1B, sets gray-scale values for the 256 colors palette, in MCGA and VGA monitors.
I just use the same formula of that interrupt. Therefore, the actual mystery remains unsolved. But that's the formula I use to program for DOS.  



I feel like Thomas Edison testing light bulbs only 995 to go!
My findings according to my eye and Windows laptop coloring system reverses the percents for red and blue.
Check it out:
```

' gray() accepts the same values as Rgb(), i.e. 0..255:
Func gray(r, g, b)
  Local Const RGBF_SCALE = 1 / 255
  Local n
  
  n = Sum(r * 0.30, g * 0.59, b * 0.11) ' gray=(30% red + 59% green + 11% blue)
  ' original yes on my screen blue is way too dark
  
  'n = Sum(r * 0.4, g * 0.4, b * 0.2)
  '1st experiment yes on my screen this is better but blue still too dark and red and purple  not enough
  
  'n = Sum(r * 0.3, g * 0.4, b * 0.3)
  '2nd experiment  well red green  blue are the same almost blue still doesn't look bright enough
  
  'n = Sum(r * 0.33, g * 0.34, b * 0.33)
  '3rd No green too dark
  
  'n = Sum(r * 0.25, g * 0.4, b * 0.35)
  '4th  more darker red lighter blue nice purple, green still too dark
  
  'n = Sum(r * 0.15, g * 0.55, b * 0.3)
  '5th yeah here !!!! it kind of reverses red/blue in original (Windows laptop)
  
  n *= RGBF_SCALE ' scale 0..255 palette to 0..1 (for Rgbf)
  
  gray = Rgbf(n, n, n)
End
sub ball(x,y,cx)
   local r,sc,start, ym2
   ym2=ymax*.75
   sc=32/radi:start=int(32/sc)-2
   for r=start to 0 step -1
      if cx ="R" then 
         circle x,y,r,1,rgb(255-6*r*sc,0,0) filled
         circle x,ym2,r,1,gray(255-6*r*sc,0,0) filled
      elif cx="B"
         circle x,y,r,1,rgb(0,0,255-6*r*sc) filled
         circle x,ym2,r,1,gray(0,0,255-6*r*sc) filled
      elif cx="G"
         circle x,y,r,1,rgb(0,220-6*r*sc,0) filled
         circle x,ym2,r,1,gray(0,220-6*r*sc,0) filled
      elif cx="O"
         circle x,y,r,1,rgb(255-3*r*sc,150-3*r*sc,0) filled
         circle x,ym2,r,1,gray(255-3*r*sc,150-3*r*sc,0) filled
      elif cx="Y"
         circle x,y,r,1,rgb(255-4*r*sc,255-4*r*sc,0) filled
         circle x,ym2,r,1,gray(255-4*r*sc,255-4*r*sc,0) filled
      elif cx="P"
         circle x,y,r,1,rgb(255-7*r*sc,0,130-2*r*sc) filled
         circle x,ym2,r,1,gray(255-6*r*sc,0,0) filled
       fi
   next
end

radi=xmax/7/2-2
Print "An example gray-scale graphics:"
Print
For i = 1 to 6
  cc=mid("RGBYOP",i,1)
  bx=xmax/7*i
  ball bx,.25*ymax,cc
Next
Pause

```

Append: added to on-line samples, I switched back to original formula because on Android NOOK the blue IS lighter than red. In both versions, the red and purple are awful dark.
Nice graphix..
I guess that on BIOS screen text mode 3 or pixel mode 18 it looks much better.
However, try to start from ```
gray(50,50,255)
```
 instead of ```
gray(0,0,255)
```
.
It might work better for modern SVGA modes with high resolution and LCD screens.
I'm not aware of new formula for these kind of screens...
