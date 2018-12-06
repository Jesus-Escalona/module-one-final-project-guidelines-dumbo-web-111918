require 'indico'
require 'rest-client'
require 'nokogiri'


def get_data(user, dream)
  Indico.api_key =  '7031e809bef3cb07ca04fcbf9eeca2f7'
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
      analysis = analysis.gsub(/\n/," ").gsub(/\r/," ").gsub(/\"/," ").split(/(?<!\s)(?=[A-Z])/).join(". ")
      if analysis.include?("represent:")
        analysis = analysis.split(":").first
        analysis = analysis + ": #{emotion}."
      end
      interpretation = Interpretation.create(keyword: key[0], analysis: analysis)
      interpretation.barnum = barnum_effect
      dream.interpretations << interpretation
    rescue RestClient::ExceptionWithResponse => err
      puts " #{key[0]}... not very significant."
      sleep 1
    end
  end
  dream.analyze
  sleep 3
logged_menu(user)
end
