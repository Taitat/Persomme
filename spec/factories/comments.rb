FactoryBot.define do
  factory :comment do
    content         {Faker::Lorem.characters(number: 55)}
    association :post
    association :user
  end
end
