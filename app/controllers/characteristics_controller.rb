class CharacteristicsController < ApplicationController
  def index
    @characteristic = Characteristic.new
  end

  def create 
    @characteristic = Characteristic.new(characteristic_params)
    if @characteristic.save
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
