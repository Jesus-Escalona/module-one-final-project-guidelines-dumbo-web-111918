class Dream < ActiveRecord::Base
  belongs_to :user
  has_many :dream_interpretations
  has_many :interpretations, through: :dream_interpretations
end
