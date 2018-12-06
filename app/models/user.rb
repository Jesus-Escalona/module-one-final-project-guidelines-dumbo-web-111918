class User < ActiveRecord::Base
  has_many :dreams
  has_many :dream_interpretations, through: :dreams
  has_many :interpretations, through: :dream_interpretations
end
