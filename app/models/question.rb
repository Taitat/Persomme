class Question < ApplicationRecord

  validates :title, :content, :genre_id, presence: true
  validates :genre_id, numericality: {other_than: 1}

  has_one_attached :image
  has_many :requests
  belongs_to :user

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :genre
end
