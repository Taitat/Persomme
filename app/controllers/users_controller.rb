class UsersController < ApplicationController
  before_action :correct_user, only: [:show, :favorite]
  
  def show
    @user = User.find(params[:id])
    render status: 200
  end

  def favorites
    favorites = Favorite.where(user_id: params[:id]).pluck(:post_id)
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

  private

  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_path) if current_user != @user
  end
end
