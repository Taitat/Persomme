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
    @results = @p_c.result
    if @p_c.result.length < 50
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

def correct_user(user)
    if @user.id != current_user.id
      redirect_to root_path
    end
end



