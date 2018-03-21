# CHART

> CHART LINECHART|BARCHART, array() [, style [, x1, y1, x2, y2]]

Draws a chart of array values in the rectangular area x1,y1,x2,y2. Styles: 0 = simple, 1 = with-marks, 2 = with ruler, 3 = with marks and ruler.

```
Const LINECHART = 1
Const BARCHART = 2
```

~~~
Const LINE_CHART = 1
Const BAR_CHART  = 2
demo = [1.5,2,3.5,4,5,6.5,7,8,9.5,10,11,12.5]
Color 0, 15
For type = LINE_CHART To BAR_CHART ' 1 to 2
  text = Iff(type = LINE_CHART, "LINE_CHART", "BAR_CHART")
  For style = 0 To 3
    Cls
    Print " Chart Type: "; type; " ("; text; ")"
    Print " Chart Style: "; style
    Print
    Print "Press any key...";
    Chart type, demo, style, 150, 150, 750, 550
    Pause
  Next style
Next type

~~~


