require 'rails_helper'

RSpec.describe "Questions", type: :request do
  before do
    @user = FactoryBot.create(:user)
    login_as(@user)
    @question = FactoryBot.build(:question)
    @question.user_id = @user.id
    @question.save
    @characteristic = FactoryBot.create(:characteristic)
    @user_characteristics = FactoryBot.create(:user_characteristic)
    
  end

  describe "GET #index" do
    it "indexアクションにリクエストすると正常にレスポンスが返ってくる" do
      get questions_path(user_id: @user.id)
      expect(response).to have_http_status(200)
    end

    it "indexアクションにリクエストするとレスポンスに質問のタイトルが存在する" do
      get questions_path(user_id: @user.id)
      expect(response.body).to include @user.questions[0].title
    end

    it "ログインしていない場合はユーザー新規登録へリダイレクトされる" do
      logout
      get questions_path(user_id: @user.id)
      expect(response).to have_http_status(302)
    end
  end

  describe "GET #show" do
    it "showアクションにリクエストすると正常にレスポンスが返ってくる" do
      get question_path(user_id: @user.id,id: @question.id)
      expect(response).to have_http_status(200)
    end

    it "showアクションにリクエストするとレスポンスに質問のtitleが存在する" do
      get question_path(user_id: @user.id,id: @question.id)
      expect(response.body).to include @user.questions[0].title
    end

    it "showアクションにリクエストするとレスポンスに質問のcontentが存在する" do
      get question_path(user_id: @user.id,id: @question.id)
      expect(response.body).to include @user.questions[0].content
    end

    it "ログインしていない場合はユーザー新規登録へリダイレクトされる" do
      logout
      get question_path(user_id: @user.id,id: @question.id)
      expect(response).to have_http_status(302)
    end
  end

  describe "GET #search" do
    it "searchアクションにリクエストすると正常にレスポンスが返ってくる" do
      get questions_search_path(q: @characteristic.title)
      expect(response).to have_http_status(200)
    end

    it "searchアクションにリクエストするとレスポンスに検索ワードに一致したtitleが含まれる" do
      get questions_search_path(q: @characteristic.title)
      expect(response.body).to include @characteristic.title
    end

  end

  describe "GET #new" do
    it "newアクションにリクエストすると正常にレスポンスが返ってくる" do
      get new_question_path
      expect(response).to have_http_status(200)
    end

    it "ログインしていない場合はユーザー新規登録へリダイレクトされる" do
      logout
      get new_question_path
      expect(response).to have_http_status(302)
    end
  end

  describe "POST #create" do
    it "createアクションにリクエストすると正常にレスポンスが返ってくる" do
      post questions_path
      expect(response).to have_http_status(200)
    end
    it "createアクションにリクエストすると正常にレスポンスが返ってくる" do
      @question2 = FactoryBot.build(:question)
      post questions_path(title: @question2.title, content: @question2.content, genre_id: @question2.genre_id, user_id: @user.id,selected_ids: @user_characteristics.id)
      binding.pry
      expect(response).to redirect_to root_path
    end
  end


end
