# POLYCENT

> c = POLYCENT(poly)

returns the centroid of a polygon `poly` as an array. The first element contains the x- the second element contains the y-coordinate of the centroid. POLYCENT will return an empty array if the area of the polygon is zero and the centroid is undefined.

POLYCENT is based on code from the article "Centroid of a Polygon" by Gerard Bashein and Paul R. Detmer.

See DRAWPOLY for more information on how to define the polygon.

### Example:

```
polygon = [[50,50], [100,50], [100,100], [50,100], [50,50]]

' Calculate centroid
centroid = polycent(polygon)  
print "Centroid is at: "; centroid

' Draw polygon and a circle at position of the centroid
drawpoly polygon color 12
circle centroid(0), centroid(1) , 5 color 5
```
