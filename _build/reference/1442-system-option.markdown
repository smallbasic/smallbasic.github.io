# OPTION

> OPTION keyword

Used to pass parameters to the run-time environment.

| Option | Description |
|:---|:---|
| OPTION BASE 0,1                           | Set lowest allowed index of arrays to 0 or 1 |
| OPTION PREDEF ANTIALIAS on,off            | Set anti-aliasing for drawing lines or circles |
| OPTION MATCH PCRE [CASELESS]SIMPLE        | Set matching algorithm to (P)erl-(C)ompatible (R)egular (E)xpressions library or back to simple one for LIKE and FILES 
| OPTION PREDEF QUIET                       | Sets the quiet flag (-q option)
| OPTION PREDEF COMMAND cmdstr              | Sets the COMMAND$ string to cmdstr (useful for debug reasons)
| OPTION PREDEF GRMODE [WIDTHxHEIGHT[xBPP]] | Sets the graphics mode flag (-g option) or sets the preferred screen resolution. Example: `OPTION PREDEF GRMODE 320x320x16`
| OPTION PREDEF TEXTMODE                    | Sets the text mode flag (-g- option) 
| OPTION PREDEF CSTR                        | Sets as default string style the C-style special character encoding (`\`)
