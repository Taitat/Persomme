class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def questions_list
  end

  def answer_requests
  end

end
