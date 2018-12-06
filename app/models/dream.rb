class Dream < ActiveRecord::Base
  belongs_to :user
  has_many :dream_interpretations
  has_many :interpretations, through: :dream_interpretations

  def analyze
    self.interpretations.map do |int|
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
end
