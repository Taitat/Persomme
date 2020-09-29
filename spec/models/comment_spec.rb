require 'rails_helper'

RSpec.describe Characteristic, type: :model do
  before do
    @comment = FactoryBot.build(:comment)
    @post = FactoryBot.create(:post)
    @comment.post_id = @post.id
    @comment.user.save
    @comment.user_id = @comment.user.id
  end

  describe 'コメント作成' do
    context 'コメント作成がうまくいく時' do
      it '内容とユーザー、投稿が存在すれば作成できる' do
        expect(@comment).to be_valid
      end
    end

    context 'コメント作成がうまくいかない時' do
      it '内容が空のときは作成できない' do
        @comment.content = ""
        @comment.valid?
        expect(@comment.errors.full_messages).to include("Content can't be blank")
      end

      it '投稿がないときは作成できない' do
        @comment.post_id = ""
        @comment.valid?
        expect(@comment.errors.full_messages).to include("Post can't be blank")
      end

      it 'ユーザーがないときは作成できない' do
        @comment.user_id = ""
        @comment.valid?
        expect(@comment.errors.full_messages).to include("User can't be blank")
      end
    end

  end
end