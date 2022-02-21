letters = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]

func is_valid_discard(k)
  local result = true
  local c
  for c in k
    if (c == "#") then 
      result = false
      exit for
    endif
  next
  return result
end

func is_valid_pattern(k)
  local result = len(k) == 5 || k == ""
  local c, j
  
  if (result and k != "") then
    for c in k
      j = upper(c) in letters
      if c != "#" and j == 0 then 
        print c + " has been discarded"
        result = false
        exit for
      endif
    next
  endif
  return result
end

sub discard_letters(k)
  local c, i, l
  for c in k
    i = 0
    for l in letters
      if upper(c) == l then
        delete letters, i, 1
        exit for
      endif
      i++
    next
  next
end

sub show_suggestions
  local words, p, c, i, l, s
  
  dim words(len(letters), 5)
  p = 0
  for c in k
    i = 0
    for l in letters
      if (c == "#") then
        words[i, p] = l
      else
        words[i, p] = upper(c)
      endif
      i++
    next
    p++
  next
  for i = 0 to len(letters) - 1
    s = ""
    for j = 0 to 4
      s += words[i, j]
    next
    print s
  next
end

sub print_letters
  local vowels = []
  local l
  for l in letters
    if (l in ["A", "E", "I", "O", "U"]) then
      vowels << l
    else
      print l + " ";
    endif
  next
  print " - ";
  for l in vowels
    print l + " ";
  next    
  print
end

print "Wordle helper"
print_letters

while 1
  repeat
    input "Enter discard letters: ", k;
  until is_valid_discard(k)

  discard_letters(k)  
  print_letters

  repeat
    input "Enter pattern (# for replacement): ", k;
  until is_valid_pattern(k)

  if (k != "") then show_suggestions
wend
