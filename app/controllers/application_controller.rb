class ApplicationController < ActionController::Base
  before_action :authenticate_user!, except: [:index,:show]
  before_action :configure_permitted_paramerters, if: :devise_controller?
  # before_action :basic_auth
  before_action :search_posts

  private

  def configure_permitted_paramerters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :image])
  end

  # def basic_auth
  #   authenticate_or_request_with_http_basic do |username, password|
  #     username == ENV["BASIC_AUTH_USER_P"] && password == ENV["BASIC_AUTH_PASSWORD_P"]
  #   end
  # end

  def search_posts
    @p = Post.ransack(params[:q])
  end
end
