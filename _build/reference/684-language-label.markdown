# LABEL

> LABEL name

Defines a label. A label marks a position in the code.

There are two kinds of labels, 'numeric' and 'alphanumeric'. Unlike 'alphanumeric' labels, 'Numeric' labels do not require the keyword `LABEL`

    1000 ? "Hello"
    ...
    LABEL AlphaLabel: ? "Hello"
    ...
    GOTO 1000
    GOTO AlphaLabel


