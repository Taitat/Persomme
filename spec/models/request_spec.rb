require 'rails_helper'

RSpec.describe Characteristic, type: :model do
  before do
    @request = FactoryBot.build(:request)
    @request.question.save
    @request.question_id = @request.question.id
    @request.user.save
    @request.user_id = @request.user.id
  end

  describe 'リクエスト作成' do
    context 'リクエスト作成がうまくいく時' do
      it '質問とユーザーが存在すれば作成できる' do
        expect(@request).to be_valid
      end
    end

    context '投稿作成がうまくいかない時' do
      it '質問がないときは作成できない' do
        @request.question_id = ""
        @request.valid?
        expect(@request.errors.full_messages).to include("Question can't be blank")
      end

      it 'ユーザーがないときは作成できない' do
        @request.user_id = ""
        @request.valid?
        expect(@request.errors.full_messages).to include("User can't be blank")
      end
    end

  end
end