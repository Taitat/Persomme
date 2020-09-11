class PostsController < ApplicationController
  def index
    if user_signed_in?
      answered_characteristic = UserCharacteristic.where(user_id: current_user.id)
      answered_characteristic_ids = []
      answered_characteristic.each do |char|
      answered_characteristic_ids.push(char.characteristic_id)
      end
    
    @characteristic = Characteristic.where.not(id: answered_characteristic_ids).order("rand()").limit(1)[0]
    end
  end
end
