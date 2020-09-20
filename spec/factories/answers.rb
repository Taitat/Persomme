FactoryBot.define do
  factory :answer do
    content              {Faker::Lorem.characters(number: 55)}
    association :user
    association :question
  end
end
