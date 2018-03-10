### File

> DIRWALK directory [, wildcards] [USE ...]

Walk through the specified directories. The user-defined function must returns zero to stop the process.


<pre>FUNC PRNF(x)
  ? x
  PRNF=TRUE
END
...
DIRWALK "." USE PRNF(x)

<pre>

' Note: this demo is also a useful utility (version 2)

' -------------------- Start of Demo search ---------------------
' "." = Start search in current directory:
dir = "."
' Exclude some binary files to speed up search (it's not case sensitive):
exclude_ext = "jpeg jpg png gif mp3 mp4 zip 7z exe dat"
' Search this "string":
word = "FUNC "
' 0 = Not case sensitive search; 1 = Case sensitive search:
case_sensitive = 0
' Search it!
search_word dir, exclude_ext, word, case_sensitive

' ' Demo only for dir_list():
' a = dir_list(dir, exclude_ext)
' For i In a Do ? i
' ? " - Length of list: "; Len(a)
' -------------------- End of Demo search ---------------------

' Purpose: return sorted array of directory files-list (including files in
'          sub-directories, but not directory-names).
' Details: "dir" is the top directory to start search from (default = ".");
'          "exclude_ext" is a Not case sensitive string of file-extension(s) 
'          to exclude from list (default = ""), For example:
'           "jpeg jpg zip z7 gif wav mp3" ' Space delimited extensions.
' Example:
'  a = dir_list("", "")  ' a is all files in current dir (and its sub-dirs).
'  a = dir_list("..", "bak zip") ' a is files in upper dir, exclude .bak .zip
Func dir_list(dir, exclude_ext)
  Local a, ext
  ' Verify "dir" ("." is current directory):
  dir = Trim(dir): If dir = "" Then dir = "."            ' 
  ' Exclude extension in Any case (for Windows):
  ext = Enclose(Lcase(Squeeze(exclude_ext)), " ")     
  
  ' Make the dir list (DIRWALK):
  Func make_list(f)
    Local e                             ' File Extension (without ".")
    If Isfile(f) Then                   ' Don't add directory-names to list
      e = Enclose(Lcase(Rightoflast(f, ".")), " ")
      If Not (e In ext) Then a << f     ' Exclude extension? or append file
    Fi
    make_list = True                    ' (True = Continue to walk)
  End Func
  Dirwalk dir Use make_list(x)          ' (Note: parameter name must be 'x')
  ' Sort dir list and ignore case (SORT):
  Func no_case(x, y)
    x = Lcase(x)
    y = Lcase(y)
    Select Case 1
    Case x = y: no_case =  0
    Case x > y: no_case = +1
    Case Else : no_case = -1
    End Select
  End Func
  Sort a Use no_case(x, y)
  dir_list = a
End Func

' Purpose: search for a "word" in "dir" (and its sub-dirs), and print results.
' Details: for "dir" and "exclude_ext" details - See dir_list() function.
'          "word" is the string to search for.
'          'cs' is case sensitive search - True or False.
Sub search_word(dir, exclude_ext, word, cs)
  Local w, file, list, l, lines, p     ' For Searching
  Local c_page, c_line                 ' Counters
  Local t_lines, t_files, old_t_lines  ' Totals (for sum)
  Local LINES_PER_PAGE, attr = 3
  LINES_PER_PAGE = 10                 ' How many lines to print before pause?

  list = dir_list(dir, exclude_ext)    ' Get the list of all files
  w = Iff(cs, word, Ucase(word))       ' Case sensitive search?
  ? Cat(0); Chr(12); Cat(attr);        ' Clear console attributes and screen
  ' Load and search in each file:
  For file In list
    Tload file, lines
    c_line = 0
    
    ' Search in each line:
    For l In lines
      c_line++  ' Keep line # for [print the line]
      ' Look for the word in this line:
      If cs Then
        p = Instr(l, w)
      Else
        p = Instr(Ucase(l), w)
      Fi
      ' If word found then print the line:
      If p Then
        ? Cat(2); file + " [" + c_line + "]"; Cat(-2); " "; Mid(l, p)
        c_page++
        If c_page = LINES_PER_PAGE Then c_page = 0: Pause
        t_lines++  ' Keep total lines # for sum
      Fi
    Next l
    If t_lines > old_t_lines Then
      old_t_lines = t_lines
      attr = -attr: ? Cat(attr);  ' Change color on new file
      t_files++                   ' Keep total files # for sum
    Fi
  Next file

  ' Print sum:
  If c_page <> 0 Then Pause
  ? Cat(0)  ' Clear all console attributes
  Color 15
  ? "- Search in: "; Enclose(dir)
  ? "- Exclude file-extension(s): "; Enclose(Squeeze(exclude_ext))
  ? "- Search "; Iff(cs, "IS", "is NOT"); " case sensitive."
  ? "- Found "; Enclose(word); &
  " in "; t_lines; " lines, in "; t_files; " files "; &
  "(out of "; Len(list); " files)."
  ?
  Color 7
  ? "Done. Press Backspace key...";
  While Inkey <> Chr(8): Wend
End Sub

</pre>

