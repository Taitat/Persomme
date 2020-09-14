class Post < ApplicationRecord
  validates :user_id,:question_id, presence: true

  belongs_to :question
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :favorites


  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
end
