require 'rails_helper'

RSpec.describe Characteristic, type: :model do
  before do
    @post = FactoryBot.build(:post)
    @post.question.save
    @post.user.save
    @post.user_id = @post.user.id
  end

  describe '投稿作成' do
    context '投稿作成がうまくいく時' do
      it '質問とユーザーが存在すれば作成できる' do
        expect(@post).to be_valid
      end
    end

    context '投稿作成がうまくいかない時' do
      it '質問がないときは作成できない' do
        @post.question_id = ""
        @post.valid?
        expect(@post.errors.full_messages).to include("Question can't be blank")
      end

      it 'ユーザーがないときは作成できない' do
        @post.user_id = ""
        @post.valid?
        expect(@post.errors.full_messages).to include("User can't be blank")
      end
    end

  end
end