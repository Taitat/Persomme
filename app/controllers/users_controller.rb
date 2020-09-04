class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def questions_list
  end

end
