# POLYCENT

> POLYCENT(polygon)

returns the centroid of a polygon.

Polycent is based on code from the article "Centroid of a Polygon" by Gerard Bashein and Paul R. Detmer.

Polycent calculates the centroid (xCentroid, yCentroid) and area
of a polygon, given its vertices (x[0], y[0]) ... (x[n-1], y[n-1]). It
is assumed that the contour is closed, i.e., that the vertex following
(x[n-1], y[n-1]) is (x[0], y[0]). The algebraic sign of the area is
positive for counterclockwise ordering of vertices in x-y plane;
otherwise negative.

```
polygon = [ [50,50], [100,50], [100,100], [50,100], [50,50]]

centroid = polycent(polygon)  
print "Centroid is at: "; centroid

drawpoly polygon color 12
circle centroid(0), centroid(1) , 5 color 5
```



