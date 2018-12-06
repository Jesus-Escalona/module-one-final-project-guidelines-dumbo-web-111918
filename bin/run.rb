require_relative '../config/environment'
a = Artii::Base.new :font => 'doom'
puts a.asciify("Welcome to...")
puts a.asciify("Dream Doctor")
binding.pry
welcome

