require 'rails_helper'

RSpec.describe "Post", type: :request do
  before do
    @user = FactoryBot.create(:user)
    login_as(@user)
    @post = FactoryBot.build(:post)
    @question = FactoryBot.create(:question)
    @post.user_id = @user.id
    @post.question_id = @question.id
    @post.save
  end
    

  describe "GET #create" do
    it "いいねしていない場合、いいねできる" do
      expect do
        post post_favorites_path(@post), xhr: true
      end.to change(Favorite, :count).by(1)
    end
  end

  describe "GET #create" do
    it "いいねしている場合、いいね解除できる" do
      post post_favorites_path(@post), xhr: true
      @favorite = Favorite.find_by(post_id: @post.id,user_id: @user.id)
      expect do
        delete post_favorite_path(post_id: @post, id: @favorite.id), xhr: true
      end.to change(Favorite, :count).by(-1)
    end
  end

  
end
