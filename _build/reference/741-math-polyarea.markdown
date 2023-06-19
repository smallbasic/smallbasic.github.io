# POLYAREA

> a = POLYAREA (poly)

Returns the area of the polyline `poly`. The algebraic sign of the area is positive for counterclockwise ordering of vertices in x-y plane;
otherwise negative.

See DRAWPOLY for more information on how to define the polyline.

### Example

```
polygon = [ [50,50], [100,50], [100,100], [50,100], [50,50]]
drawpoly polygon color 12

Area = abs(polyarea(polygon))     ' absolute value of the area, because
                                  ' we are not interested in the
                                  ' ordering of the vertices.

print "Polyarea() returns: "; Area
print "Exact area is 50x50 = 2500"
```
