# CHART

> CHART charttype, A [, style [, x1, y1, x2, y2]]

Draws a chart of array values in the rectangular area given by the points `[x1, y1]` and `[x2, y2]`. The array `A` stores y-values only: [y1, y2, y3, ... yn].
The x-axis of the chart has the values 1,2,3,...n.

`charttype` is a number with the following values:

| Charttype            | Value |
| -------------------- |:-----:|
| Linechart            | 1     |
| Barchart             | 2     |

`style` is a number with the following values:

| Style                | Value |
|----------------------|:-----:|
| simple               | 0     |
| with marks           | 1     |
| with ruler           | 2     |
| with marks and ruler | 3     |

See PLOT for plotting functions.

### Example 1: Linechart with marks and ruler

```
demo = [1.5,2,3.5,4,5,6.5,7,8,9.5,10,11,12.5]
Color 0, 15
cls
Chart 1, demo, 3, 150, 150, 750, 550
```

### Example 2: All charttypes and styles in one glance

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


