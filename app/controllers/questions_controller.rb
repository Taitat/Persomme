class QuestionsController < ApplicationController


  def new
    @question = Question.new
    
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      create_request()
      redirect_to root_path  
    else
      render action: :new
    end

  end
  
  def create_request
    user_ids = User.order("rand()").limit(100).pluck(:id)
    user_ids.each{|user_id| Request.create(question_id: @question.id, user_id: user_id)}
  end

  private

  def question_params
    params.require(:question).permit(:title, :content, :genre_id, :image).merge(user_id: current_user.id)
  end


end
