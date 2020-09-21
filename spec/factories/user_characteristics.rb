FactoryBot.define do
  factory :user_characteristic do
    user_id         {2}
    characteristic_id  {2}
    answer            {"y"}
    association :user
    association :characteristic
  end
end
