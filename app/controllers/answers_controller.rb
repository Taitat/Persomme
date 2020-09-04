class AnswersController < ApplicationController
  def index
    @answer_requests = Request.where(user_id: current_user.id)
  end

  def show
    @answer_request = Request.find(params[:id])
    @answer = Answer.new
    @user = User.find(params[:user_id])
    @question = Question.find(@answer_request.question_id)
  end

  def create
    @answer = Answer.new(answer_params)
    if @answer.save
      redirect_to user_answers_path
    else
      redirect_to user_answer_path(id: answer_params[:question_id])

      # 送信内容を保持する場合
      # @answer_request = Request.find(answer_params[:question_id])
      # @answer = Answer.new
      # @user = User.find(answer_params[:user_id])
      # @question = Question.find(@answer_request.question_id)
    end
  end


  private
  def answer_params
    params.require(:answer).permit(:content,:question_id).merge(user_id: params[:user_id])
  end

end
