class QuestionsController < ApplicationController
  before_action :search_characteristic, only: [:new, :search, :create]

  def index 
    @questions = Question.where(user_id: current_user.id)
  end

  def show
    @question = Question.find(params[:id])
    @answers = Answer.where(question_id: params[:id])
  end


  def search
    @results = @p.result
    if @p.result.length < 50
    render json:  {results: @results}
    end
       
  end

  def new
    @question = Question.new
    @characterictic = Characteristic.all
  end

  def create
    @question = Question.new(question_params)
    if @question.save && (params[:selected_ids] != "")
      create_request()
      redirect_to root_path  
    else
      render action: :new
    end
  end
  
  def create_request
    selected_ids = params[:selected_ids]
    selected_ids_array = selected_ids.split(",")
    selected_ids_array.each do |selected_id|
      user_ids = UserCharacteristic.where(characteristic_id: selected_id).where(answer: "y").where.not(id: current_user.id).pluck(:user_id)
      @user_ids_array = user_ids.uniq
    end
    @user_ids_array.each{|user_id| Request.create(question_id: @question.id, user_id: user_id)}
  end

  


  private

  def question_params
    params.require(:question).permit(:title, :content, :genre_id, :image).merge(user_id: current_user.id)
  end

  def search_characteristic
    @p = Characteristic.ransack(params[:q])
  end


end
