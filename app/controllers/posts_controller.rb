class PostsController < ApplicationController
  


  def index
    
    characteristic_question
    if @p.conditions.present?
      @posts = @p.result
    else
      genre_id = params[:id]
      if genre_id != nil
        question_ids = Question.where(genre_id: genre_id).pluck(:id)
        @posts = Post.order("created_at DESC").where(question_id: question_ids).limit(10)
      else    
        @posts = Post.order("created_at DESC").limit(10)

      end
    end
    
  end

  def search
    @posts = @p.result
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
    @comments = Comment.where(post_id: params[:id])
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
  end

  def create_complete
    @posts = Post.order("created_at DESC").limit(10)
  end


  def characteristic_question
    if user_signed_in?
      answered_characteristic_ids = UserCharacteristic.where(user_id: current_user.id).pluck(:characteristic_id)
    end
    
    @characteristic = Characteristic.where.not(id: answered_characteristic_ids).order("rand()").limit(1)[0]
    
  end

  def new_guest
    user = User.find_or_create_by!(email: 'guest@example.com') do |user|
      user.nickname = "Guest"
      user.password = "password0"
      user.password_confirmation = "password0"
      
      # user.confirmed_at = Time.now  # Confirmable を使用している場合は必要
    end
    
    sign_in user
    redirect_to root_path, notice: 'ゲストユーザーとしてログインしました。'
    
  end

  

end
