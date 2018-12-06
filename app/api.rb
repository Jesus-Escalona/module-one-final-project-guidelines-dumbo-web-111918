require 'indico'
require 'rest-client'
require 'nokogiri'
def get_data(dream)
Indico.api_key =  '7031e809bef3cb07ca04fcbf9eeca2f7'

# single example
emotions = Indico.emotion(dream.content)
anim("Thinking")
emotion = emotions.sort_by {|k, v| v}.last[0]
keywords = Indico.keywords(dream.content, {version: 4})
anim("I think I got something from that")

keywords.each do |key|
  payload = {search: key[0]}
  begin
  response = RestClient.post("http://www.mydreamvisions.com/dreamdictionary/", payload, headers={})
  html_doc = Nokogiri::HTML(response)
  analysis = html_doc.css('.symbol').text
    rescue RestClient::ExceptionWithResponse => err
    puts "This is embarasing, but I could not get anything from that..."
  end

  #Interpretation.create(keyword: key)
end

end
