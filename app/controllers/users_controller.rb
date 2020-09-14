class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    
  end

  def favorites
    favorites = Favorite.where(user_id: current_user.id).pluck(:post_id)
    @favorite_posts = Post.where(id: favorites)
   
  end

  def enchant
    @user_characteristic = UserCharacteristic.new(user_id: current_user.id, characteristic_id: params[:format],answer: params[:answer])
    if @user_characteristic.save
      redirect_to root_path
    else
      redirect_to root_path
    end
  end
end
