class Interpretation < ActiveRecord::Base
  has_many :dreams
  has_many :users, through: :dream_interpretation
end
