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
    describe "GET #create" do
      it "createアクションにリクエストすると正常にレスポンスが返ってくる" do
        post post_comments_path(user_id: @user.id, post_id: @post.id, comment: {content:"aaaaaaaaa"})
        expect(response).to have_http_status(302)
      end
  
      it "createアクションにリクエストすると投稿詳細ページにリダイレクトされる" do
        post post_comments_path(user_id: @user.id, post_id: @post.id, comment: {content:"aaaaaaaaa"})
        expect(response).to redirect_to post_path(id: @post.id,question_id: @question.id)
      end
    end
  end

  describe "GET #destroy" do
    before do
      @comment = FactoryBot.create(:comment)
      @post.id = @comment.post_id
      @question.id = @comment.post.question_id
    end

    it "destroyアクションにリクエストすると正常にレスポンスが返ってくる" do  
      delete post_comment_path(post_id: @post.id, id: @comment.id)
      expect(response).to have_http_status(302)
    end

    it "destroyアクションにリクエストすると投稿詳細ページにリダイレクトされる" do
      delete post_comment_path(post_id: @post.id, id: @comment.id)
      expect(response).to redirect_to post_path(id: @post.id,question_id: @question.id)
    end
  end

  
end