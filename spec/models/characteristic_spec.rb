require 'rails_helper'

RSpec.describe Characteristic, type: :model do
  before do
    @characteristic = FactoryBot.build(:characteristic)
  end

  describe 'ペルソナアンケート作成' do
    context 'ペルソナアンケート作成がうまくいく時' do
      it 'nameが存在すれば作成できる' do
        expect(@characteristic).to be_valid
      end
    end

    context 'ペルソナアンケート作成がうまくいかない時' do
      it 'nameが空のときは作成できない' do
        @characteristic.name = ""
        @characteristic.valid?
        expect(@characteristic.errors.full_messages).to include("Name can't be blank")
      end
    end

  end
end