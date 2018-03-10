option predef load modules
import android

dim lights(11)

sub init
  local i
  for i = 0 to len(lights) - 1
    lights[i] = false
  next i
end

func orange(vr)
  return rgb(0x9f, 128 - 5 * vr, 0)
end  

func green(vr)
  return rgb(0, 128 - 4 * vr, 0)
end  

func blue(vr)
  return rgb(0, 0, 255 - 5 * vr)
end  

sub ball(x, y, size, lit, fn)
  local r, c, vr
  local nstep = size / 25

  for r = size to 1 step - nstep
    vr = r * 25 / size
    if (lit) then
      c = call(fn, vr)
    else
      c = 255 - 4 * vr
      c = rgb(c, c, c)
    endif
    circle x, y, r, 1, c filled
  next
end

' outer : orange
' inner : green
' center: blue
sub show
  local x = xmax / 2
  local y = ymax / 2
  local s1 = xmax / 15
  local s2 = s1 * .7
  local s3 = s2 * .7
  local i

  ball(x, y, s1, lights[5], @blue)
  x -= s1 * 2
  ball(x, y, s2, lights[4], @green)
  x -= s2 * 2
  for i = 3 to 0 step - 1
    ball(x, y, s3, lights[i], @orange)
    x -= s1 * 1.1
  next i

  x = xmax / 2 + s1 * 2
  ball(x, y, s2, lights[6], @green)
  x += s2 * 2
  for i = 7 to 10
    ball(x, y, s3, lights[i], @orange)
    x += s1 * 1.1
  next i
end

sub go()
  local i = 0
  local j = 0

  lights[j] = true

  android.sensor_on(0)
  android.tts_pitch(0.8)
  score=0
  while 1
    s=android.sensor
    m= sqr(s.x*s.x + s.y*s.y + s.z*s.z)
    if m >9.8 then 
      if j == 6 then
        android.tts_pitch(2)
        android.speak("you killed it")
        score +=10
        android.tts_pitch(2.3)
        android.speak(score + " points")
      else if j== 5 or j== 7 then
        android.tts_pitch(.4)
        android.speak("that, wasnt so bad")
      else
        android.tts_pitch(.8)
        android.speak("pull your self together laddie")
      endif
      pause 20
    endif
    cls
    show()
    showpage
    
    lights[j] = false
    j = (j + 1) mod 11
    lights[j] = true
  wend
end

init()
go()