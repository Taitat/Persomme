class PostsController < ApplicationController
  def index
    @characteristic_question = Characteristic.find(1)
    
  end
end
