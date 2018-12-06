class Interpretation < ActiveRecord::Base
  has_many :dream_interpretations
  has_many :dreams, through: :dream_interpretations
end
