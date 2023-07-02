# POLYEXT

> POLYEXT poly, BYREF xmin, BYREF ymin, BYREF xmax, BYREF ymax

Returns the extents of the polyline `poly`. `xmin` and `xmax` are extents in x-direction and `ymin` and `ymax` are the extents in y-direction. 

See DRAWPOLY on how to define a polyline.

### Example

```
polygon = [ [30,50], [100,70], [120,90], [50,100], [30,50]]

polyext(polygon, PolyXmin, PolyYmin, PolyXmax, PolyYmax)

' Draw polygon and a rectangle for indicating the extents
drawpoly polygon color 12
rect PolyXmin, PolyYmin, PolyXmax, PolyYmax  color 5

```

