class AnswersController < ApplicationController
  def index
    @answer_requests = Request.where(user_id: current_user.id)
  end
end
