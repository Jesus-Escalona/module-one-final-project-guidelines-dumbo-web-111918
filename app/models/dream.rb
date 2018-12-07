class Dream < ActiveRecord::Base
  belongs_to :user
  has_many :dream_interpretations
  has_many :interpretations, through: :dream_interpretations

  def analyze
    barnum_connector = ["It seems like...", "I found...", "I am certain..."]
    also = ["Also: ", "It means: ", "Hmmmm... seems like: ", "Oh! Let me tell you more. Here's what this means: "]
    self.interpretations.map do |int|
      array = ["Furthermore, the presence of '#{int.keyword}' in your dream is very interesting...", "Regarding '#{int.keyword}'... here's what I can tell you:", "'#{int.keyword}'... '#{int.keyword}'... '#{int.keyword}'... " ]
      longer_anim(barnum_connector.sample)
      sleep 1
      longer_anim(int.barnum)
      if int.analysis.length > 0
        longer_anim(array.sample)
        sleep 1
        longer_anim("#{also.sample} #{int.analysis}")
        sleep 1
      end
    end
  end
end
