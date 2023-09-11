# QR Code

A QR code (quick-response code) is a two-dimensional image containing a matrix barcode. The code contains data like a string, numbers or
binary data and can be for example scanned and read out with a smartphone.

## Download the unit

The unit can be downloaded or copy pasted from the [SmallBASIC Github website](https://github.com/smallbasic/smallbasic.plugins/blob/master/units/qrcode.bas).
Please save the unit in the same directory as your basic file.

## Using the unit

```smallbasic
import qrcode

color 1, 15
cls

CreateQRCode("https://smallbasic.github.io")

'### End of main program ######

sub CreateQRCode(text)
    local bufLen = qrcode.bufferLenForVersion(qrcode.VERSION_MAX)
    local errCorLvl = qrcode.Ecc_LOW
    dim qrcode(bufLen)
    
    if (!qrcode.encodeText(text, qrcode, errCorLvl, qrcode.VERSION_MIN, qrcode.VERSION_MAX, qrcode.Mask_AUTO, true)) then
        print "Failed to create QR code"
    else
        local size = qrcode.getSize(qrcode)
        local border = 0
        local x, y
        local xs = 5                              ' Pixel size, increase to have bigger pixels
        local ys = 5                              ' Pixel size, increase to have bigger pixels
        local xo = (xmax - (size * xs)) / 2
        local yo = (ymax - (size * xs)) / 2

        for y = 0 to size - 1
            for x = 0 to  size -1
                if (qrcode.getModule(qrcode, x, y)) then
                    rect xo + (xs * x), yo + (ys * y), xo + (xs * (x + 1)), yo + (ys * (y + 1)), 0 filled
                endif
            next x
        next y
    endif
end
```
