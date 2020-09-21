class QuestionsController < ApplicationController
  before_action :search_characteristic, only: [:new, :search, :create]
  before_action :move_to_index

  def index 
    @questions = Question.where(user_id: current_user.id)
  end

  def show
    @question = Question.find(params[:id])
    @answers = Answer.where(question_id: params[:id])
    @posted = Post.where(question_id: @question.id)
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
      ActiveRecord::Base.transaction do
      @question.save
      create_request()
      @user_ids_array.each{|user_id| Request.create!(request_params(user_id,@question.id))}
      binding.pry
    end
    redirect_to root_path 
    rescue => e
      binding.pry
    puts e.message
    render "questions/new"
    end
  end

 
def create_request
   selected_ids = params[:selected_ids]
   selected_ids_array = selected_ids.split(",")
   selected_ids_array.each do |selected_id|
     users = []
     @user_ids = []
     users = UserCharacteristic.where(characteristic_id: selected_id).where(answer: "y").where.not(user_id: current_user.id).pluck(:user_id)
     
     users.each do |user|
       @user_ids.push(user)
     end
   end
   
   if @user_ids != []
     
     @question.save
     @user_ids_array = @user_ids.uniq
     
   else
     return nil
   end
end
    
      
private
def question_params
  params.require(:question).permit(:title, :content, :genre_id, :image).merge(user_id: current_user.id)
end
def search_characteristic
  @p = Characteristic.ransack(params[:q])
end
def request_params(user_id,question_id)
  params.permit().merge(question_id: question_id, user_id: user_id, selected_ids: params[:selected_ids])
end

def move_to_index
  unless user_signed_in?
    redirect_to new_user_registration_path
  end
end
