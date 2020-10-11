class QuestionsController < ApplicationController
  before_action :search_characteristic, only: [:new, :search, :create]
  before_action :authenticate_user!
  

  def index 
    @questions = Question.where(user_id: current_user.id)
  end

  def show
    @question = Question.find(params[:id])
    @user = @question.user
    @answers = Answer.where(question_id: params[:id])
    @posted = Post.where(question_id: @question.id)
    correct_user(@user)
  end


  def search
    results = @p_c.result
    if @p_c.result.length < 50
      render json:  {results: results}
    end
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
      ActiveRecord::Base.transaction do
        create_request()
        @user_ids_array.each{|user_id| Request.create!(request_params(user_id,@question.id))}
      end
    redirect_to root_path 
    rescue => e
      puts e.message
      render "questions/new"
    end
  end


  private

  def question_params
    params.require(:question).permit(:title, :content, :genre_id, :image).merge(user_id: current_user.id)
  end

  def search_characteristic
    @p_c = Characteristic.ransack(params[:p])
  end

  def request_params(user_id,question_id)
    params.permit().merge(question_id: question_id, user_id: user_id, selected_ids: params[:selected_ids])
  end

  def create_request
    selected_ids = params[:selected_ids]
    selected_ids_array = selected_ids.split(",")
    @receiving_users = []
    users = []
    selected_ids_array.each do |selected_id|
      if @receiving_users == []
        users = UserCharacteristic.where(characteristic_id: selected_id).where(answer: "y").where.not(user_id: current_user.id)
      else
        users = @receiving_users.select{|u| u.characteristic_id = selected_id}
      end
      users.each do |user|
        @receiving_users.push(user)
      end
    end
    if @receiving_user != []
      @question.save
      @user_ids_array = @receiving_users.pluck(:user_id).uniq
    else
      return nil
    end
  end

  def correct_user(user)
    redirect_to root_path if @user.id != current_user.id
  end



