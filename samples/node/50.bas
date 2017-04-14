
'#sec:Main
'' Treason.bas
'' 26/09/2006
'' The Great State values the nefarious work of it''s Operative. 
''But do you work towards Prestige or Treason?.
'' By Gary Breinholt
'' from an original idea by Errin Famiglia 

label start
cls: 
?: ? ,,"  TREASON"
? "   As the top operative you have"
? "   great power at your disposal."
? "   Power enough to advance "
? "   The Great State. "
? "   Or bring about it''s downfall."
? "   Use missions to hone your skills."
? "   Join the ranks of the Power Elite. "
? "   Or follow the path of the Rebel..."
pause 20: cls

? ,,"  RULES"
? "   Each season you are offered a"
? "   mission and the possible result."
? "   Equate your skill to the mission"
? "   and tap ACCEPT or REFUSE."
? "   Skill levels are:"
? "   Lowest Low Average High Highest"
? "   Refusal wastes a season -"
? "   after prolonged sloth you will be"
? "   forced to undertake the mission. "
? "   Increase PRESTIGE or TREASON"
? "   to a value of 12 to win the game."
? "   Tap grafitti to progress text. ";

pause 20: cls

siz=1+(xmax>300) 

label setup
  dim seas(4),feel(5),stats(6),newss(6),stat(6): 
win=0: ff=0: nob=0: pres=0: tre=0: ass=0: sl=0
actt="Treason will increase "
actp="Prestige will increase "

restore facts:  
for x=1 to 6: read stats(x)
stat(x)=2
 next x

for z=0 to 5: read feel(z): next z
for z=1 to 4: read seas(z): next z
for z=1 to 6: read newss(z): next z

year=1780+fix(rnd*20): syear=year+1: trn=0

z=3: while z>0: x=fix(rnd*6):
if stat(x)=2 then z--: stat(x)=3
wend
45 x=fix(rnd*6): if stat(x)=2 then stat(x)=4 else goto 45

locate 3,5: ss=1
? cat(2);seas(ss);"  ";year;cat(0)
?:? "    The Great State welcomes their":  
? "    trusted Operative, firm in the": 
? "    belief that you will serve to the"
? "    utmost of your ability. "
? 
? "   Choose your missions carefully,"
? "   but don''t waste too much time..."
pause 4

label begin
ss=1: year++: 

while ss<5
trn++:
''Your turn
 cls: locate 1,1 : if win>0 then ? ,"     The End   " else ? cat(1);seas(ss)+"  "+year,"  Sloth: ";cat(-1);feel(sl) 
for x=1 to 6
? cat(1);stats(x);cat(-1);": ";feel(stat(x)): next x
? cat(1);"     Prestige: ";cat(-1);pres,cat(1);"Treason: ";cat(-1);tre: ?
if win>0 then goto win

m=fix(rnd*6):? cat(1);cat(2);newss(m);cat(-2);cat(-1)
act=fix(rnd*6)
if act<5 then  print actt;"if you fail" 
if act>2 then print actp;"if you succeed" 
z=0:sl=min(sl,6):  if fix(rnd*6)<=sl then locate 14,5: ? "Refusal is not an option...";: pause 5: goto 68
67 gosub 300
at 15*siz,140*siz: print "  Accept    "
at 110*siz,140*siz: print " Refuse": 
turn=0: gosub pick2:
on z goto 68,67,70,67

68 q=0:p=0: t=0: x=fix(rnd*6): y=0: sl=max(sl-1,0)
if x>stat(m) then goto 65
''if fix(rnd*6)=6 then stat(m)=min(stat(m)+1,5): q=1
if fix(rnd*6)>stat(m)+1 then stat(m)=min(stat(m)+1,5): q=1
y=1: if act<3 then goto 70
 if (left(actp)="T" and ff=1) then tre++: t=1 : goto 70
if left(actp)="P" then pres++ else tre--
if left(actp)="P"  then p=1 else t=2
 goto 70
 65  if fix(rnd*6)=1 then stat(m)=max(stat(m)-1,1): q=2
if act>4 then goto 70
 if (left(actt)="T" and ff=1) then tre--: t=2 : goto 70
if left(actt)="T" then tre++ else pres--
if left(actt)="T" then t=1 else p=2

70 cls: locate 2,5: ?cat(2);"Report "; seas(ss);"  ";year;cat(-2): ?
if z=3 then sl++: ?:?:? "You waste a season doing nothing." : x=2: goto 93
? cat(2);newss(m);cat(0)
on m gosub 141,142,143,144,145,146,
?: x=ypos-4: pause x :
if y=1 then goto 96
if ff=1 then ? "You fail in your work against " else ? "You fail to serve ";
goto 97
96 if ff=1 then ? "You succeed at working against " else ? "You succeed in serving ";
97 ? "the Great State": x=2
if q=0 then goto 91
 x=3: ? stats(m);" skill has "; : if q=1 then ? "increased" else ? "decreased"
91 if p=0 then goto 92
 x++: ? "Your Prestige Level has ";: if p=1 then ? "increased" else ?  "decreased"
92 if t=0 then goto 93
x++: ? "Your Treason Level has ";: if t=1 then ? "increased" else ?  "decreased" 

93 pause x: if fix(rnd*6)=1 and trn>47  and z=3 then ass=1
 if (pres=6 and nob=0) or (ff=0 and tre=6) then  gosub life: if x>1 then pause x

 80 win=(pres=12)+(tre=12)+(nob=1 and pres=0)+(ff=1 and tre=0)+(ass=1): if win>0 then ?: ? "     Breaking news...";: st=ss: pause 1

39  ss++: wend: goto begin

label pick2   ''used by dip/subvert
181 gosub tap
if p5<125*siz or p5>155*siz or p4<5*siz or p4>155*siz then goto 181
z=0: repeat: z++: until p4<((z*50)+5)*siz: if z=2 then goto 181
193 return

label tap
PEN ON: REPEAT : DELAY 25 : UNTIL PEN(0):
  WHILE PEN(3) : DELAY 25 : WEND
p4=pen(4): p5=pen(5): pen off: 
return

label facts
data "Patriotism","Bureaucracy","Religiosity","Warmongering","Disinformation","Amorality"

label feel
data "None","Lowest","Low","Average","High","Highest"

label seasons
data "Spring","Summer","Autumn","Winter"

label newss
data "LOYALTY PURGE","POLITICAL IN-FIGHTING","FAITH-BASED INIATIVE","ACT OF WAR","MANIPULATION CAMPAIGN","CLANDESTINE MISSION"

label win
237 if st=4 then st=0
win=0+(pres=12)+(tre=12)
cls: locate 5,5: if win>0 then ? cat(2);"CONGRATULATIONS";cat(0) else ? cat(2);"COMMISERATIONS";cat(0) : 
?: ? "After ";year-syear;" years and ";st;" seasons"
if pres=12 then ? "you become the undisputed": ?"Leader of The Great State" : goto 133
if tre=12 then ? "your revolution topples the corrupt":?"regime of The Great State" : goto 133
if ((ff=1 and tre=0) or (nob=1 and pres=0)) and ass=1 then ? "you are captured, tried and executed":?"for Committing": ?"Treason Against The Great State" : goto 133
if ff=1 and tre=0 then ? "of constant failure your cause has":?"lost all credibility.":?"You become a footnote in the history":?"of The Great State" : goto 133
if nob=1 and pres=0 then ? "of constant scandal you have become": ? "a pariah and are exiled from": ? "The Great State, in dishonour." : goto 133
if nob=1 then ? "You are assassinated by rebels, due": ?"to your support of The Great State."
if ff=1 then ? "You are removed by a loyal Operative,";: ?"due to your Treasonous acts."
if ff=0 and nob=0 then ? "Your lack of ambition has become": ?"abundantly clear."
 133 ?: ? "             You have ";
if win>0 then ? "WON" else ? "LOST": 
gosub tap: 
goto start

141 ?"Question the allegiance of every":?"citizen and ";: if ff=1 then ? "reward "; else ? "punish ";
? "those who are": ?"sympathetic to ";
if ff=1 then ? "your cause." else ? "the enemies": ? "of The Great State": 
return

142 ?"A struggle for domination occurs":?"among factions of the power elite,":?" who rule The Great State": 
? "Ensure that the right faction wins."
return

143 if ff=1 then ?"Expose the hypocrisy of the":?"Great State and reveal the sins":?"of it''s corrupt leaders": return
?"Praise the righteousness of the":?"Great State and assert the divine":?"humility of it''s blessed leader": return

144 ?"The Great State seeks greatness":?"and empire via military conflict":
if ff=1 then ? "Reveal Her plans and sell Her secrets." else ? "Weaken Her enemies via subversive": ? "acts."
 return

145 ?"The masses of The Great State":?"must be manipulated and lied to":?"on a constant basis.": 
? "Ensure they believe "; : if ff=1 Then ? "YOUR truth" else ? "in the Great State"
return

146 ?"Use dark and sinister forces to": if ff=1 then ? "undermine "; else ?"preserve ";
? "the authority of the":?"ruling class, within The Great State": return

label life
cls: locate 2,5: ?cat(2);"THE VICISSITUDES OF LIFE";cat(-2): 
if tre>0 and pres>0 then locate 12,1: ? "     Prestige: ";pres,,,"Treason: ";tre;:  gosub 300: locate 4,1
 if tre=6 and ff=0 then goto 160

? "You have served The Great State well.":?"Your Prestige has risen to such a level":? "that you have become a Hero of":? "The Great State" :?
if tre=0 then ?"Your assume your rightful":? "position among the Power Elite" : goto 196
? "Detractors are quick to expose your":?"mis-deeds...": 
''gosub 300: 
189 at 15*siz,140*siz: print "  Argue    "
at 110*siz,140*siz: print " Confess ": 
turn=0: gosub pick2:
rect 0,35*siz,160*siz,160*siz,15 filled: locate 7,1:
on z goto 210,189,220,189
210 nob=1: if fix(rnd*6)<=tre then pres=0: tre=0: x=1:ass=1: return
? "You refute their claims and join the      ":? "Power Elite" 

196 ?: ? "The advancement of The Great State":? " is now your primary concern..."; : 
 actt="Prestige will decrease ": nob=1: x=6:  tre=0:return

220 pres=max(pres-tre,3): tre=0: 
? "Your confession undoes all your work.": ? "You lose all of your network" : ? "and some of your Prestige...": x=6: return

160 ?"Your have repeatedly failed to serve":?"The Great State.":?"Your Treason has risen to such a level": ? "that you have become an Enemy of":? "The Great State" :? 
if pres=0 then ?"Your turn againstyour former":? "masters and become a Rebel Leader":? : goto 214
? "A warrant is issued for your immediate":?"apprehension...": 
''gosub 300: 
222 at 15*siz,140*siz: print "  Evade    "
at 110*siz,140*siz: print " Submit ": 
turn=0: gosub pick2:
rect 0,35*siz,160*siz,160*siz,15 filled: locate 7,1:
on z goto 230,222,240,222
230 ff=1: if fix(rnd*6)<=pres then tre=0: pres=0: x=1: ass=1: return
 
? "You escape to become a Rebel Leader.  ":? : 
214 ? "The collapse of The Great State":? " is now your primary concern..."; 
pres=0: ff=1: actp=actt: actt="Treason will decrease ": x=6: return

240 tre=max(tre-pres,3): pres=0: 
? "Under persecution you name your co- ": ? "conspirators, to save your own skin." :  ? "You lose all of your Prestige" : ? "and some of your network..."              : x=7: return

300 rect 5*siz,135*siz,58*siz,155*siz: 
 rect 100*siz,135*siz,150*siz,155*siz: return'
