REM SmallBASIC
REM created: 30/12/2018
REM Classic marooned sailors, coconuts and monkey problem.

print "Five proud but cynical explorers went into the jungle to pick coconuts. 
print

print "They worked all day and returned to their camp, putting all the coconuts into one big pile."
print

print "During the night, one explorer awoke, went to the pile of coconuts, divided it into five equal piles, he gave the one remaining coconut to a monkey. He hid his pile in the jungle and pushed the other four piles back into one big pile. He went back to bed."
print

print "Each hour later in the night, the other four cynical explorers did the same as the first explorer.
print

print "In the light of day all the explorers stared at the obviously smaller pile of coconuts from the day before, but each was too proud to admit what they had done during the night."
print

print" So, they divided the coconuts evenly once again and went on their merry way. What is the minimum number of coconuts the explorers had to pick?"

pause

cls
solfail =1
while solfail
 print "How many sailors are marooned? ";
input numsailors
 if numsailors =>2 and numsailors =<10 then solfail =0
wend
hidefrac = 1 / numsailors
remfrac = (numsailors -1) / numsailors
solfail =1
rem testcocos = (numsailors * (numsailors +1)) + numsailors -1 'Logical starting point
testcocos =0 ' Starting point for testing
trial =0
lpstp = numsailors +1
while solfail
 testcocos = testcocos +1
 remcocos = testcocos
 for cntsailor = 1 to lpstp
   trial = trial +1
   if cntsailor < lpstp then remcocos = remcocos -1
   hidecocos = remcocos * hidefrac
   remcocos = remcocos * remfrac
   print format("#####",trial), format("#####",testcocos), format("##",cntsailor), format("#####.000",hidecocos), format("#####.000",remcocos)
   if int(hidecocos) <> hidecocos then
    cntsailor =998
   else
    if cntsailor < lpstp and remcocos < numsailors then cntsailor =9998
   end if
 next cntsailor
 if cntsailor = numsailors +2  then solfail =0
wend
print "It took "; trial; " trials"
print "to determine that "; numsailors; " sailors"
print "would need to pick at least "
print testcocos; " coconuts."
pause
end