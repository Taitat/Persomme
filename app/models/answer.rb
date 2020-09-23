class Answer < ApplicationRecord

  validates :content,presence: true,length: {minimum: 10}
  belongs_to :user
  belongs_to :question
  has_one_attached :image
end
