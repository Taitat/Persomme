class CharacteristicsController < ApplicationController
  def index
    @characteristic = Characteristic.new
  end

  def create 
    @characteristic = Characteristic.new(name: params[:characteristic][:name])
    binding.pry
    if @characteristic.save
      redirect_to characteristics_path
    else
      render action: :index
    end

  end

end
