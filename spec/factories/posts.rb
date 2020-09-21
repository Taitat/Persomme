FactoryBot.define do
  factory :post do
    user_id         {1}
    question_id     {1}
    association :user
    association :question
  end
end
