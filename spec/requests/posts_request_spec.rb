require 'rails_helper'

RSpec.describe "Post", type: :request do
  before do
    @user = FactoryBot.create(:user)
    login_as(@user)
    @question = FactoryBot.build(:question)
    @question.user_id = @user.id
    @question.save
  end
    

  describe "GET #index" do
    it "indexアクションにリクエストすると正常にレスポンスが返ってくる" do
      get root_path
      expect(response).to have_http_status(200)
    end

    it "ログインしていなくてもトップページが表示される" do
      logout
      get root_path
      expect(response).to have_http_status(200)
    end

    it "ログインしていない場合はログインボタンが表示される" do
      logout
      get root_path
      expect(response.body).to include "ログイン"
    end
  end

  describe "GET #create" do
    it "createアクションにリクエストすると正常にレスポンスが返ってくる" do
      post posts_path(user_id: @user.id, question_id: @question.id)
      expect(response).to have_http_status(302)
    end

    it "createアクションにリクエストし、成功すると完了ページにリダイレクトされる" do
      post posts_path(user_id: @user.id, question_id: @question.id)
      expect(response).to redirect_to posts_create_complete_path
    end
  end

  describe "GET #show" do
    before do
      @post2 = FactoryBot.build(:post)
      @post2.user_id = @user.id
      @post2.question_id = @question.id
      @post2.save
    end

    it "showアクションにリクエストすると正常にレスポンスが返ってくる" do
      get post_path(id: @post2.id, question_id: @post2.question_id)
      expect(response).to have_http_status(200)
    end

    it "createアクションにリクエストすると正常にレスポンスが返ってくる" do
      post posts_path(user_id: @user.id, question_id: @question.id)
      expect(response).to redirect_to posts_create_complete_path
    end
  end

  describe "GET #destroy" do
    before do
      @post2 = FactoryBot.build(:post)
      @post2.user_id = @user.id
      @post2.question_id = @question.id
      @post2.save
    end

    it "destroyアクションにリクエストすると正常にレスポンスが返ってくる" do
      delete post_path(id: @post2.id)
      expect(response).to have_http_status(200)
    end

    it "destroyアクションにリクエストするとレスポンスに削除完了のメッセージが表示されている" do
      delete post_path(id: @post2.id)
      expect(response.body).to include "削除が完了しました"
    end
    
  end

  


end