class PostsController < ApplicationController
  def index
    characteristic_question
    @posts = Post.order("created_at DESC").limit(10)    
  end

  def create
    @question = Question.find(params[:question_id])
    @post = Post.new(user_id: current_user.id, question_id: @question.id)
    if @post.save
      redirect_to questions_path
    else
      render question_path
    end

  end

  def show
    @question = Question.find(params[:id])
  end





  def characteristic_question
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
