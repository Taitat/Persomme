class Question < ApplicationRecord

  validates :title, :content, :genre_id, presence: true
  validates :genre_id, numericality: {other_than: 1}
  validates :title, length: {maximum: 55}
  validates :content, length: {minimum: 15}
  # validate :request_presence

  has_one_attached :image
  has_many :requests
  has_many :answers
  has_one :post
  belongs_to :user

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :genre

  # def request_presence

  #   binding.pry
  #   unless self.requests.present?
  #     errors.add(:request, "can't be blank")
  #   end
  # end
end
