FactoryBot.define do
  factory :user_characteristic do
    answer            {"y"}
    association :user
    association :characteristic
  end
end
