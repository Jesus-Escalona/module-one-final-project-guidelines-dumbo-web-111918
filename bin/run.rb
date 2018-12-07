require_relative '../config/environment'
a = Artii::Base.new :font => 'doom'
puts a.asciify("Welcome to...")
puts "🌙✨🌙✨🌙✨🌙✨🌙✨🌙✨🌙✨🌙✨🌙✨🌙✨🌙✨🌙✨🌙✨🌙✨🌙✨🌙✨"
puts a.asciify("Dream Doctor")
pid = fork{ exec 'afplay', "/Users/rafael/Development/code/module-one-final-project-guidelines-dumbo-web-111918/bin/chants.mp3" }
#/Users/taimur/Bootcamp/One/module-one-final-project-guidelines-dumbo-web-111918/bin/
welcome
