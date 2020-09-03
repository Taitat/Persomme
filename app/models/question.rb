class Question < ApplicationRecord

  has_one_attached :image
  has_many :requests
  belongs_to :user
end
