# Clipboard - Copy and Paste

## About the plugin

Clipboard is a simple plugin to copy and paste text between your SmallBASIC program and the Windows or Linux desktop.

## Using the plugin

The plugin can be used by importing it with `import clipboard`. A simple "Hello World" program looks like this:


```
import clipboard

print clipboard.paste()

text = "Hello World"

clipboard.copy(text)

print clipboard.paste()
```

## Supported Commands

### PASTE

>> text = paste()

text (String): content of the clipboard

Copies the content of the system clipboard to _text_.

### COPY

>> copy(text)

text (String): text for copying to the clipboard

Copies _text_ to the system clipboard.
