class UserCharacteristic < ApplicationRecord
  validates :user_id, :characteristic_id, :answer, presence: true
  belongs_to :user
  belongs_to :characteristic
end
