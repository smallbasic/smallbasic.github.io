# POLYEXT

> POLYEXT poly(), BYREF xmin, BYREF ymin, BYREF xmax, BYREF ymax

Returns the polyline's extents.

```
polygon = [ [30,50], [100,70], [120,90], [50,100], [30,50]]

polyext(polygon, PolyXmin, PolyYmin, PolyXmax, PolyYmax)

drawpoly polygon color 12
rect PolyXmin, PolyYmin, PolyXmax, PolyYmax  color 5

```

