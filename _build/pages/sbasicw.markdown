SBASICW
=======

> `sbasicw` is a web server which can display the output of a SmallBASIC program in a browser.
> It can also be used to dynamically generate websites using SmallBASIC commands.

## Getting started

### Render to canvas

Launch `sbasicw` (Linux) or `sbasicw.exe` (Windows) in a folder containing the files of your website.
It is quite helpful, if `sbasicw` is in the search path. After you started the web server you can open in
your browser the URL `http://127.0.0.1:8080`. This will display the file `index.html`. You can also load
`http://127.0.0.1:8080/myprogram.bas`. This will execute the SmallBASIC file `myprogram.bas`. The output
(graphics and text) will be rendered to an HTML5 canvas and displayed as a bitmap in your browser. Only a 
snapshot of the output is displayed i.e., you would only see one frame of an animation in your web browser.

### HTML text output

Launch the web server in a folder containing the files of your website with the following command:

```
sbasicw --graphic-text="0"
```

If you call a SmallBASIC file, graphics output will still be rendered to an HTML5 canvas. But output of
the `print` command is interpreted as text by the browser. You can print HTML and even Java script commands.

## Transfer data

`sbasicw` supports sending data using the get method. To send variables to a SmallBASIC program add `?var1=value1&var2=value2...&varN=valueN` to the URL of the website. You can then read the values of the
variables using the `env()` function, for example `v = env("var1")`.

## Tutorial

[sbasicw_tutorial.zip](/assets/sbasicw_tutorial.zip) contains several HTML and SmallBASIC files. To start the
tutorial extract the files to a folder of your choice and launch the web sever in this folder with:

```
Linux:   sbasicw --graphic-text="0"
Windows: sbasicw.exe --graphic-text="0"
```

Open a browser and start the tutorial with `http://127.0.0.1:8080`. You will learn how to link between HTML
files, dynamically generate HTML files using SmallBASIC, create forms, process the input of the forms and
draw graphics to an HTML canvas.

![Page 7 of the tutorial](/images/sbasicw_screenshot.png)

## Run the web server in the background

If you want to start the web server in the background, use the following command:

```
sbasicw &
sbasicw --graphic-text="0" &
```

If an error message like `[1]  + suspended (tty input)  sbasicw` is displayed, then start the server with:

```
sbasicw < /dev/null &
sbasicw --graphic-text="0" < /dev/null &
```
