# EXPORT

> EXPORT thing

Export a SUB, FUNC or variable from a UNIT to be used by the unit consumer.

See `UNIT` for more information.


### Example: Create an unit

```
UNIT MyTestUnit

export const my_pi = 3.145
export my_two_pi = 6.29
export MyFunc
export MySub

func MyFunc(a)
  return a + 10
end

sub MySub(a)
  print a + 10
end
```


