require 'rails_helper'

RSpec.describe Answer, type: :model do
  before do
    @answer = FactoryBot.build(:answer)
  end

  describe '回答作成' do
    context '回答作成がうまくいく時' do
      it '全ての項目が存在すれば作成できる' do
        expect(@answer).to be_valid
      end
    end

    context '回答作成がうまくいかない時' do
      it '内容が空のときは作成できない' do
        @answer.content = ""
        @answer.valid?
        expect(@answer.errors.full_messages).to include("Content can't be blank")
      end

      it '内容が55文字以下のときは作成できない' do
        @answer.content = Faker::Lorem.characters(number: 54)
        @answer.valid?
        expect(@answer.errors.full_messages).to include("Content is too short (minimum is 55 characters)")
      end
    end

  end
end