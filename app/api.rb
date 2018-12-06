require 'indico'
def get_data(text)
  puts "Thinking"
Indico.api_key =  '7031e809bef3cb07ca04fcbf9eeca2f7'

# single example
emotions = Indico.emotion(text)
emotion = emotions.sort_by {|k, v| v}.last[0]

keywords = Indico.keywords(text, {version: 4})
binding.pry
end
