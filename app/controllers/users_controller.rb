class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def enchant
    User_characteristic.create(user_id: current_user.id, characteristic_id: )
  end
end
