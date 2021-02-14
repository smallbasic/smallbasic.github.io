# Programming SmallBASIC

> Gerard Thomas Labèrnia

::: articleRight ::
::: articleRightInner ::
Contents
:::

* [Introduction to SmallBASIC](#intro)
* [Structure of a program in SmallBASIC](#structure)
* [Program Editor](#editor)
* [Commands in SmallBASIC](#commands)
* [Screen commands](#screenCommands)
* [Jump commands](#jumpCommands)
* [Conditional commands](#conditional)
* [Repetition commands](#repeat)
* [Graphic commands](#graphicCommands)
* [Graphics / Color code](#graphics)
* [Programming Exercises](#exercises)

:::

![](/images/media/image1.png)

## Preface

This document seeks to introduce students to the world of
programming. It can be used not only for technology, but also drawing on
other subjects, for example Mathematics, Physics, Music, English.

At the time of the first commercial computer programs were rare, the
software that is the machine software was developed by the users
themselves, who often programmed their own applications. It is
important to recover this spirit so that students realize the
importance of knowing how to program a computer to do their own
programs.

## Introduction to SmallBASIC {#intro}

Programming is the process of putting instructions on the computer to
tell what functions are performed and in what order to do it. The aim
of this subject began to make our first programs.

SmallBASIC is a language of computer programming based on BASIC. BASIC
stands for Beginner's All-Purpose Symbolic Instruction Code.

BASIC language is a high level, as well as C and is very suitable for
beginners in the world of programming. BASIC is one of the most
popular programming languages. It's easy to learn and use, and their
commands very similar to English (eg Print, Input) and its power.

SmallBASIC has a simple interface and many mathematical functions and
graphics. It is an ideal tool for experimenting with simple algorithms
and fun. It has a very simple structure for the programs, their lines
can be numbered (10, 20, 30, etc.) are executed in order.

## Structure of a program in SmallBASIC {#structure}

![](/images/media/image3.png)

We can see the line numbers and the most common commands for
separate two commands on one line, use the two points.

![](/images/media/image4.png)

Window work SmallBASIC

## Program Editor{#editor}

In this section you will learn to work with the program editor:

- Enter the first program
- Save the program file to disk
- Recover files on disk
- Run the program
- Check it properly
- Using Help
- Leave SmallBASIC

Steps to follow:

I.  We will create a folder on the USB drive to store programs. For example: Basic.
I.  Run the program My Computer\> All Programs\> SmallBASIC\> SmallBASIC.
I.  The menu File\> New file and type the following program:

Note: It is very important that you type the program exactly, otherwise the program will not work and get errors

```
10 REM First program
20 CLS
30 PRINT "Welcome to"
40 PRINT "basics": PLAY "CDE"
50 END
```

IV. Stores program previously created the directory, menu File\> Save File As, how Example.BAS.

V.  To skip this step. To retrieve the file from the program menu File\> Open File.

VI. To run the program press the F9

VII. Checking If everything is correct, you get the following result and musical notes, but revised the lines of the program and run it again.

Welcome to the basics

VIII. Using help: Press F1.

IX. To leave SmallBASIC menu File\> Exit

Interesting note: In the Edit menu, we have the options: Cut, Copy and Paste, very useful in editing programs, but have previously selected the mouse or text lines.

Keyboard shortcuts for working with the program:

+-------+----------------------------------------+
|F9     |Run the program.                        |
+-------+----------------------------------------+
|Ctrl+F4|Close Tabs programs or program          |
|       |information.                            |
+-------+----------------------------------------+
|Ctrl+B |Stop the program (useful when it is in a|
|       |loop without leaving the program)       |
+-------+----------------------------------------+

## Programming Course

Sections:

1. EX1.BAS to EX7.BAS
2. P1.BAS to P19.BAS
3. EX8.BAS to EX13.BAS
4. EX20.BAS to EX26.BAS

## Commands in SmallBASIC{#commands}

### Screen commands{#screenCommands}

`REM (remark)`
: Insert a comment in a program.

`CLS (clear screen)`
: Delete everything on the screen.

`COLOR`
: Change the text color and background of the screen (color code at the end of section 4.5).

`COLOR A, B`
: Change the text color of the screen background color A and B.

`PRINT (print) `
: View numerical data or text on the screen.

**EX1.BAS**

```
REM Command
10 PRINT
20 CLS
30 PRINT "HELLO"
40 COLOR 1.12: PRINT 20 + 20
```

Result screen:

```
HELLO 40
```

`locate`
: Place the cursor on the screen in a coordinated expressed in rows and columns.

**EX2.BAS**

```
10 REM locate command
20 CLS
30 Locate 12.10
40 PRINT "HELLO"
```

Result screen:

![](/images/media/image5.png)

Placing text and locate PRINT

`INPUT`
: Enter the value of one variable from the keyboard.

**EX3.BAS**

```
10 REM Input Command
20 CLS
30 PRINT "Age?"
40 INPUT A
50 PRINT A: PRINT "Years"
```

Result screen:

```
Age ?

15 Years
```

(To keep the variable value 15 entered from the keyboard)

`STOP`
: Stop the execution of a program.

`END`
: Ending a program.

`PAUSE`
: Stop the computer.

`PAUSE t`
: Stop the computer during t seconds.

`SQR (square root)`
: Make the square root operation

**EX4.BAS**

```
10 REM Command SQR
20 CLS
30 PRINT SQR(25)
```

## Jump commands{#jumpCommands}

`GOTO`
: Skip the execution of the program line indicated.

**EX5.BAS**

```
10 REM Command GOTO
20 CLS
30 PRINT “HELLO”
40 GOTO 60
50 PRINT "student"
60 END
```

Result screen:

```
HELLO
```

(Line 50 will not run)

## Conditional commands{#conditional}

`IF - THEN - ELSE`

Forks execution according to the value of an expression. If the value of the expression is true, will run the following command THEN and if false run the following ELSE.

ELSE can be omitted, and simply continue the program in the following order.

**EX6.BAS**

```
10 REM Ordre IF – THEN – ELSE
20 CLS
30 PRINT “EDAT?”
40 INPUT A
50 IF A>17 THEN PRINT "ADULT" ELSE PRINT "MINOR"

```

Result screen:

```
AGE?

11

MINOR
```

## Repetition commands (loops) {#repeat}

`FOR - NEXT`
: Repeat part of a program a certain number of times.

**EX7.BAS**

```
10 REM Command FOR – NEXT
20 CLS
30 FOR I=1 TO 4
40 PRINT "GOOD MORNING"
50 NEXT I
```

Result screen:

```
GOOD MORNING
GOOD MORNING
GOOD MORNING
GOOD MORNING
```

### Graphic commands {#graphicCommands}

Before starting commands graphic graphics grid looks at the end of the chapter, to put points on the screen.

`PSET`
: Draw a dot on the screen.

`PSET ( X, Y), color`
: Draw a point on the screen coordinates (x, y) and the desired color.

**EX8.BAS**

```
10 REM Command PSET
30 PSET 320,240,1
40 PSET 320,250,1
50 PSET 320,260,1
60 END
```

Result screen:

(Look closely at the three black spots on the screen)

`LINE`
: Draw a line on the screen.


`LINE X1, Y1, X2, Y2, color`
: Draw a line on the screen from the initial point (x1, y1) to the end point (x2, y2) and the desired color.

**EX9.BAS**

```
10 REM Command LINE
30 LINE 40,40,480,440,14
40 PAUSE 1
50 LINE 40,440,480,40,12
60 END
```

`RECT`
: Draw a rectangle on the screen.

`rect X1, Y1, X2, Y2, color`
: Draw a rectangle on the screen, given by the value of the points of a diagonal from the starting point (x1, y1) to the end point (x2, y2) and the desired color.

**EX10.BAS**

```
10 REM Command RECT
30 RECT 40,40,480,440,1
40 PAUSE 1
50 RECT 10,10,100,100,12
60 END
```

`CIRCLE`
: Draw a circle on the screen.

`CIRCLE X, Y, radius, proportion, color`
: Draw a circle on the coordinates (x, y), the radius and the desired color. The ratio of a circle equals 1.

**EX11.BAS**

```
10 REM Command CIRCLE
20 CLS
30 CIRCLE 320,200,30,1,14
40 PAUSE 1
50 CIRCLE 320,100,40,1,1
60 PAUSE 1
70 CIRCLE 200,100,50,0.5,12
80 END
```

Give color to a closed area of the screen.

`PAINT X, Y, color color border area`
: Give color to a closed area of the screen coordinates (x, y), and the desired color.

[Important: It i]{.underline}s mandatory to indicate the color of the border area, if not the same, will color the whole screen.

**EX12.BAS**

```
10 REM Command PAINT
20 CLS
30 CIRCLE 100,100,30,1,1
40 PAUSE 1
50 PAINT 100,100,1
60 CIRCLE 200,100,40,1,12
70 PAUSE 1
80 PAINT 200, 100,12
90 END
```

Note: Commands RECT and CIRCLE, FILLED option can lead to an end. This option automatically painted inside the rectangle or circle.

**EX13.BAS**

```
10 REM option FILLED
20 CLS
30 CIRCLE 100,100,30,1,14 FILLED
40 PAUSE 1
50 RECT 100,100,640,480,1 FILLED
60 END
```

![](/images/media/image6.png){#graphics}

## Programming Exercises{#exercises}

Enter these programs on your computer and store it in your USB memory folder. Run each, please tell us the result and performance. Where necessary enter the program.

**P1.BAS** (Operations)

```
10 CLS
20 PRINT 3+5
30 PRINT 100-60
40 PRINT 5 * 6
50 PRINT 120/40
60 PRINT (4+5) * 4
```

**P2.BAS** Write a program that performs the following operations:

```
(230 + 345) / 23
```

**P3.BAS** (Text and numbers)

```
10 CLS
20 PRINT "I'm a PC"
30 PRINT "How are you?"
40 PRINT "3+5"
```

Why doesn't the last printed line result in 8?

**P4.BAS** (Locate)

```
10 CLS
20 LOCATE 12,40:PRINT "A"
30 LOCATE 12,42:PRINT "B"
40 LOCATE 12,44:PRINT "C"
```

**P5.BAS** Write a program to make the next screen row and column indication. (Locate)

```
MENU 
1 PLAY
2 OPTIONS
3 EXIT
```

**P6.BAS** (Variables, variables are like boxes where you can store values, and then use them)

```
10 CLS
20 A=6
30 PRINT A
40 B=7
50 PRINT B
```

**P7.BAS** (Sum)

```
10 CLS
20 A=3:PRINT A
30 B=6:PRINT B
40 C=A+B
50 PRINT "Suma="
60 PRINT C
```

**P8.BAS** Make a program similar to the above to do the sum, product and quotient of two numbers given in variables.

**P9.BAS** (INPUT A and B by entering sum keyboard)

```
10 CLS
20 PRINT "A="
30 INPUT A
40 PRINT "B="
50 INPUT B
60 C=A+B
70 PRINT"SUMA="
80 PRINT C
```

**P10.BAS** Make a program similar to the above to do the sum, product and quotient of two numbers as input variables INPUT.

**P11.BAS** Make a program to calculate the area of a triangle.

```
A=(B·H)/2
```

**P12.BAS** Make a program that carries out the conversion of euros in pesetas.

1 € = 166.386 pts

**P13.BAS** Make a program that carries out the conversion of pesetas into euros.

**P14.BAS** Write a program to calculate the average of three numbers.

```
INPUT A
INPUT B
INPUT C
M=(A+B+C)/3
```

**P15.BAS** (FOR-NEXT loop)

```
10 CLS
20 FOR I = 1 TO 20
30 PRINT "*";
40 NEXT I
```

What happens if you remove the ';' character from the print command?

**P16.BAS** (FOR-NEXT loop, and locate PRINT)

```
10 CLS
20 FOR I = 1 TO 15
30 LOCATE I, 15: PRINT "*"
40 LOCATE I, 20: PRINT "$"
60 LOCATE I, 25: PRINT "@"
70 LOCATE 20, I: PRINT "%"
80 NEXT I
```

**P17.BAS** (Game with GOTO, IF - THEN)

```
10 CLS
20 X = 6
30 PRINT "************ Guess the number ************"
40 PRINT "************ (0 a 10) ************"
50 INPUT A
60 IF A = X THEN GOTO 100
70 IF A > X THEN PRINT " ----MENOR----"
80 IF A < X THEN PRINT " ----MAJOR----"
90 GOTO 50
100 PRINT " $$$$$ You've almost got $$$$$"
110 PLAY "O2T255CDCDO6DCDC"
```

Write next to each line of the program that performs the function

**P18.BAS** Make a program that asks you the password (a number) to continue and if the correct sounding music and the text " correct password "

**P19.BAS** Program menu: Calculator euros

```
10 REM CALCULADORA D'EUROS
20 CLS
30 PRINT "CALCULADORA D'EUROS"
40 PRINT "1. EUROS A PTS"
50 PRINT "2. PTS A EUROS"
60 PRINT "TRIA L'OPCIÓ"
70 INPUT A
80 IF A = 1 THEN GOTO 100
90 IF A = 2 THEN GOTO 200
100 REM EUROS A PTS
110 CLS
120 PRINT "EUROS A PTS"
130 PRINT "EUROS"
140 INPUT EUROS
150 PTS = EUROS * 166.386
160 PRINT "PTS="
170 PRINT PTS
180 END
200 REM PTS A EUROS
210 CLS
220 PRINT "PTS A EUROS"
230 PRINT "PTS"
240 INPUT PTS
250 EUROS = PTS / 166.386
260 PRINT "EUROS="
270 PRINT EUROS
280 END
```

**P20.BAS** ( Command LINE)

```
10 SCREEN 12
20 LINE 5,5,105,105,14
30 END
```

**P21.BAS** (Command RECT)

```
10 CLS
20 RECT 5,5,105,105,14
30 END
```

**P22.BAS** (Command RECT, drawing a colored rectangle)

```
10 CLS
20 RECT 5,5,105,105,14 FILLED
30 END
```

Explain the difference between the three previous programs

**P23.BAS** Make a program that does the following figure, each circle a different color (Use the grid on page 10 and make an outline prior to placing coordinates):

![](/images/media/image37.png)

**P24.BAS** Make a program that draws a triangle colored red and painted yellow inside.
