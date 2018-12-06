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
  analysis = html_doc.css('.symbol_term + p, .symbol ul *').text
  analysis = analysis.gsub(/\n/," ")
  analysis = analysis.gsub(/\r/," ")
  analysis = analysis.gsub(/\"/," ")
  binding.pry
  analysis = analysis.include?("represent:") && analysis + "#{emotion}"
    rescue RestClient::ExceptionWithResponse => err
    puts " #{key[0]}... not very significant."
    sleep 1
  end

  #Interpretation.create(keyword: key)
end

end
