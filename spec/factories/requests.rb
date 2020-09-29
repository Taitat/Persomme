FactoryBot.define do
  factory :request do
    association :user
    association :question
  end
end
