class PostsController < ApplicationController
  def index
    characteristic_question
    @posts = Post.order("created_at DESC").limit(10)    
  end

  def create
    @question = Question.find(params[:question_id])
    @post = Post.new(user_id: current_user.id, question_id: @question.id)
    if @post.save
      redirect_to '/posts/create_complete'
    else
      render questions_path
    end

  end

  def show
    @question = Question.find(params[:question_id])
    @post = Post.find(params[:id])
    @comment = Comment.new
    @comments = Comment.all
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
  end




  def characteristic_question
    if user_signed_in?
      answered_characteristic_ids = UserCharacteristic.where(user_id: current_user.id).pluck(:characteristic_id)
    end
    
    @characteristic = Characteristic.where.not(id: answered_characteristic_ids).order("rand()").limit(1)[0]
    
  end

end
