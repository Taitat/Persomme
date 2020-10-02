class AnswersController < ApplicationController
  before_action :correct_user, only: [:index, :show, :create]
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
    @request = Request.where(user_id: current_user.id).where(question_id: @answer.question.id)
    if @answer.save
      redirect_to user_answers_path
    else
      redirect_to user_answer_path(user_id: @answer.user_id, id: @request.ids[0])

      # 送信内容を保持する場合
      # @answer_request = Request.find(answer_params[:question_id])
      # @answer = Answer.new
      # @user = User.find(answer_params[:user_id])
      # @question = Question.find(@answer_request.question_id)
    end
  end


  private
  def answer_params
    params.require(:answer).permit(:content,:question_id, :image).merge(user_id: params[:user_id])
  end

  def correct_user
    @user = User.find(params[:user_id])
      redirect_to(root_path) if current_user != @user
  end

end
