require 'rails_helper'

RSpec.describe Characteristic, type: :model do
  before do
    @user_characteristic = FactoryBot.build(:user_characteristic)
    @user_characteristic.user.save
    @user_characteristic.user_id = @user_characteristic.user.id
    @user_characteristic.characteristic.save
    @user_characteristic.characteristic_id = @user_characteristic.characteristic.id
  end

  describe 'ユーザー属性付与' do
    context '属性付与がうまくいく時' do
      it '属性とユーザー、回答が存在すれば作成できる' do
        expect(@user_characteristic).to be_valid
      end
    end

    context '投稿作成がうまくいかない時' do
      it '属性がないときは作成できない' do
        @user_characteristic.characteristic_id = ""
        @user_characteristic.valid?
        expect(@user_characteristic.errors.full_messages).to include("Characteristic can't be blank")
      end

      it 'ユーザーがないときは作成できない' do
        @user_characteristic.user_id = ""
        @user_characteristic.valid?
        expect(@user_characteristic.errors.full_messages).to include("User can't be blank")
      end

      it '回答がないときは作成できない' do
        @user_characteristic.answer = ""
        @user_characteristic.valid?
        expect(@user_characteristic.errors.full_messages).to include("Answer can't be blank")
      end

      
    end

  end
end