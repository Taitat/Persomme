class Request < ApplicationRecord
  validates :user_id,:question_id, presence: true
  belongs_to :user, optional: true
  belongs_to :question, optional: true
end
