class FavoritesController < ApplicationController
  before_action :post_find
  
  def create
    favorite = current_user.favorites.build(post_id: params[:post_id])
    favorite.save
  end
  
  def destroy
    favorite = current_user.favorites.find_by(post_id: @post.id)
    favorite.destroy
  end

  private

  def post_find
    @post = Post.find(params[:post_id])
  end

end
