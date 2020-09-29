require 'rails_helper'
RSpec.describe Question, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @question = FactoryBot.build(:question)
    @request = FactoryBot.build(:request)
  end

  describe '質問新規作成' do
    context '質問作成がうまくいく時' do
      it '全ての項目が存在すれば作成できる' do
        expect(@question).to be_valid
      end
    end

    context '質問作成がうまくいかないとき' do
      it 'ペルソナが空の時は作成できない' do
        @request.user_id = ""
        
        ActiveRecord::Base.transaction do
          @question.save
          @request.question_id = @question.id
          @request.save!
        end
        rescue => e
          expect(e.message).to include("Mysql2::Error: Field 'user_id' doesn't have a default value")
      end

      it 'ユーザーがないときは作成できない' do
        @question.genre_id= ""
        @question.valid?
        expect(@question.errors.full_messages).to include("Genre can't be blank")
      end

      it 'タイトルが空のときは作成できない' do
        @question.title= ""
        @question.valid?
        expect(@question.errors.full_messages).to include("Title can't be blank")
      end
      
      it 'タイトルが55文字以上のときは作成できない' do
        @question.title = Faker::Lorem.characters(number: 56)
        @question.valid?
        expect(@question.errors.full_messages).to include("Title is too long (maximum is 55 characters)")
      end

      it '内容が空のときは作成できない' do
        @question.content= ""
        @question.valid?
        expect(@question.errors.full_messages).to include("Content can't be blank")
      end

      it '内容15文字以下のときは作成できない' do
        @question.content = Faker::Lorem.characters(number: 14)
        @question.valid?
        expect(@question.errors.full_messages).to include("Content is too short (minimum is 15 characters)")
      end
      
    end
  end
end