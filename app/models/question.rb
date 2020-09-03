class Question < ApplicationRecord


  has_many :requests
  belongs_to :user
end
