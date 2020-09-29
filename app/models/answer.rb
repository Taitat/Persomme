class Answer < ApplicationRecord

  validates :content,presence: true,length: {minimum: 10}
  validates :user_id, :question_id, presence: true
  belongs_to :user
  belongs_to :question
  has_one_attached :image
end
