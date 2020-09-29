require 'rails_helper'

RSpec.describe Characteristic, type: :model do
  before do
    @favorite = FactoryBot.build(:favorite)
    @post = FactoryBot.create(:post)
    @favorite.post_id = @post.id
    @favorite.user.save
    @favorite.user_id = @favorite.user.id
  end

  describe 'いいね作成' do
    context 'いいね作成がうまくいく時' do
      it '投稿とユーザーが存在すれば作成できる' do
        expect(@favorite).to be_valid
      end
    end

    context 'いいね作成がうまくいかない時' do
      it '投稿がないときは作成できない' do
        @favorite.post_id = ""
        @favorite.valid?
        expect(@favorite.errors.full_messages).to include("Post can't be blank")
      end

      it 'ユーザーがないときは作成できない' do
        @favorite.user_id = ""
        @favorite.valid?
        expect(@favorite.errors.full_messages).to include("User can't be blank")
      end
    end

  end
end