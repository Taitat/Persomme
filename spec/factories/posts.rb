FactoryBot.define do
  factory :post do
    
    association :user
    association :question
  end
end
