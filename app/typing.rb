def anim(str)
  str.each_char do |a|
   # `afplay /System/Library/Sounds/Pop.aiff -t 0.05`
    print a
    slt = rand(0.02..0.04)
    sleep(slt)
  end
  print "\n"
  sltime
end

def longer_anim(str)
  str.each_char do |a|
   # `afplay /System/Library/Sounds/Pop.aiff -t 0.05`
    print a
    slt = rand(0.05..0.07)
    sleep(slt)
  end
  print "\n"
  sltime
end

def sltime
  time = rand(0.3..1)
  sleep(time)
end

def type(array_text)
  array_text.each do |n|
    anim(n)
  end
end
