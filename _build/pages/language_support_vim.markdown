# SmallBASIC in vim

> Using vim

_"Vim (short for vi improved) is a free and open-source text editor. Vim provides both a terminal screen user interface as well as a graphical user interface" ([Wikipedia](https://en.wikipedia.org/wiki/Vim_(text_editor)))_


![Example](https://github.com/smallbasic/smallbasic.syntax-highlighting/raw/main/vim/screenshot.png)

## Installation

- Download the file `smallbasic.vim` from [Github](https://github.com/smallbasic/smallbasic.syntax-highlighting/tree/main/vim)
- Create the folder `~/.vim/syntax`
- Copy the file `smallbasic.vim` into that folder
- Edit or create the file `~/.vim/filetype.vim`
- Add `au BufNewFile,BufRead *.bas set filetype=smallbasic`
