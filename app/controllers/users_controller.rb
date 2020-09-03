class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def questions_list
  end

  def answer_requests
    @answer_requests = Request.where(user_id: current_user.id)
  end

end
