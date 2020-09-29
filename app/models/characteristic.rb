class Characteristic < ApplicationRecord
  validates :name, presence: true
  
  has_many :user_characteristics
  has_many :users, through: :user_characteristics

  
end
