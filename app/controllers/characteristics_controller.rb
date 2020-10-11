class CharacteristicsController < ApplicationController
  before_action :authenticate_user!

  def index
    @characteristic = Characteristic.new
    yes_ids = UserCharacteristic.where(user_id: current_user.id).where(answer: "y").pluck(:characteristic_id)
    no_ids = UserCharacteristic.where(user_id: current_user.id).where(answer: "n").pluck(:characteristic_id)
    @characteristics_yes = Characteristic.where(id: yes_ids)
    @characteristics_no = Characteristic.where(id: no_ids)
  end

  def create 
    characteristic = Characteristic.new(characteristic_params)
    if characteristic.save
      redirect_to characteristics_path
    else
      render action: :index
    end
  end

  private

  def characteristic_params
    params.require(:characteristic).permit(:name)
  end

end
