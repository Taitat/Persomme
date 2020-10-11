class Question < ApplicationRecord

  validates :title, :content, :genre_id, presence: true
  validates :genre_id, numericality: {other_than: 1}
  validates :title, length: {maximum: 55}
  validates :content, length: {minimum: 15}

  has_one_attached :image,dependent: :destroy
  has_many :requests
  has_many :answers
  has_one :post
  belongs_to :user

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :genre
  
end
