


class User < ActiveRecord::Base


  has_many :dreams
  has_many :emotions, through: :dreams


end
