# smallbasic.github.io

SmallBASIC  Github pages

## Edit files the easy way

If you want to edit the SmallBASIC website because information is missing, examples
are not clear enough or maybe just to correct a typo, you can do it quite easy.

All website pages are written in Markdown. The files are located in:

- `_build/pages` : Almost all web pages
- `_build/reference`: The command reference

To start editing:

1. Create a Github account.
2. Fork smallbasic.github.io.
3. Change to the forked version in your account.
4. Edit a `.markdown` file directly in Github in your browser.
5. Save the file and let Github make a commit.
6. Start a pull-request.
7. We will merge your changes or give you feedback how to proceed. Please don't
   worry. Even if you make a mistake, we will help you. We are happy for everyone
   who wants to participate.

## Build instructions for Linux:

- Install SmallBASIC console version (sbasic)
- Optional: Install SmallBASIC web server (sbasicw) 
- Install pandoc
- Execute the following commands:

  ```
  git clone https://github.com/smallbasic/smallbasic.github.io.git
  git clone https://github.com/smallbasic/smallbasic.samples.git
  cd smallbasic.github.io/_build
  export SAMPLE=PATH_TO_SMALLBASIC_SAMPLES
  make clean
  make
  ```

  `PATH_TO_SMALLBASIC_SAMPLES` is the absolute path to the sample
  directory, i.e. `/home/userxyz/smallbasic.samples`

The SmallBASIC static website can be found in the root directory of
the smallbasic.github.io folder. To access the website locally
use the SmallBASIC webserver: `sbasicw index.html` (or other
webservers like the python http-server: `python -m http.server 8080`).
In the browser type: `http://127.0.0.1:8080`.

