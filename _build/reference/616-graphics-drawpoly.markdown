# DRAWPOLY

> DRAWPOLY array [,x-origin,y-origin [, scalef [, color]]] [COLOR color] [FILLED]

Draws a polyline. The array contains all the vertices of the polyline and can be defined as follow:

- [[x1,y1], [x2,y2], ... ,[xn,yn]]
- [x1,y1, x2,y2, ... , xn,yn]

Scaling factor scalef is applied after moving to the x- and y-origin.

## Example 1: Polygon array with points

```
P = [[0,50], [50,0], [100,50], [0,50]]
                                    
drawpoly P                          ' Draw poly
drawpoly P, 200,200                 ' Draw poly with offset
drawpoly P, 200,200, 1.5 COLOR 4    ' Draw poly with offset, scaling and color
```

## Example 2: Polygon array without points

```
P = [0,50, 50,0, 100,50, 0,50]      ' Even elements -> x
                                    ' Uneven elements -> y
                                    
drawpoly P                          ' Draw poly
drawpoly P, 200,200                 ' Draw poly with offset
drawpoly P, 200,200, 1.5 COLOR 4    ' Draw poly with offset, scaling and color
```

