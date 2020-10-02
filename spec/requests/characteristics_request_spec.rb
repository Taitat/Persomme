require 'rails_helper'

RSpec.describe "Characteristic", type: :request do
  before do
    @user = FactoryBot.create(:user)
    login_as(@user)
    @characteristic = FactoryBot.create(:characteristic)
    @user_characteristics = FactoryBot.build(:user_characteristic)
    @user_characteristics.user_id = @user.id
    @user_characteristics.characteristic_id = @characteristic.id
    @user_characteristics.save

    
  end

  describe "GET #index" do
    it "indexアクションにリクエストすると正常にレスポンスが返ってくる" do
      get characteristics_path
      expect(response).to have_http_status(200)
    end

    it "indexアクションにリクエストするとレスポンスに設定したペルソナが存在する" do
      get characteristics_path
      expect(response.body).to include  @user.characteristics[0].title
    end

    it "ログインしていない場合はユーザー新規登録へリダイレクトされる" do
      logout
      get characteristics_path
      expect(response).to redirect_to new_user_session_path
    end
  end

  describe "GET #create" do
    it "createアクションにリクエストすると正常にレスポンスが返ってくる" do
      post characteristics_path(characteristic: {name: "aaaaaaaaaaa"})
      expect(response).to have_http_status(302)
    end

    it "createアクションにリクエストし、成功するとペルソナ一覧ページへリダイレクトされる" do
      post characteristics_path(characteristic: {name: "aaaaaaaaaaa"})
      expect(response).to redirect_to characteristics_path
    end
  end

  


end
