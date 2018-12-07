class Dream < ActiveRecord::Base
  belongs_to :user
  has_many :dream_interpretations
  has_many :interpretations, through: :dream_interpretations

  def analyze
    barnum_connector = ["It seems like...", "I found...", "I am certain..."]
    also = ["Also: ", "It means: ", "Hmmmm... seems like: ", "Oh! Let me tell you more: "]
    self.interpretations.map do |int|
      longer_anim(barnum_connector.sample)
      sleep 1
      longer_anim(int.barnum)
      if int.analysis.length > 0
        longer_anim("Furthermore, the presence of '#{int.keyword}' in your dream is very interesting...")
        sleep 1
        longer_anim("#{also.sample} #{int.analysis}")
        sleep 1
      end
    end
  end
end
