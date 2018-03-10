### Language

> FOR expr

Defines a FOR/NEXT loop. FOR counter = start TO end [STEP incr] ... NEXT.  FOR element IN array (or map) ... NEXT.


Begins the definition of a FOR/NEXT loop.
* counter - A numeric variable to be used as the loop counter.
* start - A numeric expression; the starting value of counter.
* end - A numeric expression; the ending value of counter.
* incr - A numeric expression; the value by which counter is incremented or decremented with each iteration of the loo<p> The default value is +1.
<p>SmallBasic begins processing of the FOR/NEXT block by setting counter equal to start. Then, if 'incr' is positive and counter is not greater than end, the commands between the FOR and the NEXT are executed.
<p>When the NEXT is encountered, counter is increased by 'incr', and the process is repeated. Execution passes to the command following the NEXT if counter is greater than end.
<p>If increment is negative, execution of the FOR/NEXT loop is terminated whenever counter becomes less than end.
<p>FOR/NEXT loops may be nested to any level of complexity, but there must be a NEXT for each FOR.
<pre>FOR C=1 TO 9
    PRINT C
NEXT
*Statement FOR element IN array ... NEXT*
Begins the definition of a FOR/NEXT loop.
* element - A variable to be used as the copy of the current element.
* array - An array expression
<p>The commands-block will repeated for LEN(array) times. Each time the 'element' will holds the value of the current element of the array.
<p>FOR/NEXT loops may be nested to any level of complexity, but there must be a NEXT for each FOR.
A=[1,2,3]
FOR E IN A
    PRINT E
NEXT
...
' This is the same with that
A=[1,2,3]
FOR I=LBOUND(A) TO UBOUND(A)
    E=A(I)
    PRINT E
NEXT

