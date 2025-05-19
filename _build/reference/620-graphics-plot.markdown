# PLOT

> PLOT xmin, xmax USE f(x)

Plots the graph of `f(x)` in the range from `xmin` to `xmax`. The variable must be `x`.

### Example

```
' Set white background and drawing color to red
color rgb(255,0,0), rgb(255,255,255)
cls

' Define function and plot
def f(x) = sin(x)
plot 0, 2*pi USE f(x)
```
