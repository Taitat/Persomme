class UserCharacteristic < ApplicationRecord
  belongs_to :user
  belongs_to :characteristic
end
