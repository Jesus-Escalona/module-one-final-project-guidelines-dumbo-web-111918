def barnum_effect
  barnum_array = [
"You have a great need for other people to like and admire you.",
"You have a great deal of unused capacity, which you have not turned to your advantage.",
"Disciplined and self-controlled outside, you tend to be worrisome and insecure inside.",
"You prefer a certain amount of change and variety and become dissatisfied when hemmed in by restrictions and limitations.",
"You pride yourself as an independent thinker and do not accept others statements without satisfactory proof.",
"You have a tendency to be critical of yourself.",
"At times you have serious doubts as to whether you have made the right decision or done the right thing.",
"At times you are extroverted, sociable, while at other times you are introverted, wary, reserved.",
"While you have some personality weaknesses, you are generally able to compensate for them.",
"Some of your aspirations tend to be pretty unrealistic.",
"Security is one of your major goals in life.",
"Patience and understanding are important values for you.",
"You have a tendency to spend more time thinking about people you've lost than you should.",
"You are fighting something internally... and you're not sure if you can win.",
"Your mind and body are often at odds... and balancing this tight rope is one of your major struggles.",
"You have a longing for adventure, but also a need for security.",
"Sometimes you feel like your mind is your enemy.",
"Often, you wonder, 'Why me?'",
"You spend a lot of time thinking about what could have been.",
"You are eager for new experiences, but feel overwhelmed by how many options there are.",
"You want to be best friends with Jerold."
]
  barnum_array.sample
end

def analyze(dream)
  dream.interpretations.map do |int|
    longer_anim("It seems like...")
    sleep 1
    longer_anim(int.barnum)
    if int.analysis.length > 0
      longer_anim("Furthermore, the presence of '#{int.keyword}' in your dream is very interesting...")
      sleep 1
      longer_anim("It means: #{int.analysis}")
      sleep 1
    end
  end
end
