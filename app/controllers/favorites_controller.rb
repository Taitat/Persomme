class FavoritesController < ApplicationController
  before_action :post_and_question
  
  def create
    favorite = current_user.favorites.build(post_id: params[:post_id])
    favorite.save
    # redirect_to post_path(id: params[:post_id],question_id: @question.id)
  end
  def destroy
    favorite = Favorite.find_by(post_id: params[:post_id], user_id: current_user.id)
    favorite.destroy
    # redirect_to post_path(id: params[:post_id], question_id: @question.id)
  end

  private

  def post_and_question
    @post = Post.find(params[:post_id])
    @question = Question.find(@post.question.id)
  end

end
