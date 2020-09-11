class Characteristic < ApplicationRecord
  has_many :users, through: :user_characteristics
  has_many :user_characteristics

  
end
