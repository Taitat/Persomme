require 'rails_helper'

RSpec.describe "Favorites", type: :request do
  association :post
  association :user
end
