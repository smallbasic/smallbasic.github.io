# POLYAREA

> POLYAREA (poly)

Returns the area of the polyline poly.

```
polygon = [ [50,50], [100,50], [100,100], [50,100], [50,50]]
drawpoly polygon color 12

Area = polyarea(polygon) / 2  ' Bug, please divide area always by 2

print "Polyarea() returns: "; Area
print "Exact area is 50x50 = 2500"
```
