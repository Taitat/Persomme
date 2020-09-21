require 'rails_helper'

RSpec.describe "UsersController", type: :request do
  before do
    @user_1 = FactoryBot.create(:user)
    login_as(@user_1)
    @question = FactoryBot.create(:question)
    @post = FactoryBot.create(:post)
    @characteristic = FactoryBot.create(:characteristic) 

    favorite = FactoryBot.create(:favorite)
    favorite.user_id = @user_1.id
    favorite.post_id = @post.id
    favorite.save
    
  end
  
  
  describe "GET #show" do
    it "showアクションにリクエストすると正常にレスポンスが返ってくる" do
      get user_path(@user_1)
      expect(response).to have_http_status(200)
    end

    it "showアクションにリクエストするとレスポンスにユーザー名が存在する" do
      get user_path(@user_1)
      expect(response.body).to include @user_1.nickname
    end

  end

  describe "GET #favorites" do
    it "favoritesアクションにリクエストすると正常にレスポンスが返ってくる" do
      get  favorites_user_path(id: @user_1.id)
      expect(response).to have_http_status(200)
    end

    it "favoritesアクションにリクエストするとレスポンスにユーザーがいいねした投稿が存在する" do
      get  favorites_user_path(@user_1)
      expect(response.body).to include @user_1.favorites[0].post.question.title
    end

  end

  describe "GET #enchant" do
    it "favoritesアクションにリクエストすると正常にレスポンスが返ってくる" do
      post  users_enchant_path(user_id: @user_1.id, characteristic_id: @characteristic.id, answer: "y")
      expect(response).to have_http_status(302)
    end
  end
end

