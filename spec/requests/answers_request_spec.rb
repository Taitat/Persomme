require 'rails_helper'

RSpec.describe "Answer", type: :request do
  before do
    @user = FactoryBot.create(:user)
    @user2 = FactoryBot.create(:user)
    login_as(@user)

    @question = FactoryBot.create(:question)

    @user_characteristic = FactoryBot.create(:user_characteristic)
    @user_characteristic.user_id = @user.id

    @request = FactoryBot.build(:request)
    @request.user_id = @user.id
    @request.selected_ids = @user_characteristic.characteristic_id
    @request.question_id = @question.id
    @request.save

    @answer = FactoryBot.build(:answer)
    @answer.user_id = @user.id
    @answer.question_id = @question.id
    
  end

  describe "GET #index" do
    it "indexアクションにリクエストすると正常にレスポンスが返ってくる" do
      get user_answers_path(user_id: @user.id)
      expect(response).to have_http_status(200)
    end

    it "indexアクションにリクエストするとレスポンスに回答依頼のタイトルが存在する" do
      get user_answers_path(user_id: @user.id)
      expect(response.body).to include  @user.requests[0].question.title
    end

    it "ログインしていない場合はトップページへリダイレクトされる" do
      logout
      get user_answers_path(user_id: @user.id)
      expect(response).to redirect_to root_path
    end

    it "ログインユーザーが一致しない場合はトップページへリダイレクトされる" do
      logout
      login_as(@user2)
      get user_answers_path(user_id: @user.id)
      expect(response).to redirect_to root_path
    end
  end

  describe "GET #show" do
    it "showアクションにリクエストすると正常にレスポンスが返ってくる" do
      get user_answer_path(@user.id,@request.id)
      expect(response).to have_http_status(200)
    end

    it "showアクションにリクエストするとレスポンスに回答依頼の内容が存在する" do
      get user_answer_path(@user.id,@request.id)
      expect(response.body).to include @user.requests[0].question.content
    end

    it "showアクションにリクエストするとレスポンスに回答ボタンが存在する" do
      get user_answer_path(@user.id,@request.id)
      expect(response.body).to include "回答する"
    end

    it "ログインしていない場合はトップページへリダイレクトされる" do
      logout
      get user_answer_path(@user.id,@request.id)
      expect(response).to redirect_to root_path
    end

    it "ログインユーザーが一致しない場合はトップページへリダイレクトされる" do
      logout
      login_as(@user2)
      get user_answer_path(@user.id,@request.id)
      expect(response).to redirect_to root_path
    end
  end

  describe "POST #create" do
    it "createアクションにリクエストすると正常にレスポンスが返ってくる" do
      post user_answers_path(user_id: @answer.user_id, answer: {question_id: @answer.question_id, content: @answer.content})
      
      expect(response).to have_http_status(302)
    end
  
    it "createアクションにリクエストして投稿に成功すると回答依頼一覧ページにリダイレクトされる" do
      post user_answers_path(user_id: @answer.user_id, answer: {question_id: @answer.question_id, content: @answer.content})
      expect(response).to redirect_to user_answers_path
    end

    it "createアクションにリクエストして投稿に失敗すると回答依頼一覧ページにリダイレクトされる" do
      post user_answers_path(user_id: @answer.user_id, answer: {question_id: @answer.question_id, content: ""})
      expect(response).to redirect_to user_answer_path(id:  @answer.question.requests.ids[0])
    end
  end


end